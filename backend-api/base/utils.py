from rest_framework.response import Response
from rest_framework import status
from django.conf import settings
from django.core.mail import send_mail, EmailMessage, BadHeaderError
from django.template.loader import render_to_string
from django.utils.html import strip_tags
import smtplib
import logging

logger = logging.getLogger(__name__)

def send_otp_email(to_email, user_name, otp):
    subject = 'Your OTP Code'
    message = render_to_string('email/otp_email_template.html', {
        'user_name': user_name,
        'otp': otp,
    })
    email = EmailMessage(
        subject,
        message,
        settings.EMAIL_HOST_USER,
        [to_email],
    )
    email.content_subtype = "html"  # To send HTML email
    try:
        email.send()
    except BadHeaderError:
        logger.error('Invalid header found.')
    except smtplib.SMTPException as e:
        logger.error(f'SMTP error occurred: {e}')
        
        
def send_registration_confirmation_email(user_email, user):
    subject = 'Registration Confirmation'
    html_message = render_to_string('email/company/registration_email.html', {'user': user})
    plain_message = strip_tags(html_message) 
    from_email = settings.EMAIL_HOST_USER
    to_email = [user_email]

    send_mail(subject, plain_message, from_email, to_email, html_message=html_message)

def send_approval_notification_email(company_name, contact_email):
    subject = 'New Company Registration Approval Required'
    html_message = render_to_string('email/admin/approval_notification.html', {'company_name': company_name, 'contact_email': contact_email})
    plain_message = strip_tags(html_message)  # Strip HTML tags for the plain text message
    from_email = settings.EMAIL_HOST_USER
    to_email = ['sreypich.un@student.cadt.edu.kh']  
    bcc = ['unsreypich999@gmail.com']
    # bcc = ['unsreypich999@gmail.com','heaklinh@gmail.com', 'chanmaliza.tann@student.cadt.edu.kh']

    msg = EmailMessage(subject, html_message, from_email, to_email, bcc=bcc)
    msg.content_subtype = 'html' 
    msg.send()
    
    

def api_response(status, code, message, data=None, error=None):
    response_data = {
        'status': status,
        'code': code,
        'message': message,
        'data': data,
        'error': error,
    }
    return Response(response_data, status=code)



    """
    Unused function
    """
def send_simple_email(to_email, subject, message):
    try:
        send_mail(
            subject,
            message,
            settings.EMAIL_HOST_USER,
            [to_email],
            fail_silently=False,
        )
    except BadHeaderError:
        logger.error('Invalid header found.')
    except smtplib.SMTPException as e:
        logger.error(f'SMTP error occurred: {e}')

def send_html_email(to_email, subject, message):
    email = EmailMessage(
        subject,
        message,
        settings.EMAIL_HOST_USER,
        [to_email],
    )
    email.content_subtype = "html"  # To send HTML email
    try:
        email.send()
    except BadHeaderError:
        logger.error('Invalid header found.')
    except smtplib.SMTPException as e:
        logger.error(f'SMTP error occurred: {e}')

def success_response(message, data=None, status_code=status.HTTP_200_OK):
    return Response(
        {
            "status": "success",
            "status_code": status.HTTP_200_OK,
            "message": message,
            "data": data,
        },
        status=status_code,
    )

def error_response(message, status_code=status.HTTP_400_BAD_REQUEST):
    response_data = {
        "status": "error",
        "status_code": status_code,
        "message": message,
        "data": None,
        
    }
    # if error:
    #     response_data["error"] = error
    return Response(response_data, status=status_code)
