<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Group;
use App\Models\Student;
use App\Models\Task;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

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
    public function showCourse(Course $course)
    {
        $role = Auth::user()->role;
        $courseName = '';
        $grades = [];
        $tasks = [];
        $students = [];

        $group = Group::find($course->courseGroupId);
        $teacher = User::where('teacherId', '=', $course->courseTeacherId)->limit(1)->get();

        if (isset($role)) {

            $courseName = $course->courseName;
            $tasks = Task::where('taskCourseId', '=', $course->id)->get();
            if ($role === 'student') {
                $studentId = Auth::user()->studentId;

                if(isset($studentId) && $studentId > 0) {
                    $grades = DB::table('studentsGrades')->where('studentId', '=', $studentId)->where('gradeCourseId', '=', $course->id)->get();
                }
            } else {
                $teacherId = Auth::user()->teacherId;

                if(isset($teacherId) && $teacherId > 0) {
                    $grades = DB::table('studentsGrades')->where('gradeCourseId', '=', $course->id)->get();
                    $students = DB::table('studentsWithGroups')->where('groupId', '=', $group->id)->get();
                    
                }
            }
        }

        return view ('courses.course', ['grades' => $grades, 'courseName' => $courseName, 'tasks' => $tasks, 'group' => $group, 'teacher' => $teacher, 'courseId' => $course->id, 'students' => $students]);
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
