<?php

namespace App\Domains\Session\Model;

use Illuminate\Database\Eloquent\Model;

class Session extends Model
{
    protected $fillable = [
        'id', 'token', 'expiration_date', 'user_id'
    ];

    protected $keyType = 'char';

    public function user()
    {
        return $this->belongsTo('App\Domains\User\Model\User');
    }
}