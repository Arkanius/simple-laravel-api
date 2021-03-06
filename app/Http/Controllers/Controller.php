<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesResources;

class Controller extends BaseController
{
    use AuthorizesRequests, AuthorizesResources, DispatchesJobs, ValidatesRequests;

    protected $validationErrorMessage    = 'Invalid data, please check your fields';
    protected $resourceCreatedMessage    = 'User created successfully';
    protected $resourceUpdatedMessage    = 'User updated successfully';
    protected $resourceDeletedMessage    = 'User deleted successfully';
    protected $internalErrorMessage      = 'An error occurred please try again later';
    protected $invalidCredentialsMessage = 'Invalid credentials';
    protected $authSuccessMessage        = 'User authenticated successfully';
    protected $hasNoPermissionMessage    = 'You have no permission to access this action';
    protected $notFoundMessage           = 'Resource not found';


    public function __get($prop)
    {
        return $this->$prop;
    }

}
