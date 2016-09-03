<?php

namespace App\Domains\Session\Service;

use App\Domains\Session\Repository\SessionRepository;

class SessionService
{

    public static function refreshToken($token)
    {
        $sessionRepository = new SessionRepository();

        $userToken = $sessionRepository->findBy('token', $token);

        if ($userToken === false or empty($userToken)) {
            return response()->json([
                'message' => 'Invalid token',
                'data' => ''
            ], 401);
        }

        if ($userToken->expiration_date < date('Y-m-d H:i:s')) {
            $sessionRepository->delete($userToken->id);
            return response()->json([
                'message' => 'Token expired',
                'data' => ''
            ], 401);
        }

        $data = [
            'expiration_date' => date('Y-m-d H:i:s', strtotime('+ 15 minutes'))
        ];

        if (date('Y-m-d H:i:s', strtotime('+ 5 minutes', strtotime($userToken->created_at)))
                <= date('Y-m-d H:i:s')) {

            $refreshedToken = str_random(50);

            $data['token']      = $refreshedToken;
            $data['created_at'] = date('Y-m-d H:i:s');

            $sessionRepository->update(['id' => $userToken->id], $data);

            return response()->json([
                'message' => 'Refreshed token',
                'data' => ['token' => $refreshedToken]
            ], 401);
        }

        $sessionRepository->update(['id' => $userToken->id], $data);

    }

}