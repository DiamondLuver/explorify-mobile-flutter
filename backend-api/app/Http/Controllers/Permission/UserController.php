<?php

namespace App\Http\Controllers\Permission;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    public function index(): JsonResponse
    {
        $users = User::with('roles')->paginate();

        return response()->json(['users' => $users]);
    }

    public function edit(User $user): JsonResponse
    {
        $roles = Role::pluck('name', 'id');

        return response()->json(['user' => $user, 'roles' => $roles]);
    }

    public function update(Request $request, User $user): JsonResponse
    {
        $request->validate([
            'roles' => ['required', 'array'],
        ]);

        $user->syncRoles($request->input('roles'));

        return response()->json(['message' => 'User roles updated successfully', 'user' => $user]);
    }
}