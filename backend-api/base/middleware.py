import uuid
import time
from django.http import JsonResponse
from django.urls import resolve

class URLPatternMiddlewareMixin:
    def should_process(self, request):
        # Define URL patterns to include/exclude
        excluded_patterns = ['admin']  # Add more patterns as needed

        # Check if the current request's URL pattern is in the excluded patterns
        current_url_name = resolve(request.path_info).url_name
        return not any(pattern in request.path for pattern in excluded_patterns)

class TraceIDMiddleware(URLPatternMiddlewareMixin):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if not self.should_process(request):
            return self.get_response(request)

        response = self.get_response(request)

        # Generate a unique trace ID
        trace_id = f"{int(time.time())}-{uuid.uuid4()}"

        # Add the trace ID to the response headers
        response["X-Trace-ID"] = trace_id

        return response

class CustomErrorHandlerMiddleware(URLPatternMiddlewareMixin):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if not self.should_process(request):
            return self.get_response(request)

        response = self.get_response(request)
        return self.process_response(request, response)

    def process_response(self, request, response):
        # Check if the response status code is 403, 401, or 500
        if response.status_code == 403:
            return self.handle_forbidden(request)
        elif response.status_code == 401:
            return self.handle_unauthorized(request, response)
        elif response.status_code == 500:
            return self.handle_server_error(request, response)
        else:
            return response

    def handle_forbidden(self, request):
        return error_response(message="Forbidden", status_code=403)

    def handle_unauthorized(self, request, response):
        return error_response(message="Unauthorized", status_code=401)

    def handle_server_error(self, request, response):
        return error_response(message="Server Error", status_code=500)

def error_response(message, data=None, status_code=500):
    response_data = {
        "status": "error",
        "status_code": status_code,
        "message": message,
        "data": data,
    }
    return JsonResponse(response_data, status=status_code)
 