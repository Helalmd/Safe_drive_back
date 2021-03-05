<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BusServiceLog extends Model
{
    protected $fillable = [
        'busId', 'dateOfService', 'cost', 'reason', 'serviceLog', 'location'
    ];
}
