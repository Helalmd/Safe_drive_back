<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Driver;

class DriverController extends Controller
{
    public function index()
    {
        // $Driver = DB::table('drivers')->get();
        $driver = Driver::all();
        return response()->json($driver);
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'driver_name'=>'required|min:2|max:50',
            'license'=>'required|min:2|max:50',
            'address'=>'required|min:2|max:50',
            'phone'=>'required|min:11|max:11',
            'experience_year'=>'required|min:1|max:50',
        ]);
        $driver = New Driver();
        $driver->driver_name = $request->driver_name;
        $driver->license = $request->license;
        $driver->address = $request->address;
        $driver->phone = $request->phone;
        $driver->experience_year = $request->experience_year;
        $driver->save();
        return ['message'=>'OK', 'data' => $driver];
    }

    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'driver_name'=>'required|min:2|max:50',
            'license'=>'required|min:2|max:50',
            'address'=>'required|min:2|max:50',
            'phone'=>'required|min:11|max:11',
            'experience_year'=>'required|min:1|max:50',
        ]);
        $driver = Driver::find($id);
        $driver->driver_name = $request->driver_name;
        $driver->license = $request->license;
        $driver->address = $request->address;
        $driver->phone = $request->phone;
        $driver->experience_year = $request->experience_year;
        $driver->save();
    }

    public function show($id)
    {
        $driver = Driver::find($id);
        return response()->json($driver);
    }

    public function destroy($id)
    {
        $driver = Driver::find($id);
        $driver->delete();
    }
}
