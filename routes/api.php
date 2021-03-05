<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/', function () {
    return view('welcome');
});

Route::get('/user', function () {
    return ['user' => 'Shahed'];
});

//-------------------------------------------------------------------------------
Route::group([

    // 'middleware' => 'api',
    'prefix' => 'auth'

], function () {                            //------JWT(auth)-------
    Route::post('login', 'AuthController@login');
    Route::post('signup', 'AuthController@signup');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
});


//------------------------------------------------------------
Route::Resource('/bus','BusController');
Route::Resource('/driver','DriverController');
Route::Resource('/bus-driver','BusDriverController');
Route::Resource('/bus-driver-log','BusDriverLogController');
Route::Resource('/notification','NotificationController');

Route::get('/bus-service-log', 'BusServiceLogController@index');
