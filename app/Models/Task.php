<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
/**
 * Class Task
 * 
 * @property int $taskId
 * @property string $taskDescription
 * @property int $taskCourseId
 * @property Carbon $taskTimestamp
 * 
 * @property Course $course
 *
 * @package App\Models
 */
class Task extends Model
{
	use HasFactory;
	protected $table = 'tasks';
	protected $primaryKey = 'taskId';
	public $timestamps = false;

	protected $casts = [
		'taskCourseId' => 'int'
	];

	protected $dates = [
		'taskTimestamp'
	];

	protected $fillable = [
		'taskDescription',
		'taskCourseId',
		'taskTimestamp'
	];

	public function course()
	{
		return $this->belongsTo(Course::class, 'taskCourseId');
	}
}
