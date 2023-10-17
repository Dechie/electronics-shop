<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\Mobile;
use App\Http\Controllers\MobileController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('mobiles', [MobileController::class, 'index']);
Route::get('mobile/{id}', [MobileController::class, 'show']);
Route::post('mobiles', [MobileController::class, 'store']);
Route::put('mobiles/{id}', [MobileController::class, 'update']);
Route::delete('mobiles/{id}', [MobileController::class, 'delete']);