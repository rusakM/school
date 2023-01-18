<?php

namespace App\Http\Controllers;

use App\Models\Student;
use Illuminate\Http\Request;

class StudentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $students = $student::all();
        return view ('students.index')->with('students', $students);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('students.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = array(
            'name'=>'required',
            'surname'=>'required',
            'password'=>'required',
            'studentGroupId'=>'required|numeric'
        );
        $validator = Validator::make(Input::all(), $rules);

        // process the login
        if ($validator->fails()) {
            return Redirect::to('students/create')
                ->withErrors($validator)
                ->withInput(Input::except('password'));
        } else {
            // store
            $student = new student;
            $student->name = Input::get('name');
            $student->surname = Input::get('surname');
            $student->password = Input::get('password');
            $student->studentGroupId = Input::get('studentGroupId');
            $student->save();

            // redirect
            return Redirect::to('students');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function show(Student $student)
    {
        $student = student::find($id);
        return view::make('students.show')->with('student', $student);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function edit(Student $student)
    {
        $student = student::find($id);
        return view::make('students.edit')->with('student', $student);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Student $student)
    {
        $rules = array(
            'name'=>'required',
            'surname'=>'required',
            'password'=>'required',
            'studentGroupId'=>'required|numeric'
        );
        $validator = Validator::make(Input::all(), $rules);

        // process the login
        if ($validator->fails()) {
            return Redirect::to('students/' . $id . '/edit')
                ->withErrors($validator)
                ->withInput(Input::except('password'));
        } else {
            // store
            $student = new student;
            $student->name = Input::get('name');
            $student->surname = Input::get('surname');
            $student->password = Input::get('password');
            $student->studentGroupId = Input::get('studentGroupId');
            $student->save();

            // redirect
            return Redirect::to('students');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function destroy(Student $student)
    {
        $student = student::find($id);
        $student->delete();
        return Redirect::to('students');
    }
}
