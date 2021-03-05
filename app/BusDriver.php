<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BusDriver extends Model
{
    const DRIVING_STATUS_ON_DUTY = 'on-duty';
    const DRIVING_STATUS_OFF_DUTY = 'leisure';

    const STATUS_SAFE = 'safe';
    const STATUS_MODERATE = 'moderate';
    const STATUS_DANGER = 'danger';

    protected $fillable = [
        'busId', 'driverId', 'status', 'driving_status', 'startDate', 'channel'
    ];

    public function busDriverLogs() {
        return $this->hasMany(BusDriverLog::class, 'busDriverId', 'id');
    }
}
