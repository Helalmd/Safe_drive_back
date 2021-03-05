<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    protected $fillable = [
        'channel',
        'pulse',
        'oxygen',
        'temperature',
        'emergency_button',
        'robery_button',
        'latitude',
        'longitude',
        'entry_id',
        'date',
    ];
}
