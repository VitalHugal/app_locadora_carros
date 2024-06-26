<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Modelo extends Model
{
    use HasFactory;
    protected $fillable = ['marca_id', 'nome', 'imagem', 'numero_portas', 'lugares', 'air_bag', 'abs'];

    public function rules()
    {
        return [
            'marca_id' =>'exists:marcas,id',
            'nome' => 'required|unique:modelos,nome,' . $this->id . '|min:3',
            'imagem' => 'required|file|mimes:png, jpg,jpeg',
            'numero_portas'=> 'required|integer|digits_between:1,5',//1 a 5
            'lugares'=> 'required|integer|digits_between:1,20',//1 a 20
            'air_bag'=>'required|boolean',
            'abs'=>'required|boolean' // true, false, 1, 0, '1', '0'
        ];
    }

    //Relacionamento com a model marca onde um modelo tem uma marca de carro
    public function marca(){
        //Um modelo pertence a uma marca
        return $this->belongsTo('App\Models\Marca');
    }
    public function carro(){
        //Um modelo pertence a varios carros
        return $this->hasMany('App\Models\Carro');
    }

}