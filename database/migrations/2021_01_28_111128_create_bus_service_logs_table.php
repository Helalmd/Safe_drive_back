<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBusServiceLogsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bus_service_logs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('busId');
            $table->string('dateOfService')->nullable();
            $table->double('cost')->nullable();
            $table->string('reason')->nullable();
            $table->string('serviceLog')->nullable();
            $table->string('location')->nullable();
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
        Schema::dropIfExists('bus_service_logs');
    }
}
