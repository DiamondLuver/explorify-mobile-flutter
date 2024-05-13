<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use App\Models\User;
use Spatie\Permission\Models\Role;
class PermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        app()[
            \Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

            $arrayOfPermissionNames =[

            ];
            $permissions = collect($arrayOfPermissionNames)->map(function (
                $permission
            ){
                return ["name" => $permission, "guard_name"=> "api"];
            });
        Permission::insert($permissions->toArray());

        Role::create(["name"=>"admin"])->givePermissionTo(Permission::all());
        // Role::create(["name"=>"editor"])->givePermissionTo(["access users","update users"]);

        User::find(1)->assignedRole('admin');
        // User::find(2)->assignedRole('editor');
        
    }
}
