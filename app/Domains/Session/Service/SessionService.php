<?php

namespace App\Domains\Session\Service;

use App\Domains\Session\Repository\SessionRepository;

class SessionService
{

    public static function refreshToken($token)
    {
        $sessionRepository = new SessionRepository();

        $user = $sessionRepository->findBy('token', $token);

        if ($user === false or empty($user)) {
            return response()->json([
                'message' => 'Invalid token',
                'data' => ''
            ], 401);
        }


        if ($user->expiration_date < date('Y-m-d H:i:s')) {
            $sessionRepository->delete($user->id);
            return response()->json([
                'message' => 'Token expired',
                'data' => ''
            ], 401);
        }

        $sessionRepository->update(['id' => $user->id],
            [
                'expiration_date' => date('Y-m-d H:i:s', strtotime('+ 55 minutes', date('Y-m-d H:i:s')))
            ]);


    }
}