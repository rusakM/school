<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $group = \App\Models\Group::factory()->create();
        $teacher = \App\Models\Teacher::factory()->create();
        
        \App\Models\User::factory()->create([
            'teacherId' => $teacher->id,
            'role' => "teacher",
        ]);

        $course = \App\Models\Course::factory()->create([
            'courseTeacherId' => $teacher->id,
            'courseGroupId' => $group->id,
        ]);

        for($i=0; $i<=5; $i++){
            \App\Models\Task::factory()->create([
                'taskCourseId' => $course->id
            ]);
    
            $student = \App\Models\Student::factory()->create([
                'studentGroupId' => $group->id,
            ]);
    
            \App\Models\Grade::factory()->create([
                'gradeStudentId' => $student->id,
                'gradeCourseId' => $course->id,
                'gradeTeacherId' => $teacher->id,
            ]);

            \App\Models\User::factory()->create([
                'studentId' => $student->id,
                'role' => "student",
            ]);
        }
    }
}
