<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Auth\Authenticatable as AuthenticableTrait;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Notifications\Notifiable;
use App\Notifications\ResetPasswordNotification;

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
class User extends Model implements AuthenticatableContract,CanResetPasswordContract
{
	use HasFactory;
	use AuthenticableTrait,CanResetPassword;
    use ValidatesRequests;
	use Notifiable;

	protected $table = 'users';
	protected $primaryKey = 'id';
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
		'remember_token',
		'email_verified_at'
	];

	public function student()
	{
		return $this->belongsTo(Student::class, 'studentId');
	}

	public function teacher()
	{
		return $this->belongsTo(Teacher::class, 'teacherId');
	}

	public function sendPasswordResetNotification($token)
    {
        $this->notify(new ResetPasswordNotification($token));
    }
}
