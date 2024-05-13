<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Laravel\Socialite\Facades\Socialite;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    /**
     * Login with credentials
     * 
     */
    public function login()
    {
        $this->validate(request(), [
            'email' => 'required|email',
            'password' => 'required|min:6',
        ]);

        if (Auth::attempt(['username' => request('email'), 'password' => request('password')])) {
            $user = User::find(Auth::user()->id);

            $user_token = $user->createToken('User Token')->accessToken;
            $expires_in = env('ACCESS_TOKEN_EXPIRY_DAYS') * 24 * 60 * 60 * 1000;

            if ($user->isUser()) {
                return response()->json([
                    'success' => true,
                    'token' => $user_token,
                    'expires_in' => $expires_in,
                    'user' => $user->only('name', 'email'),
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Failed to authenticate.',
                ], 401);
            }
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Failed to authenticate.',
            ], 401);
        }
    }

    /**
     * Redirect the user to the Provider authentication page.
     *
     * @param $provider
     * @return JsonResponse
     */
    public function redirectToProvider($provider)
    {
        if (!in_array($provider, ['facebook', 'github', 'google'])) {
            abort(422, 'Please login using facebook, github or google');
        }

        return Socialite::driver($provider)->redirect();
    }

    /**
     * Obtain the user information from Provider.
     *
     * @param $provider
     * @return JsonResponse
     */
    public function handleProviderCallback($provider)
    {
        if (!in_array($provider, ['facebook', 'github', 'google'])) {
            abort(422, 'Please login using facebook, github or google');
        }

        try {
            $socialUser = Socialite::driver($provider)->user();
        } catch (\Exception $exception) {
            return response()->json(['error' => 'Invalid credentials provided.'], 422);
        }

        $user = User::where('email', $socialUser->getEmail())->first();

        if (!$user) {

            $user = User::create([
                'name' => $socialUser->getName(),
                'email' => $socialUser->getEmail(),
                'email_verified_at' => now(),
                'status' => true,
                'avatar' => $socialUser->getAvatar()
            ]);
        } else {
            // Update avatar if it's not set
            if (!$user->avatar) {
                $user->update(['avatar' => $socialUser->getAvatar()]);
            }
        }

        $user->providers()->updateOrCreate(
            [
                'provider' => $provider,
                'provider_id' => $socialUser->getId(),
            ],
            []
        );

        // Attempt to log in the user
        Auth::login($user);

        // Generate token
        $token = $user->createToken('token-name')->plainTextToken;

        return response()->json($user, 200, ['Access-Token' => $token]);
    }


    /**
     * @param $provider
     * @return JsonResponse
     */
    protected function validateProvider($provider)
    {
        if (!in_array($provider, ['facebook', 'github', 'google'])) {
            return response()->json(['error' => 'Please login using facebook, github or google'], 422);
        }
    }
}
