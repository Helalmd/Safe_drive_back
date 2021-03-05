<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBusDriversTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bus_drivers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('channel');
            $table->integer('busId')->nullable();
            $table->integer('driverId');
            $table->string('driving_status');
            $table->string('status')->nullable();
            $table->string('startDate');
            $table->timestamps();

            $table->unique(['busId', 'driverId']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bus_drivers');
    }
}
