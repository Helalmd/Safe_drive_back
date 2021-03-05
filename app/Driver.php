<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Driver extends Model
{
    protected $fillable = [
        'driver_name', 'license', 'address','phone','experience_year'
    ];

    public function setNameAttribute($driver_name) {
        $this->attributes['driver_name'] = $driver_name ? ucfirst($driver_name) : $driver_name;
    }
}
