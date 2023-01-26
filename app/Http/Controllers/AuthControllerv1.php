<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\LoginRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use App\Models\Student;
use App\Models\Teacher;

class AuthController extends Controller
{
    /**
     * Display login page.
     * 
     * @return Renderable
     */
    public function show()
    {
        return view('auth.login');
    }

    /**
     * Handle account login request
     * 
     * @param LoginRequest $request
     * 
     * @return \Illuminate\Http\Response
     */
    // public function login(LoginRequest $request)
    // {
    //     $credentials = $request->getCredentials();
        
        

    //     //echo $credentials;
    //     if(!Auth::validate($credentials)):
    //         return redirect()->to('login')
    //             ->withErrors(trans('auth.failed'));
    //     endif;
        
    //     $user = Auth::getProvider()->retrieveByCredentials($credentials);
        
    //     Auth::login($user);
        
    //     return $this->authenticated($request, $user);
    // }

    public function login(LoginRequest $request) {
        $credentials = $request->getCredentials();

        if (!Auth::validate($credentials)) {
            $credentials['user_error'] = true;
        } else {
            $credentials['user_error'] = false;
        }
        
        Log::channel('stderr')->info('hello login');
        return $this->authenticated($request, $credentials);
    }

    /**
     * Handle response after user authenticated
     * 
     * @param Request $request
     * @param Auth $user
     * 
     * @return \Illuminate\Http\Response
     */
    protected function authenticated(Request $request, $user) 
    {
        return redirect()->intended();
    }
}
