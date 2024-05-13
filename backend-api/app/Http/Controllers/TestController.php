<?php

namespace App\Http\Controllers;


class TestController extends Controller
{
    public function test(){
        $test="test";
        return $this->successResponse($test,200);
       
    }


}
