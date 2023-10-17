<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Mobile;

class MobileTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        
        Mobile::truncate();

        $faker = \Faker\Factory::create();

        for ($i = 0; $i < 10; $i++) {
            Mobile::create([
                'title' => $faker->name(),
                'status' => 'used',
                'ram' => 4,
                'storage' => $faker->numberBetween(32, 256),
                'front_camera' => 5,
                'back_camera' => 13,
                'price' => $faker->numberBetween(10000, 20000),
                'quantity' => $faker->numberBetween(0, 30),
            ]);
        }
    }
}
