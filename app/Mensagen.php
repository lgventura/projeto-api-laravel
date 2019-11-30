<?php

namespace App;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use App\Contato;

class Mensagen extends Model
{
  use SoftDeletes;
  protected $fillable = ['descricao', 'contatos_id'];

  public function contato(){
    return $this->belongsTo(Contato::class, 'contatos_id', 'id');
  }
}
