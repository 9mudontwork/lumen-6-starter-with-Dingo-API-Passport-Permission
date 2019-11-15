<?php

namespace App\Models\Auth\User;

use App\Traits\Hashable;
use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Query\Builder;
use Laravel\Lumen\Auth\Authorizable;
use Laravel\Passport\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Model implements AuthenticatableContract, AuthorizableContract
{
    use Authenticatable;
    use Authorizable;
    use HasApiTokens;
    use HasRoles;
    use SoftDeletes;
    use Hashable;

    const PERMISSIONS = [
        'create' => 'user create',
        'read' => 'user read',
        'reads' => 'user reads',
        'update' => 'user update',
        'delete' => 'user delete',
        'restore' => 'user restore',
    ];

    protected $table = 'users';

    protected $fillable = [
        'email',
        'username',
        'password'
    ];

    protected $hidden = [
        'password',
    ];

    public function findForPassport($username)
    {
        return $this->orWhere('email', $username)->orWhere('username', $username)->first();
    }
}
