<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('grades', function (Blueprint $table) {
            $table->id();
            $table->integer('grade');
            $table->unsignedBigInteger('gradeStudentId');
            $table->unsignedBigInteger('gradeCourseId');
            $table->unsignedBigInteger('gradeTeacherId');
            $table->string('gradeComment');
            $table->timestamps();

            $table->foreign('gradeStudentId')->references('id')->on('students')->onDelete('cascade');
            $table->foreign('gradeCourseId')->references('id')->on('courses');
            $table->foreign('gradeTeacherId')->references('id')->on('teachers');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('grades');
    }
};
