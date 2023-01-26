<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Factory as ValidationFactory;

class LoginRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'password' => 'required',
            'role' => 'required'
        ];
    }


    public function getCredentials()
    {
        $role = $this->get('role');

        if ($role === 'teacher') {
            return $this->only('teacherId', 'password', 'role');
        }
        return $this->only('studentId', 'password', 'role');
    }
}
