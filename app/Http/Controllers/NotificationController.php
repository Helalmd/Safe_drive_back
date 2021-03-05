<?php

namespace App\Http\Controllers;

use App\Events\NotificationCreatedEvent;
use App\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NotificationController extends Controller
{
    public function index(Request $request)
    {

        $url = 'https://api.thingspeak.com/channels/'. $request->channel .'/feed.json?api_key=XQPI2QNFYYC69VMJ';
//        $url = "https://api.thingspeak.com/channels/1293855/status.json?api_key=XQPI2QNFYYC69VMJ&fbclid=IwAR3lrxZpCURkmJpi80AvWN3KJ7brCs9gpvLx1zvfTpx6g9dY4UAMSyaKrns";
        $data = file_get_contents($url);
        $datas = json_decode($data, true);
        //field 1 = pulse
        //Field 2 = oxygen
        //Field 3 = temperature
        //Field 4 = Button 1
        //Field 5 = Button 2
        //Field 6 = latitude
        //Field 7 = longitude

        $lastEntryId = $datas['channel']['last_entry_id'];
        $feeds = $datas['feeds'];
        $maxEntryId = Notification::max('entry_id');

        if($maxEntryId >= $lastEntryId ) {
            return $this->notificationData();
        }

        foreach ($feeds as $feed) {
            if(is_null($maxEntryId) || $feed['entry_id'] > $maxEntryId) {
                $notificationData = New Notification();
                $notificationData->channel = $request->channel;
                $notificationData->entry_id = $feed['entry_id'];
                $notificationData->pulse = $feed['field1'];
                $notificationData->oxygen = $feed['field2'];
                $notificationData->temperature = $feed['field3'];
                $notificationData->emergency_button = $feed['field4'] ?? 1;
                $notificationData->robery_button = $feed['field5'] ?? 1;
                $notificationData->latitude = $feed['field6'] ?? null;
                $notificationData->longitude = $feed['field7'] ?? 0;
                $notificationData->date = $feed['created_at'];

                $notificationData->save();

                event(new NotificationCreatedEvent($notificationData));
            }
        }

        return $this->notificationData();
    }

    public function notificationData() {
        $notifications = DB::table('notifications')
            ->join('buses', 'buses.channel', '=', 'notifications.channel')
            ->join('bus_drivers','bus_drivers.busId', '=', 'buses.id')
            ->join('drivers','bus_drivers.driverId', '=', 'drivers.id')
            ->select('notifications.*','buses.plate_no','buses.name','drivers.driver_name','drivers.license')
            ->get();

        return response()->json($notifications,200);
    }

}
