# Django imports
from logging import exception
from django.contrib.auth import authenticate, login
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from rest_framework.decorators import api_view, permission_classes
from django.conf import settings
from django.db import transaction, IntegrityError
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import update_session_auth_hash
from base.utils import *

# Django models
from account.models import *
from .models import Otp
import os

# Third-party imports
from rest_framework import status, permissions
from rest_framework.views import APIView
from rest_framework import generics
from rest_framework.response import Response
from oauth2_provider.models import AccessToken, RefreshToken, Application
from oauthlib.common import generate_token
import requests
import datetime


# Serializers
from .serializers import *
from base.utils import *


@method_decorator(csrf_exempt, name="dispatch")
class LoginView(generics.GenericAPIView):
    serializer_class = LoginSerializer

    def post(self, request):
        try:
            serializer = self.get_serializer(data=request.data)
            if not serializer.is_valid():
                return error_response(
                    message={
                        "message": "Invalid input data",
                        "errors": serializer.errors,
                    },
                    status_code=status.HTTP_400_BAD_REQUEST,
                )

            user = serializer.validated_data["user"]
            user_otp = generate_otp(user.user_id)
            send_otp_email(user.email, user.username, otp=user_otp)
            # Implement SMS sending if needed
            # user_otp.send_sms(request.data.get('phone_number'))

            response_data = {
                "username_or_email": request.data.get("username_or_email"),
                "code": user_otp.code,
                "expiry_time": user_otp.expiry_time.isoformat(),
            }
            return success_response(
                message="Successfully Logged in",
                data=response_data,
                status_code=status.HTTP_200_OK,
            )
        except Exception as e:
            return error_response(
                message=str(e),
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


def generate_otp(user_id):
    user_otp, created = Otp.objects.get_or_create(user_id=user_id)
    if not created:
        user_otp.code = Otp.generate_code()
        user_otp.expiry_time = timezone.now() + datetime.timedelta(minutes=10)
        user_otp.is_verify = False
        user_otp.save()
    return user_otp


class LoginWithOtpView(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request):
        serializer = OtpLoginSerializer(data=request.data)
        if serializer.is_valid():
            username_or_email = serializer.data.get("username_or_email")
            code = serializer.data.get("code")

            user = User.objects.filter(username=username_or_email).first()
            if not user:
                user = User.objects.filter(email=username_or_email).first()

            if not user:
                return error_response(
                    message="Invalid Input", status_code=status.HTTP_400_BAD_REQUEST
                )

            user_otp = Otp.objects.filter(user_id=user.user_id, code=code).first()
            now = timezone.now()

            if not user_otp:
                return error_response(
                    message="Invalid code",
                    status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
                )
            elif now > user_otp.expiry_time:
                return error_response(
                    message="Code expired",
                    status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
                )

            user_otp.expiry_time = now
            user_otp.is_verify = True
            user_otp.save()

            backend = "django.contrib.auth.backends.ModelBackend"
            user.backend = backend
            login(request, user, backend=backend)

            application = Application.objects.get(name="Backend")
            expires = now + datetime.timedelta(
                seconds=settings.OAUTH2_PROVIDER["ACCESS_TOKEN_EXPIRE_SECONDS"]
            )
            access_token = AccessToken.objects.create(
                user=user,
                scope="read write",
                expires=expires,
                token=generate_token(),
                application=application,
            )

            refresh_token = RefreshToken.objects.create(
                user=user,
                token=generate_token(),
                access_token=access_token,
                application=application,
            )

            response = {
                "user_name": user.username,
                "email": user.email,
                "access_token": access_token.token,
                "refresh_token": refresh_token.token,
                "token_type": "Bearer",
                "expires_at": expires.isoformat(),
            }
            return success_response(
                message="Successfully Logged in", data=response, status_code=200
            )
        return error_response(
            message=serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
        )


# Register and login with social account for user
class CreateAccount(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request):
        reg_serializer = RegistrationSerializer(data=request.data)

        if reg_serializer.is_valid():
            try:
                new_user = reg_serializer.save()
            except Exception as e:
                return error_response(
                    message=str(e), status_code=status.HTTP_500_INTERNAL_SERVER_ERROR
                )

            if new_user:
                if reg_serializer.validated_data.get("social_registration"):
                    backend_url = os.getenv("BACKEND_URL")
                    client_id = os.getenv("APP_CLIENT_ID")
                    client_secret = os.getenv("APP_CLIENT_SECRET")

                    if not backend_url or not client_id or not client_secret:
                        return error_response(
                            message="Missing required environment variables",
                            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                        )

                    try:
                        r = requests.post(
                            f"{backend_url}/api/v1/auth/token/",
                            data={
                                "username": new_user.email,
                                "password": request.data["password"],
                                "client_id": client_id,
                                "client_secret": client_secret,
                                "grant_type": "password",
                            },
                        )
                        r.raise_for_status()
                        return success_response(
                            message=r.json(), status_code=r.status_code
                        )
                    except requests.exceptions.RequestException as e:
                        return error_response(
                            message=str(e),
                            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                        )
                else:
                    try:
                        login_data = {
                            "username_or_email": reg_serializer.validated_data[
                                "username"
                            ],
                            "password": request.data["password"],
                        }
                        serializer = LoginSerializer(data=login_data)
                        if not serializer.is_valid():
                            return error_response(
                                message={
                                    "message": "Invalid input data",
                                    "errors": serializer.errors,
                                },
                                status_code=status.HTTP_400_BAD_REQUEST,
                            )

                        user = serializer.validated_data["user"]
                        user_otp = generate_otp(user.user_id)
                        send_otp_email(user.email, user.username, otp=user_otp)

                        response_data = {
                            "username_or_email": user.username,
                            "code": user_otp.code,
                            "expiry_time": user_otp.expiry_time.isoformat(),
                        }

                        return success_response(
                            message="Successfully registered",
                            data=response_data,
                            status_code=status.HTTP_200_OK,
                        )
                    except Exception as e:
                        return error_response(
                            message=str(e),
                            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                        )
        return error_response(
            message=reg_serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
        )


class AllUsers(generics.ListAPIView):
    permission_classes = [permissions.AllowAny]
    queryset = User.objects.all()
    serializer_class = UsersSerializer


class CurrentUser(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def get(self, request):
        serializer = UsersSerializer(self.request.user)
        return Response(serializer.data)


# for company
@api_view(["POST"])
def register_company_profile(request):
    if request.method == "POST":
        serializer = CompanyProfileRegistrationSerializer(data=request.data)
        if serializer.is_valid():
            try:
                with transaction.atomic():
                    company = serializer.save()
                    role = Role.objects.get(pk=2)
                    company.user.role = role
                    company.user.save()

                    send_registration_confirmation_email(
                        company.user.email, company.user
                    )
                    send_approval_notification_email(
                        company.company_name, company.user.email
                    )
                    return success_response(
                        message="Company profile registration is submitted and pending approval.",
                        status_code=status.HTTP_201_CREATED,
                    )
            except IntegrityError:
                return error_response(
                    message="Not available username or email",
                    status_code=status.HTTP_400_BAD_REQUEST,
                )
            except Exception as e:
                return error_response(
                    message="Not available server",
                    status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                )

        return error_response(
            message=serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
        )


""" Change Password"""


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def change_password(request):
    serializer = ChangePasswordSerializer(
        data=request.data, context={"request": request}
    )

    if serializer.is_valid():
        serializer.save()
        return success_response(
            message="Password changed successfully.",
            status_code=status.HTTP_200_OK,
        )
    return error_response(
        message=serializer.errors, status_code=status.HTTP_400_BAD_REQUEST
    )


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def user_logout(request):
    try:
        access_token = request.auth
        refresh_token = request.data.get("refresh_token")

        AccessToken.objects.filter(token=access_token.token).delete()
        if refresh_token:
            RefreshToken.objects.filter(token=refresh_token).delete()

        return Response({"message": "Successfully logged out."}, status=200)
    except Exception as e:
        return Response({"error": str(e)}, status=500)
