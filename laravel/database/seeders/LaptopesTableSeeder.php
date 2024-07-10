<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class LaptopesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
         DB::table('laptopes')->insert([
            [
                'title' => 'Laptop 1',
                'ram' => 16,
                'storage' => 1000,
                'core' => 'i9',
                'price' => 40000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'title' => 'Laptop 2',
                'ram' => 8,
                'storage' => 500,
                'core' => 'i5',
                'price' => 25000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
             
            [
                'title' => 'Laptop 1',
                'ram' => 16,
                'storage' => 1000,
                'core' => 'i9',
                'price' => 40000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'title' => 'Laptop 2',
                'ram' => 8,
                'storage' => 500,
                'core' => 'i5',
                'price' => 25000,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            
        ]);
    }
}
