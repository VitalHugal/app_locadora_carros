<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Marca extends Model
{
    use HasFactory;
    protected $fillable = ['nome','imagem'];

    public function rules() {
        return [
        'nome' => 'required|unique:marcas,nome,'.$this->id.'|min:3',
        'imagem'=> 'required|file|mimes:png'
    ];

    }
    public function feedback(){
        return [
        'required'=> 'O campo :attribute é obrigatório.',
        'nome.unique' => 'O nome da marca já existe.',
        'nome.min'=> 'O nome necessita ter no mínimo 3 caracteres',
        'imagem.mimes'=> 'O arquivo deve ser um aimagem do tipo .png'
        ];
    }

    //Relacionamento com a model modelo onde uma marca tem muitos modelos de carro
    public function modelos(){

        //Uma marca possui diversos modelos
        return $this->hasMany('App\Models\Modelo');
    }


}
