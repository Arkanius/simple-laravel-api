<?php

namespace App\Domains\User\Model;

use Illuminate\Database\Eloquent\Model;

class Session extends Model
{
    protected $fillable = [
        'id', 'token', 'expiration_date', 'user_id'
    ];

    protected $keyType = 'char';
}