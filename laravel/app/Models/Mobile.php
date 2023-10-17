<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mobile extends Model
{
    use HasFactory;
    protected $table = 'mobile';

    protected $fillable = [
            'title',
            'status',
            'ram',
            'storage',
            'front_camera',
            'back_camera',
            'battery',
            'price',
            'quantity',
    ]; 

}
