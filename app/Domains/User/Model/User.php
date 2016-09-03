<?php

namespace App\Domains\User\Model;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    protected $fillable = [
        'name', 'email', 'id', 'password', 'role', 'api_key', 'api_secret', 'status'
    ];
    protected $hidden = [
        'password',
    ];

    protected $keyType = 'char';

    public function tokens()
    {
        return $this->hasMany('App\Domains\Session\Model\Session');
    }
}