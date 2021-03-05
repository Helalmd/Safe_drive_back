<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\BusDriverLog;

class BusDriverLogController extends Controller
{

    public function index()
    {
        $busDriverLog = DB::table('bus_driver_logs')
                    ->join('buses','bus_driver_logs.busId','buses.id')
                    ->join('drivers','bus_driver_logs.driverId','drivers.id')
                    ->select('bus_driver_logs.*','buses.plate_no','buses.name','drivers.driver_name','drivers.license')
                    ->get();
        return response()->json($busDriverLog,200);
    }

    public function destroy($id)
    {
        $bus = BusDriverLog::find($id);
        $bus->delete();
    }

}
