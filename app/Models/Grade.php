<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Grade
 * 
 * @property int $gradeId
 * @property int $grade
 * @property int $gradeStudentId
 * @property string $gradeComment
 * @property int $gradeCourseId
 * @property Carbon $gradeTimestamp
 * 
 * @property Course $course
 * @property Student $student
 *
 * @package App\Models
 */
class Grade extends Model
{
	use HasFactory;
	protected $table = 'grades';
	protected $primaryKey = 'gradeId';
	public $timestamps = false;

	protected $casts = [
		'grade' => 'int',
		'gradeStudentId' => 'int',
		'gradeCourseId' => 'int'
	];

	protected $dates = [
		'gradeTimestamp'
	];

	protected $fillable = [
		'grade',
		'gradeStudentId',
		'gradeComment',
		'gradeCourseId',
		'gradeTimestamp'
	];

	public function course()
	{
		return $this->belongsTo(Course::class, 'gradeCourseId');
	}

	public function student()
	{
		return $this->belongsTo(Student::class, 'gradeStudentId');
	}
}
