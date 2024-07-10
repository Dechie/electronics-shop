<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Laptope extends Model
{
    use HasFactory;

    protected $table = 'laptopes';
    protected $fillable = [
            'title',
            'ram',
            'model',
            'storage',
            'core',
            'price',
    ]; 
}
