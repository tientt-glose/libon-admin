<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::middleware(['auth', 'web'])->group(function () {
    Route::get('orders/get', 'OrderController@get')->name('order.orders.get');
    Route::get('orders/add-the-book', 'OrderController@addTheBookToOrder')->name('order.orders.addTBook');
    Route::resource('orders', 'OrderController', ['as' => 'order']);
});
