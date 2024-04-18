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
        return $marca;
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
        //$marca = Marca::create($request->all());
        $marca = $this->marca->create($request->all());
        return $marca;
    }

    /**
     * Display the specified resource.
     */
    public function show( $id)
    {
        $marca = $this->marca->find($id);
        if ($marca === null) {
            return ['erro'=>'Recurso indisponivel - (ver id)'];
        }
        return $marca;
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
            return ['erro'=>'Recurso indisponivel - (Atualização)'];
        }
        $marca->update($request->all());
        return $marca;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
       $marca = $this->marca->find($id);
       if ($marca === null) {
        return ['erro'=>'Recurso indisponivel - (Exclusão)'];
    }
       $marca->delete();
       return ['msg'=>'A marca foi removida'];
    }
}
