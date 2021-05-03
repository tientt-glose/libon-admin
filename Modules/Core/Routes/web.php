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
//todo: middleware web
Route::middleware(['web'])->group(function () {
    Route::get('/login', 'AdminController@login')->name('login');
    Route::post('/login', 'AdminController@loginPost')->name('login');

    //todo: hoi ve verify.role
    Route::middleware(['auth'])->group(function () {
        Route::get('/', 'DashboardController@index')->name('home');
        Route::get('/logout', 'AdminController@logout')->name('logout');
    });
});
