<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


/**
 * Class Teacher
 * 
 * @property int $id
 *  
 * @property Collection|Course[] $courses
 * @property Collection|User[] $users
 * @property Collection|Grade[] $grades
 *
 * @package App\Models
 */
class Teacher extends Model
{
	use HasFactory;
	protected $table = 'teachers';
	protected $primaryKey = 'id';
	public $timestamps = false;

	protected $fillable = [];

	public function courses()
	{
		return $this->hasMany(Course::class, 'courseTeacherId');
	}

	public function grades() {
		return $this->hasMany(Grade::class, 'gradeTeacherId');
	}

	public function users()
	{
		return $this->hasMany(User::class, 'teacherId');
	}
}
