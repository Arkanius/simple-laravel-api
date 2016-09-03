<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Domains\User\Repository\UserRepository;
use App\Domains\Session\Repository\SessionRepository;
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

        $user = $this->repository->findUserBySecretAndKey($request->api_secret, $request->api_key);

        if (empty($user[0])) {
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

        $sessionRepository = new SessionRepository();
        $result = $sessionRepository->create(['id' => $user[0]->id]);

        if (!empty($result)) {
            return response()->json([
                'message' => $this->authSuccessMessage,
                'data' => ['access_token' => $result->token]
            ], 200);
        }

        return response()->json([
            'message' => [
                $this->internalErrorMessage,
            ],
            'data' => ''
        ], 500);

    }

}