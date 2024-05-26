from rest_framework.response import Response

def api_response(status, code, message, data=None, error=None):
    response_data = {
        'status': status,
        'code': code,
        'message': message,
        'data': data,
        'error': error,
    }
    return Response(response_data, status=code)
