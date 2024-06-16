from rest_framework.response import Response
from rest_framework import status
from django.http import HttpResponse
from django.template.loader import get_template
import weasyprint
from django.core.files.storage import FileSystemStorage
import os
from django.conf import settings
from rest_framework import generics

from account.models import User
from .serializers import CVDataSerializer
from weasyprint import HTML, CSS

from .models import (
    CV,
    Skill,
    Language,
    UserCompany,
    UserEducation,
)

class CVFormAPIView(generics.GenericAPIView):
    # permission_classes = [permissions.IsAuthenticated]
    def get(self, request):
        user = User.objects.get(user_id=1)
        try:
            cv = CV.objects.get(user=user, cv_id=1)
        except CV.DoesNotExist:
            return Response({"error": "CV not found for the user"}, status=404)

        serializer = CVDataSerializer(cv)

        return Response(serializer.data)

    def post(self, request):
        
        try:
            user = User.objects.get(user_id=1)
            cv = CV.objects.get(user=user, cv_id=1)
        except User.DoesNotExist:
            return Response({"error": "User not found"}, status=status.HTTP_404_NOT_FOUND)
        except CV.DoesNotExist:
            return Response({"error": "CV not found for the user"}, status=status.HTTP_404_NOT_FOUND)

        image_file = request.data.get("image_file")

        if not image_file:
            return Response({"error": "Image file is required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            fss = FileSystemStorage()
            file = fss.save(image_file.name, image_file)
            image_url = fss.url(file)
            image_url_with_scheme = f"{request.scheme}://{request.get_host()}{image_url}"
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        serializer_data = CVDataSerializer(cv)
        context = {"cv": serializer_data.data, "image_url": image_url_with_scheme}

        template = get_template("cv/cv.html")
        html = template.render(context)
        # css_url = request.build_absolute_uri(settings.STATIC_URL + 'src/output.css')
        
        pdf = weasyprint.HTML(string=html).write_pdf(
            stylesheets=[
                CSS(string="@page { size: A4 Portrait; margin: 5mm; page-break-after: always; }"),
                # weasyprint.CSS(css_url),
                # CSS(css_path)
            ]
        )

        response = HttpResponse(pdf,content_type="application/pdf")
        response['Content-Transfer-Encoding'] = 'utf-8'

        response["Content-Disposition"] = 'attachment; filename="cv.pdf"'
        return response

        # Example: Check if the user has at least one CV record
        has_cv = CV.objects.filter(user=user).exists()

        # Example: Check if the user has at least one education record associated with the CV
        has_education = UserEducation.objects.filter(user=user, cv__user=user).exists()

        # Example: Check if the user has at least one company record associated with the CV
        has_company = UserCompany.objects.filter(user=user, cv__user=user).exists()

        # Example: Check if the user has at least one skill associated with the CV
        has_skills = Skill.objects.filter(cv__user=user).exists()

        # Example: Check if the user has at least one language associated with the CV
        has_languages = Language.objects.filter(cv__user=user).exists()

        # Add more checks as necessary based on your requirements

        # Return True if all required data is available, False otherwise
        return has_cv and has_education and has_company and has_skills and has_languages

