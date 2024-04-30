<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Illuminate\Support\Facades\Auth;

// Route::get('/', function () {
//     return Inertia::render('Welcome', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//         'laravelVersion' => Application::VERSION,
//         'phpVersion' => PHP_VERSION,
//     ]);
// });

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');
});

Auth::routes();
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/marcas', function(){
    return view('app.marcas');
})->name('marcas')->middleware('auth');

Route::get('/', function(){
    return view('app.welcomeApp');
})->name('welcomeApp');

Route::get('/clientes', function(){
    return view('app.clientes');
})->name('clientes')->middleware('auth');

Route::get('/locacao', function(){
    return view('app.locacao');
})->name('locacao')->middleware('auth');

Route::get('/carro', function(){
    return view('app.carros');
})->name('carros')->middleware('auth');

Route::get('/modelo', function(){
    return view('app.modelo');
})->name('modelo')->middleware('auth');
