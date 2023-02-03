<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CoursesController;
use App\Http\Controllers\GradesController;
use App\Http\Controllers\GroupsController;
use App\Http\Controllers\TasksController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [HomeController::class, 'index']);

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/courses/{course}', [CoursesController::class, 'showCourse'])->name('courses.show');
    Route::get('/groups/{group}', [GroupsController::class, 'show'])->name('groups.show');
    Route::get('/courses-list', [CoursesController::class, 'index'])->name('courses.list');
    Route::get('/grades-list', [GradesController::class, 'index'])->name('grades.list');
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::resource('tasks', TasksController::class);
    Route::resource('grades', GradesController::class);
});

require __DIR__.'/auth.php';
