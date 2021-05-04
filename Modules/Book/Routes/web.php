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

Route::prefix('book')->group(function () {
    Route::get('/', 'BookController@index');
});
Route::middleware(['auth'])->group(function () {
    Route::resource('categories', 'CategoryController', ['as' => 'book'])->only(['index', 'store']);
    Route::post('categories/delete', 'CategoryController@deleteCategory')->name('book.categories.deleteCate');
    Route::post('categories/update', 'CategoryController@editCategory')->name('book.categories.editCate');
});
