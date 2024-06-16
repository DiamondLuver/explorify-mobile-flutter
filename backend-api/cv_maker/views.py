from rest_framework.response import Response
from rest_framework import status
from django.http import HttpResponse
from django.template.loader import get_template
import weasyprint
from django.core.files.storage import FileSystemStorage
from django.conf import settings
from rest_framework import generics, permissions
from rest_framework.exceptions import ValidationError
from account.models import User
from .serializers import CVDataSerializer, ImageUploadSerializer
from weasyprint import HTML, CSS
from .models import (
    CV,
)


class CVFormAPIView(generics.GenericAPIView):
    permission_classes = [permissions.IsAuthenticated]
    def get(self, request):
        try:
            user = User.objects.get(user_id=request.user.user_id)
        except User.DoesNotExist:
            return Response(
                {"error": "User does not exist."}, status=status.HTTP_404_NOT_FOUND
            )

        try:
            cv = CV.objects.get(user=user)
        except CV.DoesNotExist:
            return Response(
                {"error": "CV not found for the user."},
                status=status.HTTP_404_NOT_FOUND,
            )

        serializer = CVDataSerializer(cv)
        return Response(serializer.data)

    def post(self, request):
        try:
            user = User.objects.get(pk=request.user.pk)
            cv = CV.objects.get(user=user)
        except User.DoesNotExist:
            return Response(
                {"error": "User not found"}, status=status.HTTP_404_NOT_FOUND
            )
        except CV.DoesNotExist:
            return Response(
                {"error": "CV not found for the user"}, status=status.HTTP_404_NOT_FOUND
            )

        serializer = ImageUploadSerializer(data=request.data)
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        try:
            serializer.validate_image_file(serializer.validated_data["image_file"])
        except ValidationError as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

        try:
            image_file = serializer.validated_data["image_file"]
            fss = FileSystemStorage()
            file = fss.save(image_file.name, image_file)
            image_url = fss.url(file)
            image_url_with_scheme = (
                f"{request.scheme}://{request.get_host()}{image_url}"
            )
        except Exception as e:
            return Response(
                {"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )

        serializer_data = CVDataSerializer(cv)
        context = {"cv": serializer_data.data, "image_url": image_url_with_scheme}

        template = get_template("cv/cv.html")
        html = template.render(context)

        try:
            pdf = HTML(string=html).write_pdf(
                stylesheets=[
                    CSS(
                        string="@page { size: A4 Portrait; margin: 5mm; page-break-after: always; }"
                    )
                ]
            )
        except Exception as e:
            return Response(
                {"error": f"Failed to generate PDF: {str(e)}"},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )

        response = HttpResponse(pdf, content_type="application/pdf")
        response["Content-Transfer-Encoding"] = "utf-8"
        response["Content-Disposition"] = 'attachment; filename="cv.pdf"'

        try:
            fss.delete(file)
        except Exception as e:
            return Response(
                {"error": f"Failed to delete image file: {str(e)}"},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )

        return response
