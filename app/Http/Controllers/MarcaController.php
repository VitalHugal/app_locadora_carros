<?php

namespace App\Http\Controllers;

use App\Models\Marca;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

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

        $marca = $this->marca->with('modelos')->get();
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

       $imagem = $request -> file('imagem');
       $imagem_urn = $imagem ->store('imagens', 'public');

       $marca =$this->marca->create([
        'nome' => $request->nome,
        'imagem' => $imagem_urn
       ]);

        //retorna um json com status code 201
        return response()->json($marca, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show( $id)
    {
        $marca = $this->marca->with('modelos')->find($id);

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

        }else{
        $request->validate($marca->rules(), $marca->feedback());
        }

        //remove o arquivo antigo caso um novo arquivo tenha sido enviado no request
        if ($request->file('imagem')) {
            Storage::disk('public')->delete($marca->imagem);
        }


        $imagem = $request -> file('imagem');
        $imagem_urn = $imagem ->store('imagens', 'public');

        //preencher o objeto $marca com os dados request

        $marca->fill($request->all());
        $marca->imagem = $imagem_urn;
        $marca->save();
        // $marca->update([
        //     'nome' => $request->nome,
        //     'imagem'=> $imagem_urn
        // ]);
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
    //remove o arquivo antigo caso um novo arquivo tenha sido enviado no request

        Storage::disk('public')->delete($marca->imagem);

       $marca->delete();
       return response()->json(['msg'=>'A marca foi removida com sucesso'], 200);
    }
}
