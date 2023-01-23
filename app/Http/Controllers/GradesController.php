<?php

namespace App\Http\Controllers;

use App\Models\Grade;
use Illuminate\Http\Request;

class GradesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $grades = $grade::all();
        return view ('grades.index')->with('grades', $grades);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('grades.create');
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
            'grade'=>'required',
            'gradeStudentId'=>'required|numeric',
            'gradeComment',
            'gradeCourseId'=>'required|numeric',
            'gradeTimestamp'=>'required|date'

        );
        $validator = Validator::make(Input::all(), $rules);

        // process the login
        if ($validator->fails()) {
            return Redirect::to('grades/create')
                ->withErrors($validator)
                ->withInput(Input::except('password'));
        } else {
            // store
            $grade = new grade;
            $grade->grade = Input::get('grade');
            $grade->gradeStudentId = Input::get('gradeStudentId');
            $grade->gradeComment = Input::get('gradeComment');
            $grade->gradeCourseId = Input::get('gradeCourseId');
            $grade->gradeTimestamp = Input::get('gradeTimestamp');
            $grade->save();

            // redirect
            return Redirect::to('grades');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Grade  $grade
     * @return \Illuminate\Http\Response
     */
    public function show(Grade $grade)
    {
        $grade = grade::find($id);
        return view::make('grades.show')->with('grade', $grade);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Grade  $grade
     * @return \Illuminate\Http\Response
     */
    public function edit(Grade $grade)
    {
        $grade = grade::find($id);
        return view::make('grades.edit')->with('grade', $grade);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Grade  $grade
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Grade $grade)
    {
        $rules = array(
            'grade'=>'required',
            'gradeStudentId'=>'required|numeric',
            'gradeComment',
            'gradeCourseId'=>'required|numeric',
            'gradeTimestamp'=>'required|date'

        );
        $validator = Validator::make(Input::all(), $rules);

        // process the login
        if ($validator->fails()) {
            return Redirect::to('grades/' . $id . '/edit')
                ->withErrors($validator)
                ->withInput(Input::except('password'));
        } else {
            // store
            $grade = new grade;
            $grade->grade = Input::get('grade');
            $grade->gradeStudentId = Input::get('gradeStudentId');
            $grade->gradeComment = Input::get('gradeComment');
            $grade->gradeCourseId = Input::get('gradeCourseId');
            $grade->gradeTimestamp = Input::get('gradeTimestamp');
            $grade->save();

            // redirect
            return Redirect::to('grades');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Grade  $grade
     * @return \Illuminate\Http\Response
     */
    public function destroy(Grade $grade)
    {
        $grade = grade::find($id);
        $grade->delete();
        return Redirect::to('grade');
    }
}