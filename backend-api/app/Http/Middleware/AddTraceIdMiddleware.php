<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AddTraceIdMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $traceId = self::generateTraceId();
        $response = $next($request);
        $response->headers->set('X-Trace-Id', $traceId);
        $responseData = json_decode($response->getContent(), true);
        $responseData['trace_id'] = $traceId;
        // Log::info('trace_id: '. $traceId, $responseData);
        $response->setContent(json_encode($responseData));

        // $response->header('Content-Type', 'application/json');

        return $response;
    }
    private function generateTraceId()
    {
        $timestamp = round(microtime(true) * 1000);
        $random = bin2hex(random_bytes(4));

        $traceId = sprintf('%013x', $timestamp) . $random; 

        return $traceId;
    }
}
