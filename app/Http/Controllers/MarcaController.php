<?php

namespace App\Http\Controllers;

use App\Models\Marca;
use Illuminate\Http\Request;

class MarcaController extends Controller
{
    protected $marca;

    public function __construct(Marca $marca)
    {
        $this->marca = $marca;
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //$marcas = Marca::all();

        $marca = $this->marca->all();
        return response()->json($marca, 200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $request ->validate($this->marca->rules(),$this->marca->feedback());
        //foi instanciado o objeto mais e aqui ele esta sendo chamdo para criar um registro com todos os request
       // $marca = $this->marca->create($request->all());

       //acessar os input nome
       //dd($request->nome);
       //dd($request->get('nome'));


       //dd($request->file('imagem'));
       dd($request->imagem);

        //retorna um json com status code 201
        return response()->json($marca, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show( $id)
    {
        $marca = $this->marca->find($id);
        if ($marca === null) {
            return response()->json(['erro'=>'Recurso indisponivel - (ver id)'], 404);//json
        }
        return response()->json($marca, 200);
    }
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Marca $marca)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $marca = $this->marca->find($id);
        if ($marca === null) {
            return response()->json(['erro'=>'Recurso indisponivel - (Atualização)'], 404);
        }
        if($request->method() === 'PATCH'){

            $regrasDinamicas =array();

            //percorrendo todas as regras definidas no modo
            foreach($marca->rules() as $input => $regra){

                //coletar apenas as regras aplicasveis aos paramêtros parciais da requisição PATCH
                if (array_key_exists($input, $request->all())) {
                    $regrasDinamicas[$input] = $regra;
                }
            }

            $request->validate($regrasDinamicas, $marca->feedback());
        }

        else{
        $request->validate($marca->rules(), $marca->feedback());
        }

        $marca->update($request->all());
        return response()->json($marca, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
       $marca = $this->marca->find($id);
       if ($marca === null) {
        return response()->json(['erro'=>'Recurso indisponivel - (Exclusão)'], 404);
    }
       $marca->delete();
       return response()->json(['msg'=>'A marca foi removida com sucesso'], 200);
    }
}
