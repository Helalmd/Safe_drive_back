<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bus extends Model
{
    protected $fillable = [
        'name', 'plate_no', 'owner', 'duty_date', 'channel'
    ];

    public function setNameAttribute($name) {
        $this->attributes['name'] = $name ? ucfirst($name) : $name;
    }
}
