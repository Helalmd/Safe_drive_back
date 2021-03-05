<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BusServiceLogController extends Controller
{
    public function index(){
        $busServiceLog = DB::table('bus_service_logs')
                        ->join('buses','bus_service_logs.busId','buses.Id')
                        ->get();
        return response()->json($busServiceLog,200);
    }
}
