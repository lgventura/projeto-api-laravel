<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Contato;
use DB;

class ContatoController extends Controller
{
    public function index(){
        return Contato::all();
    }
    
    public function save(Request $request){
        $dados = $request->all();
    
        DB::beginTransaction();
        try {
            $contact = new Contato($dados);
            $contact->save();
            
            DB::commit();
            return response()->json($contact, 201);
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json("Erro ao Cadastrar Contato", 406);
        }
    }

    public function edit(Request $request, $id){
        $dados = $request->all();
    
        DB::beginTransaction();
        try {
            $contact = Contato::find($id);
            $contact->update($dados);;
            
            DB::commit();
            return response()->json($dados, 200);
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json("Erro ao editar Contato", 406);
        }
    }

    public function delete($id){

        if(Contato::find($id)->delete()){
            return response()->json(true, 204);
        }else{
            return response()->json(false, 406);
        }
    
    }
}
