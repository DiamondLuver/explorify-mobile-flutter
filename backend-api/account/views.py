# Django imports
from django.contrib.auth import authenticate, login
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from django.conf import settings

# Django models
from account.models import User
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
from .serializers import (
    RegistrationSerializer,
    UsersSerializer,
    OtpLoginSerializer,
    LoginSerializer
)

@method_decorator(csrf_exempt, name='dispatch')
class LoginView(generics.GenericAPIView):
    serializer_class = LoginSerializer

    def post(self, request):
        try:
            serializer = self.get_serializer(data=request.data)
            if not serializer.is_valid():
                return Response({"message": "Invalid input data", "errors": serializer.errors}, status=status.HTTP_400_BAD_REQUEST)

            user = serializer.validated_data['user']
            user_otp = self.generate_otp(user.user_id)
            # Implement SMS sending if needed
            # user_otp.send_sms(request.data.get('phone_number'))

            response_data = {
                'result': True,
                'result_code': 200,
                'result_message': "Success",
                'body': {
                    'username_or_email': request.data.get('username_or_email'),
                    'code': user_otp.code,
                    'expiry_time': user_otp.expiry_time.isoformat(),
                }
            }
            return Response(response_data, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"message": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def generate_otp(self, user_id):
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
            username_or_email = serializer.data.get('username_or_email')
            code = serializer.data.get('code')

            user = User.objects.filter(username=username_or_email).first()
            if not user:
                user = User.objects.filter(email=username_or_email).first()

            if not user:
                return Response({"message": "Account not found"}, status=status.HTTP_404_NOT_FOUND)

            user_otp = Otp.objects.filter(user_id=user.user_id, code=code).first()
            now = timezone.now()

            if not user_otp:
                return Response({"message": "Invalid code"}, status=status.HTTP_422_UNPROCESSABLE_ENTITY)
            elif now > user_otp.expiry_time:
                return Response({"message": "Code expired"}, status=status.HTTP_422_UNPROCESSABLE_ENTITY)

            user_otp.expiry_time = now
            user_otp.is_verify = True
            user_otp.save()

            backend = "django.contrib.auth.backends.ModelBackend"
            user.backend = backend
            login(request, user, backend=backend)

            application = Application.objects.get(name='Backend')
            expires = now + datetime.timedelta(seconds=settings.OAUTH2_PROVIDER['ACCESS_TOKEN_EXPIRE_SECONDS'])
            access_token = AccessToken.objects.create(
                user=user,
                scope='read write',
                expires=expires,
                token=generate_token(),
                application=application
            )

            refresh_token = RefreshToken.objects.create(
                user=user,
                token=generate_token(),
                access_token=access_token,
                application=application
            )

            return Response({
                'user': user.username,
                'access_token': access_token.token,
                'refresh_token': refresh_token.token,
                'token_type': 'Bearer',
                'expires_at': expires.isoformat(),
            }, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

# Register and login with social account
class CreateAccount(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request):
        reg_serializer = RegistrationSerializer(data=request.data)
        
        if reg_serializer.is_valid():
            try:
                new_user = reg_serializer.save()
            except Exception as e:
                return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

            if new_user:
                backend_url = os.getenv("BACKEND_URL")
                client_id = os.getenv("APP_CLIENT_ID")
                client_secret = os.getenv("APP_CLIENT_SECRET")

                if not backend_url or not client_id or not client_secret:
                    return Response(
                        {'error': 'Missing required environment variables'},
                        status=status.HTTP_500_INTERNAL_SERVER_ERROR
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
                    return Response(r.json(), status=r.status_code)
                except requests.exceptions.RequestException as e:
                    return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return Response(reg_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class AllUsers(generics.ListAPIView):
    permission_classes = [permissions.AllowAny]
    queryset = User.objects.all()
    serializer_class = UsersSerializer


class CurrentUser(APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def get(self, request):
        serializer = UsersSerializer(self.request.user)
        return Response(serializer.data)
