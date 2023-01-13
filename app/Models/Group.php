<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Group
 * 
 * @property int $groupId
 * @property string $groupName
 * 
 * @property Collection|Course[] $courses
 * @property Collection|Student[] $students
 *
 * @package App\Models
 */
class Group extends Model
{
	use HasFactory;
	protected $table = 'groups';
	protected $primaryKey = 'groupId';
	public $timestamps = false;

	protected $fillable = [
		'groupName'
	];

	public function courses()
	{
		return $this->hasMany(Course::class, 'courseGroupId');
	}

	public function students()
	{
		return $this->hasMany(Student::class, 'studentGroupId');
	}
}
