<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Domains\User\Repository\UserRepository;
use App\Domains\User\Service\UserService;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    private $repository;

    /**
     * UserController constructor.
     * @param UserRepository $repository
     */
    public function __construct(UserRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * Get all users
     * @return mixed
     */
    public function index(Request $request)
    {
        return response()->json([
            'message' => '',
            'result'  => $this->repository->findAll()
        ], 200);
    }

    /**
     * Create user
     *
     * @param Request $request
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'           => 'required|max:255',
            'email'          => 'required|email',
            'password'       => 'required|max:50',
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

        if (!empty($this->repository->findBy('email', $request->email))) {
            return response()->json(['message' => $this->validationErrorMessage.'.  Email already in use', 'data' => ''], 422);
        }

        $result = $this->repository->create($request->all());

        if (empty($result)) {
            return response()->json(['message' => $this->internalErrorMessage, 'data' => ''], 500);
        }

        $emailService = new UserService();
        $emailService->sendRegisterEmail([$request->email]);

        return response()->json([
            'message' => $this->resourceCreatedMessage,
            'data' => ''
        ], 200);
    }
}