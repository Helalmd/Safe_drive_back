<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBusDriverLogsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bus_driver_logs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('busDriverId');
            $table->integer('busId');
            $table->integer('driverId');
            $table->string('startDate');
            $table->string('endDate')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bus_driver_logs');
    }
}
