<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Student
 * 
 * @property int $ID
 * @property string $Name
 * @property string $Surname
 * @property string $Password
 * @property int $studentGroupId
 * 
 * @property Group $group
 * @property Collection|Grade[] $grades
 * @property Collection|User[] $users
 *
 * @package App\Models
 */
class Student extends Model
{
	use HasFactory;
	protected $table = 'students';
	protected $primaryKey = 'id';
	public $timestamps = false;

	protected $casts = [
		'studentGroupId' => 'int'
	];

	protected $fillable = [
		'studentGroupId'
	];

	public function group()
	{
		return $this->belongsTo(Group::class, 'studentGroupId');
	}

	public function grades()
	{
		return $this->hasMany(Grade::class, 'gradeStudentId');
	}

	public function users()
	{
		return $this->hasOne(User::class, 'StudentId');
	}
}
