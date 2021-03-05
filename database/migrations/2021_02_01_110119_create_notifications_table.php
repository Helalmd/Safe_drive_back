<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notifications', function (Blueprint $table) {
            $table->increments('id');
            $table->string('channel');
            $table->integer('entry_id');
            $table->string('pulse')->nullable();
            $table->string('oxygen')->nullable();
            $table->string('temperature')->nullable();
            $table->boolean('emergency_button')->default(false);
            $table->boolean('robery_button')->default(false);
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->string('date');
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
        Schema::dropIfExists('notifications');
    }
}
