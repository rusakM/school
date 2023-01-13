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
 * @property int $ID
 * @property string $Name
 * @property string $Surname
 * @property string $Password
 * 
 * @property Collection|Course[] $courses
 *
 * @package App\Models
 */
class Teacher extends Model
{
	use HasFactory;
	protected $table = 'teachers';
	protected $primaryKey = 'ID';
	public $timestamps = false;

	protected $fillable = [
		'Name',
		'Surname',
		'Password'
	];

	public function courses()
	{
		return $this->hasMany(Course::class, 'courseTeacherId');
	}
}
