from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import random
import string
from account.models import User
import re
from django.conf import settings
from django.core.mail import send_mail


@csrf_exempt
def register_view(request):
    if request.method == 'POST':
        email_or_phone = request.POST.get('email_or_phone')
        
        if not email_or_phone:
            return JsonResponse({'error': 'Email or phone number is required.'}, status=400)

        is_email = re.match(r"[^@]+@[^@]+\.[^@]+", email_or_phone)
        is_phone = re.match(r"^\+?\d{10,15}$", email_or_phone)

        if not is_email and not is_phone:
            return JsonResponse({'error': 'Invalid email or phone number format.'}, status=400)

        try:
            if is_email:
                user = User.objects.filter(email=email_or_phone).first()
                # Check if the user already exists by email
                # user = auth.get_user_by_email(email_or_phone)
                pass
            elif is_phone:
                # Check if the user already exists by phone number
                # user = auth.get_user_by_phone_number(email_or_phone)
                pass
            user_exists = True
        except user.UserNotFoundError:
            user_exists = False

        if not user_exists:
            try:
                if is_email:
                    # Create a new user with the given email
                    user = User.create_user(email=email_or_phone)
                elif is_phone:
                    # Create a new user with the given phone number
                    # contact = ContactInformation.create_contact
                    # user = User.create_user(phone_number=)
                    pass
            except Exception as e:
                return JsonResponse({'error': str(e)}, status=400)

        # Generate a random OTP
        otp = ''.join(random.choices(string.digits, k=6))

        # Store the OTP in Firestore
        doc_ref = db.collection('users').document(email_or_phone)
        doc_ref.set({'otp': otp, 'otp_verified': False})

        # Send the OTP to the user's email or phone number using Firebase Authentication
        try:
            if is_email:
                link = auth.generate_email_verification_link(email_or_phone)
                # Here you would normally send the link via email
                # For simplicity, we are returning it in the response
                # Send OTP to email via your email service provider
                
                send_email(email_or_phone, otp)
            elif is_phone:
                # Send OTP to phone number via your SMS service provider
                # For example, using Twilio API to send SMS
                # twilio_client.messages.create(body=f"Your OTP is {otp}", from_='+1234567890', to=email_or_phone)
                pass
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=400)

        return JsonResponse({'message': 'Registration successful. OTP sent.'})

    return JsonResponse({'error': 'Invalid request method.'}, status=405)

@csrf_exempt
def verify_otp_view(request):
    if request.method == 'POST':
        email_or_phone = request.POST.get('email_or_phone')
        otp_provided = request.POST.get('otp')

        if not email_or_phone or not otp_provided:
            return JsonResponse({'error': 'Email/Phone and OTP are required.'}, status=400)

        # Retrieve the stored OTP from Firestore
        doc_ref = db.collection('users').document(email_or_phone)
        doc = doc_ref.get()

        if not doc.exists:
            return JsonResponse({'error': 'User not found.'}, status=404)

        stored_otp = doc.to_dict().get('otp')

        if otp_provided == stored_otp:
            # OTP is correct; complete the registration process
            # You can update the user's document to mark the OTP as verified
            doc_ref.update({'otp_verified': True})
            return JsonResponse({'message': 'OTP verified successfully. Registration complete.'})
        else:
            return JsonResponse({'error': 'Invalid OTP. Please try again.'}, status=400)

    return JsonResponse({'error': 'Invalid request method.'}, status=405)

@csrf_exempt
def login_view(request):
    if request.method == 'POST':
        # Get the POST data containing the user's email or phone number and OTP
        email_or_phone = request.POST.get('email_or_phone')
        otp = request.POST.get('otp')
        
        # Retrieve the stored OTP from Firebase Realtime Database or Firestore
        # user_data = db.reference('users').child(email_or_phone).get()
        # stored_otp = user_data.get('otp') if user_data else None
        
        # Compare the provided OTP with the stored OTP
        # if stored_otp == otp:
            # OTP is valid, generate an authentication token using Firebase Authentication
            # Example: Generating a custom token
            # custom_token = auth.create_custom_token(email_or_phone)
            
        #     return JsonResponse({'token': custom_token})
        # else:
        #     return JsonResponse({'error': 'Invalid OTP.'})
    
    # Return an error for non-POST requests
    return JsonResponse({'error': 'Invalid request method.'})


import os
def send_email(email, otp):
    subject = 'Your OTP Code'
    message = f'Your OTP code is {otp}'
    from_email = os.environ.get('EMAIL_HOST_USER')
    recipient_list = [email]

    try:
        send_mail(subject, message, from_email, recipient_list)
    except Exception as e:
        raise ValueError(f"Error sending email: {e}")