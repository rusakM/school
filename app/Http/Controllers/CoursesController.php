<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Groups;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class CoursesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $role = Auth::user()->role;
        $courses = [];

        if (isset($role)) {            
            if ($role === 'teacher') {
                $teacherId = Auth::user()->teacherId;
                if (isset($teacherId) && $teacherId > 0) {   
                    $courses = Course::select('courses.id', 'courses.courseName', 'courses.courseGroupId', 'groups.groupName')
                        ->leftJoin('groups', function($leftJoin) {
                            $leftJoin->on('courses.courseGroupId', '=', 'groups.id');
                        })
                        ->where('courses.courseTeacherId', '=', $teacherId)->get();
                }
            }            
            
            if ($role === 'student') {
                $studentId = Auth::user()->studentId;

                if (isset($studentId) && $studentId > 0) {             
                    $groupId = Student::find($studentId)->studentGroupId;
                    
                    if (isset($groupId)) {
                        Log::channel('stderr')->info($groupId);
                        $courses = Course::select('courses.id', 'courses.courseName', 'courses.courseTeacherId', 'users.name', 'users.surname')
                        ->leftJoin('users', function($leftJoin) {
                            $leftJoin->on('users.teacherId', '=', 'courses.courseTeacherId');
                        })
                        ->where('courses.courseGroupId', '=', $groupId)->get();
                    } else {
                    }
                }
                
            }
        

        }

        

        return view ('courses.index')->with('courses', $courses);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('courses.create');
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
            'courseName'=>'required',
            'courseTeacherId'=>'required|numeric',
            'courseGroupId'=>'required|numeric'
        );
        $validator = Validator::make(Input::all(), $rules);

        // process the login
        if ($validator->fails()) {
            return Redirect::to('courses/create')
                ->withErrors($validator)
                ->withInput(Input::except('password'));
        } else {
            // store
            $course = new course;
            $course->courseName = Input::get('courseName');
            $course->courseTeacherId = Input::get('courseTeacherId');
            $course->courseGroupId = Input::get('courseGroupId');
            $course->save();

            // redirect
            return Redirect::to('courses');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function show(Course $course)
    {
        $course = course::find($id);
        return view::make('courses.show')->with('course', $course);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function edit(Course $course)
    {
        $course = course::find($id);
        return view::make('courses.edit')->with('course', $course);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Course $course)
    {
        $rules = array(
            'courseName'=>'required',
            'courseTeacherId'=>'required|numeric',
            'courseGroupId'=>'required|numeric'
        );
        $validator = Validator::make(Input::all(), $rules);

        // process the login
        if ($validator->fails()) {
            return Redirect::to('courses/' . $id . '/edit')
                ->withErrors($validator)
                ->withInput(Input::except('password'));
        } else {
            // store
            $course = new course;
            $course->courseName = Input::get('courseName');
            $course->courseTeacherId = Input::get('courseTeacherId');
            $course->courseGroupId = Input::get('courseGroupId');
            $course->save();

            // redirect
            return Redirect::to('courses');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function destroy(Course $course)
    {
        $course = course::find($id);
        $course->delete();
        return Redirect::to('courses');
    }
}
