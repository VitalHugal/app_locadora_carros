<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\CarroController;
use App\Http\Controllers\LocacaoController;
use App\Http\Controllers\MarcaController;
use App\Http\Controllers\ModeloController;



Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

//Route::resource('cliente', 'App\Http\Controllers\ClienteController');
// Desse modo é voltado para web

Route::post('login', [AuthController::class, 'login']);
Route::post('refresh', [AuthController::class, 'refresh']); // rota adcionada par ser possível renovar os tokens



Route::prefix('v1')->middleware(['jwt.auth'])->group(function () {
    //Grupo de proteção com autenticação do usuário
    // prefix para possíveis versionamentos

    // Rotas protegidas aqui
    Route::apiResource('cliente', ClienteController::class);
    Route::apiResource('carro', CarroController::class);
    Route::apiResource('locacao', LocacaoController::class);
    Route::apiResource('marca', MarcaController::class);
    Route::apiResource('modelo', ModeloController::class);

    Route::post('logout', [AuthController::class, 'logout']);//Rota adicionada para ser possível invalidar o token e realizar o logout
    Route::post('me', [AuthController::class, 'me']);  //Rota adicionada no grupo de auteticação para ser possível pegar dados do usuario
});
