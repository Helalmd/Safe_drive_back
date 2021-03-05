<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Bus;

class BusController extends Controller
{
    public function index()
    {
        // $bus = DB::table('buses')->get();
        $bus = Bus::all();
        return response()->json($bus);
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name'=>'required|min:2|max:50',
            'plate_no'=>'required|min:2|max:50',
            'owner'=>'required|min:2|max:50',
            'channel'=>'required|min:2|max:50',
        ]);
        $bus = New Bus();
        $bus->name = $request->name;
        $bus->plate_no = $request->plate_no;
        $bus->owner = $request->owner;
        $bus->duty_date = $request->duty_date;
        $bus->channel = $request->channel;
        $bus->save();
        return ['message'=>'OK', 'data' => $bus];
    }

    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'name'=>'required|min:2|max:50',
            'plate_no'=>'required|min:2|max:50',
            'owner'=>'required|min:2|max:50',
        ]);
        $bus = Bus::find($id);
        $bus->name = $request->name;
        $bus->plate_no = $request->plate_no;
        $bus->owner = $request->owner;
        $bus->duty_date = $request->duty_date;
        $bus->save();
    }

    public function destroy($id)
    {
        $bus = Bus::find($id);
        $bus->delete();
    }
}
