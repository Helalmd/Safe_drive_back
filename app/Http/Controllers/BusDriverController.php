<?php

namespace App\Http\Controllers;

use App\Bus;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\BusDriver;

class BusDriverController extends Controller
{
    public function index()
    {
        $busDriver = DB::table('bus_drivers')
                ->join('buses','bus_drivers.busId','buses.id')
                ->join('drivers','bus_drivers.driverId','drivers.id')
                ->select('bus_drivers.*','buses.plate_no','buses.name','drivers.driver_name','drivers.license')
                ->get();
        return response()->json($busDriver,200);
    }

    public function store(Request $request)
    {
        DB::beginTransaction();

        $this->validate($request,[
            'channel'=>'required|unique:bus_drivers,channel',
//            'plate_no'=>'required|unique:bus_drivers,busId',
            'driver_name'=>'required|unique:bus_drivers,driverId',
            'driving_status'=>'required',
            'startDate'=>'required'
        ]);

        $bus = Bus::where('channel', '=', $request->channel)->first();

//        return response()->json($bus);
        $busDriver = New BusDriver();
        $busDriver->channel = $request->channel;
        $busDriver->busId = $bus->id;
        $busDriver->driverId = $request->driver_name;
        $busDriver->driving_status = $request->driving_status;
        $busDriver->startDate = $request->startDate;
        $busDriver->save();

        DB::commit();
        return ['message'=>'OK', 'data' => $busDriver];
    }

    public function update(Request $request, $id)
    {
        $busDriver = BusDriver::find($id);
        $busDriver->busId = $request->plate_no;
        $busDriver->driverId = $request->driver_name;
        $busDriver->status = $request->status;
        $busDriver->startDate = $request->startDate;
        $busDriver->save();
    }

    public function destroy($id)
    {
        $busDriver = BusDriver::find($id);

        $busDriverLogs['busDriverId'] = $busDriver->id;
        $busDriverLogs['busId'] = $busDriver->busId;
        $busDriverLogs['driverId'] = $busDriver->driverId;
        $busDriverLogs['startDate'] = $busDriver->startDate;
        $busDriverLogs['endDate'] = Carbon::now();

        $busDriver->busDriverLogs()->create($busDriverLogs);

        $busDriver->delete();
    }
}
