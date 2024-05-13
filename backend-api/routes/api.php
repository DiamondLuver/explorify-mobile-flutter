<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\Authentication\RegisterController;
use App\Http\Controllers\Permission\PermissionController;
use App\Http\Controllers\Permission\RoleController;
use App\Http\Controllers\Permission\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Open API Routes
|--------------------------------------------------------------------------
*/
// Authentication
Route::prefix('v1')
    // ->middleware()
    ->group(function () {
        // Authentication
        Route::post('/login', [AuthController::class, 'login']);
        Route::get('/login/{provider}', [AuthController::class, 'redirectToProvider']);
        Route::get('/login/{provider}/callback', [AuthController::class, 'handleProviderCallback']);

        // Register
        Route::post('register', [RegisterController::class, 'register']);
    });


/*
|--------------------------------------------------------------------------
| Protected API Routes
|--------------------------------------------------------------------------
*/

// USER ROUTES
Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');

Route::middleware('auth:api')->group(function () {
    // Routes that require admin role or permission
    Route::get('/test', function (Request $request) {
        return response()->json(['test'=>'test']);

    });
});

// SUPER ADMIN ROUTES 
Route::name('admin')
    ->prefix('v1/admin')
    //   ->middleware()
    ->group(function () {
        Route::apiResource('roles', RoleController::class)->except('show');                     // index, store, update, destroy
        Route::apiResource('permissions', PermissionController::class)->except('show');         // index, store, update, destroy
        Route::apiResource('users', UserController::class)->only('index', 'edit', 'update');    // index, edit, update
    });


