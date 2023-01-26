<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class User
 * 
 * @property int $ID
 * @property string $Name
 * @property string $Surname
 * @property string $Password
 * @property string $Role
 * @property int|null $StudentId
 * @property int|null $TeacherId
 * @property string $rememberToken
 * @property Carbon $Email_verified_at
 * 
 * @property Student|null $student
 * @property Teacher|null $teacher
 *
 * @package App\Models
 */
class User extends Model
{
	use HasFactory;
	protected $table = 'user';
	protected $primaryKey = 'ID';
	public $timestamps = false;

	protected $casts = [
		'studentId' => 'int',
		'teacherId' => 'int'
	];

	protected $dates = [
		'email_verified_at'
	];

	protected $fillable = [
		'name',
		'surname',
		'email',
		'password',
		'role',
		'studentId',
		'teacherId',
		'rememberToken',
		'email_verified_at'
	];

	public function student()
	{
		return $this->belongsTo(Student::class, 'StudentId');
	}

	public function teacher()
	{
		return $this->belongsTo(Teacher::class, 'TeacherId');
	}
}
