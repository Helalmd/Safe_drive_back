<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBusesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Buses', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('plate_no')->unique();
            $table->string('owner');
            $table->string('duty_date')->nullable();
            $table->string('channel')->unique()->nullable();
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
        Schema::dropIfExists('Buses');
    }
}
