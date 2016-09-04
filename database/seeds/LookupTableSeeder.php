<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use App\Domains\Lookup\Model\Lookup;

class LookupTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('lookups')->delete();

        $lookups = array(
            [
                'endpoint' => '/register',
                'method' => 'POST',
                'description' => 'This endpoint is used to register members. After registration, you will receive an email with yout api_key and api_secret. Both neede to 
                get your access token',
                'user_type' => 'user',
            ],
            [
                'endpoint' => '/authenticate',
                'method' => 'POST',
                'description' => 'You must pass your api_secret and your api_key to receive your token. Only then you can access another methods ',
                'user_type' => 'user',
            ],
                        [
                'endpoint' => '/lookup',
                'method' => 'GET',
                'description' => 'You must pass your api_secret and your api_key to receive your token. Only then you can access another methods ',
                'user_type' => 'user',
            ],
            [
                'endpoint' => '/admin/users',
                'method' => 'GET',
                'description' => 'If you are admin, you can see all the details of all users',
                'user_type' => 'admin',
            ],
            [
                'endpoint' => '/admin/users/{userId}',
                'method' => 'PUT',
                'description' => 'The admin user can update all data of users',
                'user_type' => 'admin',
            ],
            [
                'endpoint' => '/users/{id}/suspend',
                'method' => 'POST',
                'description' => 'Endpoint used to admin suspend the access of any user',
                'user_type' => 'admin',
            ],
            [
                'endpoint' => '/users/{id}/',
                'method' => 'DELETE',
                'description' => 'Endpoint used to admin delete any user',
                'user_type' => 'admin',
            ],
            [
                'endpoint' => '/users-deleted',
                'method' => 'GET',
                'description' => 'Endpoint used to list all deleted user',
                'user_type' => 'admin',
            ],
        );

        foreach ($lookups as $lookup) {
            Lookup::create($lookup);
        }

        Model::reguard();
    }
}
