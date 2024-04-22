<?php

namespace App\Repositories;

use Illuminate\Database\Eloquent\Model;

class MarcaRepository

{
    protected $model;

    public function __construct($model)
    {
        $this->model = $model;
    }
    public function selectAtributosRegistrosRelacionados($atributos)
    {  // definindo uma função
        $this->model = $this->model->with($atributos); //Carregar os registros relacionados e especificados pelos atributos e atribuir isso ao próprio modelo.
        // a query está sendo montada
    }
    public function filtro($filtros)
    {
        $filtro = explode(';', $filtros);
        foreach ($filtro as $key => $condicao) {
            $c = explode(':', $condicao);
            $this->model = $this->model->where($c[0], $c[1], $c[2]); //Carregar os registros relacionados e especificados pelos atributos e atribuir isso ao próprio modelo.
            //a query esta sendo montada
        }
    }
    public function selectAtributos($atributos)
    {
        $this->model = $this->model->selectRaw($atributos);
    }
    public function getResultado()
    {
        return $this->model->get();
    }
}
