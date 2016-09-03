<?php

namespace App\Domains\User\Service;

use Mail;
use App\Domains\User\Model\User;

class UserService
{
    private $emailMessage;
    private $emailSender;
    private $emailFrom;
    private $emailSubject;

    public function __construct()
    {
        $this->emailSender = 'Victor Gazotti';
        $this->emailFrom = 'vtr.gomes@hotmail.com';
        $this->emailSubject = 'Confirmação de cadastro';
    }

    /**
     * Send registration email
     *
     * @param User $userData
     * @return bool
     */
    public function sendRegisterEmail(User $userData)
    {
        if (empty($userData)) {
            return false;
        }

        $this->emailMessage = "Olá, $userData->name, o seu cadastro foi efetuado com sucesso!\n
        Seguem os dados para acesso:\n
        API_SECRET: $userData->api_secret\n
        API_KEY: $userData->api_key
        ";


        Mail::raw($this->emailMessage, function($message) use ($userData) {
            $message->from($this->emailFrom, $this->emailSender);
            $message->to($userData->email)->subject($this->emailSubject);
        });
    }

}