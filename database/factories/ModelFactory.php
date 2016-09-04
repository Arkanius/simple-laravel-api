<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

$factory->define(App\Domains\User\Model\User::class, function (Faker\Generator $faker) {
    return [
        'id' => Uuid::generate(),
        'name' => $faker->name,
        'email' => $faker->safeEmail,
        'role' => 'user',
        'api_secret' => str_random(50),
        'api_key' => str_random(50),
        'status' => rand(0, 2),
        'password' => bcrypt(str_random(10)),
    ];
});
