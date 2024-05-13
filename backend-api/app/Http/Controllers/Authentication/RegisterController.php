<?php

namespace App\Http\Controllers\Authentication;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = $validator->validated();

        $user = new User();
        $user->email = $data['email'];
        $user->password = bcrypt($data['password']);
        
        // Check if email already exists
        if (User::where('email', $data['email'])->exists()) {
            return response()->json([
                'success' => false,
                'message' => 'Email is not available',
            ], 422);
        }

        $user->save();

        return response()->json([
            'success' => true,
            'user' => $user,
            'message' => 'User Registered successfully!'
        ], 201);
    }


    private function sanitizeUsername($username)
    {
        $sanitizedUsername = preg_replace('/[^A-Za-z0-9_\-]/', '', $username);
        $sanitizedUsername = trim($sanitizedUsername);
        $sanitizedUsername = substr($sanitizedUsername, 0, 20);
        return $sanitizedUsername;
    }
}
