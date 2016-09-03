<?php

namespace App\Domains\Session\Service;

use App\Domains\Session\Repository\SessionRepository;

class SessionService
{

    public static function refreshToken($token)
    {
        $sessionRepository = new SessionRepository();

        $user = $sessionRepository->findBy('token', $token);

        if (empty($user)) {
            return 'Invalid token';
        }

        if ($user->expiration_date < date('Y-m-d H:i:s')) {
            $sessionRepository->delete($user->id);
            return 'Token expired';
        }

        $sessionRepository->update(['id' => $user->id],
            [
                'expiration_date' => date('Y-m-d H:i:s', strtotime('+ 5 minutes', strtotime($user->expiration_date)))
            ]);


    }
}