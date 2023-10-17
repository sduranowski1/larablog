<?php

use App\Models\Category;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ListingController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// All Listings
Route::get('/', [ListingController::class, 'index']);

// Show Create Form
Route::get('/categories', [CategoryController::class, 'index'])->middleware('auth');

// Show Create Form
Route::get('/listings/create', [ListingController::class, 'create'])->middleware('auth');

// Store Listing Data
Route::post('/listings', [ListingController::class, 'store'])->middleware('auth');

// Show Edit Form
Route::get('/listings/{listing}/edit', [ListingController::class, 'edit'])->middleware('auth');

// Update Listing
Route::put('/listings/{listing}', [ListingController::class, 'update'])->middleware('auth');

// Delete Listing
Route::delete('/listings/{listing}', [ListingController::class, 'destroy'])->middleware('auth');

// Manage Listings
Route::get('/listings/manage', [ListingController::class, 'manage'])->middleware('auth');

// // Checkout
// Route::get('/listings/checkout', [ListingController::class, 'checkout'])->middleware('auth');;

// Single Listing
Route::get('/listings/{listing}', [ListingController::class, 'show']);

// // Single Listing
// Route::get('/listings/{listing}', [UserController::class, 'show']);

####

// All products
Route::get('/products', [ProductController::class, 'index']);

// Send requst to web server
Route::post('/listings/checkout/', [ListingController::class, 'checkout'])->name('checkout');

// Success
Route::get('/success', [ListingController::class, 'success'])->name('checkout.success');

//Cancel
Route::get('/cancel', [ListingController::class, 'cancel'])->name('checkout.cancel');

//Webhook
Route::post('/webhook', [ListingController::class, 'webhook'])->name('checkout.webhook');


####

// Show Register/Create Form
Route::get('/register', [UserController::class, 'create'])->middleware('guest');

// Browse Users
Route::get('/users', [UserController::class, 'index']);

// Create New User
Route::post('/users', [UserController::class, 'store']);

// Log User Out
Route::post('/logout', [UserController::class, 'logout'])->middleware('auth');

// Show Login Form
Route::get('/login', [UserController::class, 'login'])->name('login')->middleware('guest');

// Log In User
Route::post('/users/authenticate', [UserController::class, 'authenticate']);