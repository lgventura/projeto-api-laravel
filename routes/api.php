<?php

use Illuminate\Http\Request;

use App\Contato;

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('contatos'                , 'ContatoController@index');
Route::post('contatos/save'          , 'ContatoController@save');
Route::post('contatos/edit/{id}'     , 'ContatoController@edit');
Route::delete('contatos/delete/{id}' , 'ContatoController@delete');

Route::get('mensagens'                            , 'MensagenController@index');
Route::post('mensagens/save/{contatos_id}'        , 'MensagenController@save');
Route::get('mensagens/getByContact/{contatos_id}' , 'MensagenController@getByContact');
Route::post('mensagens/edit/{id}'                 , 'MensagenController@edit');
Route::delete('mensagens/delete/{id}'             , 'MensagenController@delete');