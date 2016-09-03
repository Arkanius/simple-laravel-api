<?php

namespace App\Domains\User\Service;

use Illuminate\Support\Facades\Mail;

class UserService
{
    private $emailMessage;
    private $emailSender;
    private $emailFrom;
    private $emailSubject;

    public function __construct()
    {
        $this->emailMessage = 'Test';
        $this->emailSender = 'Test2';
        $this->emailFrom = 'Test3';
        $this->emailSubject = 'Test4';
    }

    /**
     * Send email after register
     *
     * @param $emailData
     * @return bool
     */
    public function sendRegisterEmail($emailData)
    {
        if (empty($emailData)) {
            return false;
        }

        return Mail::raw($this->emailMessage, function($message) use ($emailData) {
            $message->from($this->emailFrom, $this->emailSender);
            $message->to($emailData['email'])->subject($this->emailSubject);
        });

    }
}