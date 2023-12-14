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
Route::get('product_search', 'ProductController@getListSearch');
Route::get('product/{id}', 'ProductController@getDetail');
Route::get('product_by_group/{group}', 'ProductController@getListByGroup');

Route::get('list_cart/{userId}', 'CartController@getList');
Route::post('new_cart', 'CartController@create');
Route::put('update_cart', 'CartController@update');
Route::delete('delete_cart/{id}', 'CartController@delete');

Route::post('new_payment', 'PaymentController@new');
Route::post('new_sales', 'SalesController@new');

Route::post('vna_pay', 'VnpayController@vnpayUrl');

