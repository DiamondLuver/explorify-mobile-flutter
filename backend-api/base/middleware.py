# middleware.py

import uuid
import time
class TraceIDMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)

        # Generate a unique trace ID
        trace_id = f"{int(time.time())}-{uuid.uuid4()}"

        # Add the trace ID to the response headers
        response["X-Trace-ID"] = trace_id

        return response
