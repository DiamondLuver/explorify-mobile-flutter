<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Support\ServiceProvider;
use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        // Passport::useClientModel(\App\Models\Client::class);
        // Gate::before(function ($user, $ability) {
        //     if ($user->hasRole('Super-Admin')) {
        //         return true;
        //     }
        // });
    }
}
