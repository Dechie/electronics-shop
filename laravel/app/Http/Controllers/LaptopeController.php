<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LaptopController extends Controller
{
    //
     public function index(){
        return response()->json(Mobile::all());
    }

    public function show($id){
        return response()->json(['mobile' => Mobile::find($id)]);
    }

    public function store(Request $request){
        return Mobile::create($request->all());
    }

    public function update(Request $request, $id){
        $mobile = Mobile::findOrFail($id);
        $mobile->update($request->all());

        return $mobile;
    }

    public function delete(Request $request, $id){
        $mobile = Mobile::findOrFail($id);
        $mobile->delete();

        return 204;
    }
}
