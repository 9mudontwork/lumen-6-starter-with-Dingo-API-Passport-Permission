<?php

use App\Models\Auth\User\User;

$factory->define(User::class, function (Faker\Generator $faker) {
    return [
        'email' => $faker->unique()->email,
        'username' => $faker->unique()->username,
        'password' => app('hash')->make($faker->password),
    ];
});
