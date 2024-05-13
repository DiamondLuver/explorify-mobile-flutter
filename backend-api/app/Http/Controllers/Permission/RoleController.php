<?php

namespace App\Http\Controllers\Permission;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
    public function index()
    {
        $roles = Role::with('permissions')->get();

        return $this->successResponse(['roles' => $roles]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => ['required', 'string'],
            'permissions' => ['array'],
        ]);

        $role = Role::create(['name' => $request->input('name')]);

        $role->givePermissionTo($request->input('permissions'));

        return $this->successResponse(['role' => $role], 'Role created successfully', 201);
    }

    public function update(Request $request, Role $role)
    {
        $request->validate([
            'name' => ['required', 'string'],
            'permissions' => ['array'],
        ]);

        $role->update(['name' => $request->input('name')]);
        $role->syncPermissions($request->input('permissions'));
        return $this->successResponse(['role' => $role],'Role updated successfully' );
    }

    public function destroy(Role $role)
    {
        $role->delete();
        return $this->successResponse(null, 'Role deleted successfully');
    }
}