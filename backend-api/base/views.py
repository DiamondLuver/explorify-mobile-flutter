from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class BaseAPIView(APIView):
    def success_response(self, message, data=None, status_code=status.HTTP_200_OK):
        return Response({
            'status': 'success',
            'message': message,
            'data': data
        }, status=status_code)

    def error_response(self, message, error=None, status_code=status.HTTP_400_BAD_REQUEST):
        response_data = {'status': 'error', 'message': message}
        if error:
            response_data['error'] = error
        return Response(response_data, status=status_code)
