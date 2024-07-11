<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Laptope;

class LaptopeController extends Controller
{
    //
     public function index(){
        return response()->json(Laptope::all());
    }

    public function show($id){
        return response()->json(['mobile' => Laptope::find($id)]);
    }

    public function store(Request $request){
        return Laptope::create($request->all());
    }

    public function update(Request $request, $id){
        $mobile = Laptope::findOrFail($id);
        $mobile->update($request->all());

        return $mobile;
    }

    public function delete(Request $request, $id){
        $mobile = Laptope::findOrFail($id);
        $mobile->delete();

        return 204;
    }
}
