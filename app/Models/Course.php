<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Course
 * 
 * @property int $courseId
 * @property string $courseName
 * @property int $courseTeacherId
 * @property int $courseGroupId
 * 
 * @property Teacher $teacher
 * @property Group $group
 * @property Collection|Grade[] $grades
 * @property Task $task
 *
 * @package App\Models
 */
class Course extends Model
{
	use HasFactory;
	protected $table = 'courses';
	protected $primaryKey = 'courseId';
	public $timestamps = false;

	protected $casts = [
		'courseTeacherId' => 'int',
		'courseGroupId' => 'int'
	];

	protected $fillable = [
		'courseName',
		'courseTeacherId',
		'courseGroupId'
	];

	public function teacher()
	{
		return $this->belongsTo(Teacher::class, 'courseTeacherId');
	}

	public function group()
	{
		return $this->belongsTo(Group::class, 'courseGroupId');
	}

	public function grades()
	{
		return $this->hasMany(Grade::class, 'gradeCourseId');
	}

	public function task()
	{
		return $this->hasOne(Task::class, 'taskCourseId');
	}
}
