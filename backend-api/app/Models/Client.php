<?php

namespace App\Models;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Foundation\Auth\Access\Authorizable;
use Laravel\Passport\Client as BaseClient;
use Spatie\Permission\Traits\HasRoles;

class Client extends BaseClient implements AuthorizableContract
{
    use HasRoles;
    use Authorizable;

    public $guard_name = 'api';
    
    // or
    
    public function guardName()
    {
        return 'api';
    }
}