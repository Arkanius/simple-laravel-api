<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::group(['prefix' => 'v1'], function () {

    Route::group(['prefix' => 'admin'], function () {
        Route::resource('users', 'UserController');
        Route::put('users/{id}/suspend', 'UserController@suspendAccess');
        Route::get('users/deleted', 'UserController@deleted');
    });

    Route::post('register', 'UserController@register');
    Route::post('authenticate', 'AuthenticationController@authenticate');

    Route::get('test', 'UserController@test');



});
