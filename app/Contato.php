<?php

namespace App;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use App\Mensagen;

class Contato extends Model
{
  use SoftDeletes;
  protected $fillable = ['nome', 'sobrenome', 'email', 'telefone'];

  public function mensagem(){
    return $this->hasMany(Mensagen::class);
  }
}
