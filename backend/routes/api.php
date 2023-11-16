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

Route::post('login', 'Auth\LoginController@login');
Route::post('register', 'Auth\RegisterController@register');

Route::get('user/{id}', 'UserController@getById');
Route::post('update_user', 'UserController@update');

Route::get('product_group', 'ProductGroupController@getList');

Route::get('product', 'ProductController@getList');
Route::post('product_by_group', 'ProductController@getListByGroup');

Route::post('cart', 'CartController@getList');
Route::post('cart_change', 'CartController@update');

Route::post('payment', 'PaymentController@new');

