<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BusDriverLog extends Model
{
  protected $fillable = [
      'busDriverId', 'busId', 'driverId', 'startDate', 'endDate'
  ];
}
