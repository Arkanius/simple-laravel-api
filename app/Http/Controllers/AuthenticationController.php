<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Domains\User\Repository\UserRepository;
use App\Domains\User\Service\UserService;
use Illuminate\Support\Facades\Validator;

class AuthenticationController extends Controller
{
    private $repository;

    public function __construct(UserRepository $userRepository)
    {
        $this->repository = $userRepository;
    }

    public function authenticate(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'api_secret'    => 'required|max:255',
            'api_key'       => 'required|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => [
                    $this->validationErrorMessage,
                    $validator->errors()
                ],
                'data' => ''
            ], 422);
        }

        $result = $this->repository->findBySecretAndKey($request->api_secret, $request->api_key);

        if (empty($result[0])) {
            if ($validator->fails()) {
                return response()->json([
                    'message' => [
                        $this->invalidCredentialsMessage,
                        $validator->errors()
                    ],
                    'data' => ''
                ], 401);
            }
        }

        return response()->json([
            'message' => '',
            'data' => ['access_token' => str_random(50)]
        ], 200);


    }

}