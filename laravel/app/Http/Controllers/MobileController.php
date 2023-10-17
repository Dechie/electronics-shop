<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mobile;

class MobileController extends Controller
{
    //
    public function index(){
        return Mobile::all()->toJson();
    }

    public function show($id){
        return Mobile::find($id);
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
