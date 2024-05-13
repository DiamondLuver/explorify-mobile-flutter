<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class EmailVerificationNotificationController extends Controller
{
    /**
     * Send a new email verification notification.
     */
    public function store(Request $request): JsonResponse|RedirectResponse
    {
        $user = $request->user();

        if (!$user || ($user && !$user->email)) {
            return response()->json(['error' => 'User not found or does not have an email'], 404);
        }

        if (!$user->hasVerifiedEmail()) {
            $user->sendEmailVerificationNotification();
            return response()->json(['status' => 'verification-link-sent']);
        }

        return response()->json(['status' => 'email-already-verified']);
    }
}
