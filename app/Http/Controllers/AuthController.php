<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function login(Request $request)
    {

        $credenciais = $request->all(['email', 'password']); //autenticação do usuario (email e senha)

        $token = auth('api')->attempt($credenciais); //retornar um tokem jwt
        //dd($token);
        if ($token) { //usuario autenticado com sucesso
            return response()->json(['token' => $token]);
        } else { // erro de autenticação (senha ou usuario)
            return response()->json(['erro' => 'Usuário ou senha inválido!'], 403);
        }
        return 'login';
    }
    public function logout()
    {
        return 'logout';
    }
    public function refresh()
    {
        $token = JWTAuth::getToken();
        $refreshedToken = JWTAuth::refresh($token); // Tente atualizar o token
        return response()->json(['token' => $refreshedToken]); // Retornar o novo token JWT
    }

    public function me()
    {
        //dd(auth()->user()); //Para junto do token conseguirmos verificar quais dados são apresentado para nós
        return response()->json(auth()->user()); // retornar detalhes do usuario menos sensiveis
    }
}
