<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;

abstract class Controller
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    protected function successResponse($data, $message = "Success", $statusCode = Response::HTTP_OK): JsonResponse
    {
        return response()->json([
            'result' => true,
            'result_code' => $statusCode,
            'result_message' => $message,
            'body' => $data,
        ], $statusCode);
    }

    protected function errorResponse($message, $statusCode): JsonResponse
    {
        return response()->json([
            'result' => false,
            'result_code' => $statusCode,
            'result_message' => $message,
            'body' => null,
        ], $statusCode);
    }
}
