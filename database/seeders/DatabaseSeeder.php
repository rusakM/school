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

        $course = \App\Models\Course::factory()->create([
            'courseTeacherId' => $teacher->ID,
            'courseGroupId' => $group->groupId,
        ]);

        for($i=0; $i<=5; $i++){
            \App\Models\Task::factory()->create([
                'taskCourseId' => $course->courseId
            ]);
    
            $student = \App\Models\Student::factory()->create([
                'studentGroupId' => $group->groupId,
            ]);
    
            \App\Models\Grade::factory()->create([
                'gradeStudentId' => $student->ID,
                'gradeCourseId' => $course->courseId
            ]);
        }
    }
}
