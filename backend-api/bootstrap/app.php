<?php

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Validation\ValidationException;
use Laravel\Passport\Exceptions\AuthenticationException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Illuminate\Http\Request;


return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        api: __DIR__ . '/../routes/api.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {

        $middleware->use([
            \Illuminate\Http\Middleware\TrustHosts::class,
            \Illuminate\Http\Middleware\TrustProxies::class,
            \Illuminate\Http\Middleware\HandleCors::class,
            \Illuminate\Foundation\Http\Middleware\PreventRequestsDuringMaintenance::class,
            \Illuminate\Http\Middleware\ValidatePostSize::class,
            \Illuminate\Foundation\Http\Middleware\TrimStrings::class,
            \Illuminate\Foundation\Http\Middleware\ConvertEmptyStringsToNull::class,
            \App\Http\Middleware\ForceJsonResponse::class,

        ]);
        $middleware->trustHosts(['*']);
        $middleware->trustProxies(
            headers: Request::HEADER_X_FORWARDED_FOR |
                Request::HEADER_X_FORWARDED_HOST |
                Request::HEADER_X_FORWARDED_PORT |
                Request::HEADER_X_FORWARDED_PROTO |
                Request::HEADER_X_FORWARDED_AWS_ELB
        );
        $middleware->alias([
            
            'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
            'auth.session' => \Illuminate\Session\Middleware\AuthenticateSession::class,
            'cache.headers' => \Illuminate\Http\Middleware\SetCacheHeaders::class,
            'can' => \Illuminate\Auth\Middleware\Authorize::class,
            'password.confirm' => \Illuminate\Auth\Middleware\RequirePassword::class,
            'precognitive' => \Illuminate\Foundation\Http\Middleware\HandlePrecognitiveRequests::class,
            'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,
            'verified' => \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class,
            'json.response' => \App\Http\Middleware\ForceJsonResponse::class,
            // 'role' => \Spatie\Permission\Middlewares\RoleMiddleware::class,
            // 'permission' => \Spatie\Permission\Middlewares\PermissionMiddleware::class,
            // 'role_or_permission' => \Spatie\Permission\Middlewares\RoleOrPermissionMiddleware::class,
          
        ]);
        $middleware->group('api', [
            \App\Http\Middleware\AddTraceIdMiddleware::class,
            // 'throttle:api',
            // \Illuminate\Routing\Middleware\SubstituteBindings::class,
            \App\Http\Middleware\ForceJsonResponse::class,

        ]);
    })

    ->withExceptions(function ($e) {
        $e->render(function (Exception $exception) {
            if ($exception instanceof $exception instanceof ModelNotFoundException || $exception instanceof NotFoundHttpException) {
                return response()->json([
                    'result' => false,
                    'result_code' => 404,
                    'result_message' => 'No query result',
                    'body' => null,
                ], 404);
            } else if ($exception instanceof ValidationException) {
                return response()->json([
                    'result' => false,
                    'result_code' => 422,
                    'result_message' => $exception->getMessage(),
                    'body' => $exception->validator->errors()->toArray(),
                ], 422);
            } else if ($exception instanceof AuthenticationException) {
                return response()->json([
                    'result' => false,
                    'result_code' => 401,
                    'result_message' => $exception->getMessage(),
                    'body' => null,
                ], 401);
            } else {
                return response()->json([
                    'result' => false,
                    'result_code' => 500,
                    'result_message' => $exception->getMessage(),
                    'body' => null,
                ], 500);
            }
        });
    })->create();
