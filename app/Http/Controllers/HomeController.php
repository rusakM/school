<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class HomeController extends Controller
{
    public function index() 
    {
        Log::channel('stderr')->info('home');
        return view('layouts.home');
    }

    public function testLogin($credentials) {
        Log::channel('stderr')->info($credentials);
        return view('auth.test', ['data' => json_encode($credentials)]);
    }
}
