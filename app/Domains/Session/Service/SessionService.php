<?php

namespace App\Domains\Session\Service;

use App\Domains\Session\Repository\SessionRepository;

class SessionService
{
    private $tokenTimeExpiration;
    private $invalidTokenMessage;
    private $expiredTokenMessage;

    public function __construct()
    {
        $this->tokenTimeExpiration  = '+ 5 minutes';
        $this->invalidTokenMessage  = 'Invalid token';
        $this->expiredTokenMessage  = 'Token expired';
    }
    public function refreshToken($token)
    {
        $sessionRepository = new SessionRepository();

        $user = $sessionRepository->findBy('token', $token);

        if (empty($user)) {
            return $this->invalidTokenMessage;
        }

        if ($user->expiration_date < date('Y-m-d H:i:s')) {
            return $this->expiredTokenMessage;
        }

        return $sessionRepository->update([
                'id' => $user->id
            ],
            [
                'expiration_date' => date('Y-m-d H:i:s', strtotime($this->tokenTimeExpiration, strtotime($user->expiration_date)))
            ]);

    }
}