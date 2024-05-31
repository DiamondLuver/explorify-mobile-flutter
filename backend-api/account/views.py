from django.contrib.auth import authenticate, login
from account.models import User
from django.utils import timezone
from django.views import View
from django.http import JsonResponse
from django.middleware.csrf import get_token
from .models import Otp
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
import json
from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework import status, generics
from rest_framework.response import Response
import os

from .serializers import RegistrationSerializer, UsersSerializer
import requests

class LoginView(View):
    def post(self, request):
        try:
            data = json.loads(request.body)
            username_or_email = data.get('username_or_email')
            password = data.get('password')

            if not username_or_email or not password:
                return JsonResponse({"message": "username_or_email and password are required"}, status=400)

            user = User.objects.filter(username=username_or_email).first()
            if not user:
                user = User.objects.filter(email=username_or_email).first()

            if not user or not user.check_password(password):
                return JsonResponse({"message": "Invalid credentials"}, status=422)

            user_otp = self.generate_otp(user.id)
            # Uncomment and implement SMS sending if needed
            # user_otp.send_sms(data.get('phone_number'))

            return JsonResponse({
                'result': True,
                'result_code': 200,
                'result_message': "Success",
                'body': {
                    'username_or_email': username_or_email,
                    'code': user_otp.code,
                    'expiry_time': user_otp.expiry_time.isoformat(),
                }
            }, status=200)
        except Exception as e:
            return JsonResponse({"message": str(e)}, status=500)

    def generate_otp(self, user_id):
        user_otp = Otp.objects.filter(user_id=user_id).order_by('-id').first()
        now = timezone.now()

        if user_otp and now < user_otp.expiry_time:
            return user_otp

        return Otp.objects.create(user_id=user_id)

@method_decorator(csrf_exempt, name='dispatch')
class LoginWithOtpView(View):
    def post(self, request):
        try:
            data = json.loads(request.body)
            username_or_email = data.get('username_or_email')
            code = data.get('code')

            if not username_or_email or not code:
                return JsonResponse({"message": "username_or_email and code are required"}, status=400)

            user = User.objects.filter(username=username_or_email).first()
            if not user:
                user = User.objects.filter(email=username_or_email).first()

            if not user:
                return JsonResponse({"message": "Account not found"}, status=404)

            user_otp = Otp.objects.filter(user_id=user.id, code=code).first()
            now = timezone.now()

            if not user_otp:
                return JsonResponse({"message": "Invalid code"}, status=422)
            elif now > user_otp.expiry_time:
                return JsonResponse({"message": "Code expired"}, status=422)

            user_otp.expiry_time = now
            user_otp.is_verify = True
            user_otp.save()

            login(request, user)

            token = get_token(request)

            return JsonResponse({
                'user': user.username,
                'access_token': token,
                'token_type': 'Bearer',
                'expires_at': (now + timezone.timedelta(weeks=1)).isoformat(),
            }, status=200)
        except Exception as e:
            return JsonResponse({"message": str(e)}, status=500)


class CreateAccount(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request):
        reg_serializer = RegistrationSerializer(data=request.data)
        if reg_serializer.is_valid():
            new_user = reg_serializer.save()
            if new_user:
                r = requests.post(
                    os.getenv("BACKEND_URL")+"/api/v1/auth/token/",
                    data={
                        "username": new_user.email,
                        "password": request.data["password"],
                        "client_id": os.getenv("APP_CLIENT_ID"),
                        "client_secret": os.getenv("APP_CLIENT_SECRET"),
                        "grant_type": "password",
                    },
                )
                return Response( r.json(), status=status.HTTP_201_CREATED)
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
