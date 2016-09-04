<?php

namespace App\Domains\Lookup\Model;

use Illuminate\Database\Eloquent\Model;

class Lookup extends Model
{
    protected $fillable = [
        'endpoint', 'method', 'description', 'user_type'
    ];

    protected $table = 'lookups';

}