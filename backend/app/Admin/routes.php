<?php

use Encore\Admin\Facades\Admin;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {
    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('/manage-product', ProductController::class);
    $router->resource('/group-product', ProductGroupController::class);
    $router->resource('/manage-promotion', PromotionController::class);
    $router->resource('/manage-order', PaymentController::class);
});

