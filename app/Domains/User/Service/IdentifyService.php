<?php

namespace App\Domains\User\Service;

use App\Domains\Session\Repository\SessionRepository;
use App\Domains\User\Repository\UserRepository;

class IdentifyService
{

    /**
     * Verify if user has admin permission
     *
     * @param $token
     * @return bool
     */
    public static function isAdmin($token)
    {
        $sessionRepository = new SessionRepository();
        $userRepository    = new UserRepository();

        $userId = $sessionRepository->findBy('token', $token);

        $userRole = $userRepository->findBy('id', $userId->user_id);

        if ($userRole->role == 'admin') {
            return true;
        }

        return false;
    }
}