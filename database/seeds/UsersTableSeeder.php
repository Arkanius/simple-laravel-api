<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use App\Domains\User\Model\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->delete();

        $users = array(
            [
                'id' => Uuid::generate(),
                'name' => 'Admin',
                'email' => 'admin@test.com.br',
                'password' => Hash::make('secret'),
                'api_key' => str_random(50),
                'api_secret' => str_random(50),
                'role' => 'admin',
                'status' => 1,
            ],
            [
                'id' => Uuid::generate(),
                'name' => 'Victor Gazotti',
                'email' => 'vtr.gomes@hotmail.com',
                'password' => Hash::make('secret'),
                'api_key' => str_random(50),
                'api_secret' => str_random(50),
                'role' => 'admin',
                'status' => 1,
            ],
        );

        foreach ($users as $user) {
            User::create($user);
        }

        for ($i = 0; $i < 100; $i++) {
            factory(\App\Domains\User\Model\User::class)->create();
        }

        Model::reguard();
    }
}
