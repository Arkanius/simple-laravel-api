<?php

use App\Http\Controllers\UserController;
use App\Domains\User\Repository\UserRepository;

class UserTest extends TestCase
{
    private $version       = "v1";
    protected $baseUrl     = "http://lumen.lo/";

    private $messages;

    public function testMustReturnAllUsers()
    {
        $this->json('GET',
            $this->baseUrl.$this->version.'/users')
            ->seeJsonStructure([
                'message',
                'result' => [
                    'total',
                    'per_page',
                    'current_page',
                    'last_page',
                    'next_page_url',
                    'prev_page_url',
                    'from',
                    'to',
                    'data' => [
                        '*' => [
                            'id',
                            'name',
                            'email',
                            'role',
                            'api_key',
                            'api_secret',
                            'status',
                            'created_at',
                            'updated_at'
                        ]
                    ]
                ]
            ]);
    }

    public function testMustCreateANewUser()
    {
        $this->messages = new UserController(new UserRepository);

        $this->json('POST',
            $this->baseUrl.$this->version.'/user',
            [
                'name'           => 'John Petrucci',
                'email'          => 'johnpetrucci@dreamtheater.net',
                'password'       => 'imyourgod',
            ])
            ->seeJsonEquals([
                'message' => $this->messages->resourceCreatedMessage,
                'data' => ''
            ]);
    }
}