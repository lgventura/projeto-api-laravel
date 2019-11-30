<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mensagen;
use DB;

class MensagenController extends Controller
{
    public function index(){
        return Mensagen::all();
    }
    
    public function save(Request $request,$contatos_id){
        $dados = $request->all();
    
        DB::beginTransaction();
        try {
            $mensagem = new Mensagen($dados);
            $mensagem->contatos_id = $contatos_id;
            $mensagem->save();
            
            DB::commit();
            return response()->json($mensagem, 201);
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json("Erro ao Cadastrar mensgaem", 406);
        }
    }

    public function edit(Request $request, $id){
        $dados = $request->all();
    
        DB::beginTransaction();
        try {
            $mensagem = Mensagen::find($id);
            $mensagem->update($dados);;
            
            DB::commit();
            return response()->json($mensagem, 200);
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json("Erro ao editar Mensagem", 406);
        }
    }

    public function delete($id){

        if(Mensagen::find($id)->delete()){
            return response()->json(true, 204);
        }else{
            return response()->json(false, 406);
        }
    }

    public function getByContact($contatos_id){

        $mensagem  =  Mensagen::where('contatos_id', $contatos_id)->orderBy('created_at', 'ASC')->get();
        
        return response()->json($mensagem, 201);
    
      }
}
