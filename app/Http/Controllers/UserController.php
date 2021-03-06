<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Domains\User\Repository\UserRepository;
use App\Domains\Lookup\Repository\LookupRepository;
use App\Domains\User\Service\UserService;
use App\Domains\User\Service\IdentifyService;
use App\Domains\Session\Service\SessionService;
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

        if (IdentifyService::isAdmin($request->token) === false) {
            return response()->json([
                'message' => $this->hasNoPermissionMessage,
                'data'  => ''
            ], 403);
        }

        SessionService::refreshToken($request->token);

        return response()->json([
            'message' => '',
            'result'  => $this->repository->findAll(15, true, ['value' => $request->token])
        ], 200);
    }

    /**
     * Create user
     *
     * @param Request $request
     */
    public function register(Request $request)
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

        $userService = new UserService();
        $userService->sendRegisterEmail($result);

        return response()->json([
            'message' => $this->resourceCreatedMessage.'. An email was sent with your credentials',
            'data' => ''
        ], 200);
    }

    /**
     * Update user
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        $tokenStatus = SessionService::refreshToken($request->token);

        if (!empty($tokenStatus)) {
            return $tokenStatus;
        }

        if (IdentifyService::isAdmin($request->token) === false) {
            return response()->json([
                'message' => $this->hasNoPermissionMessage,
                'data'  => ''
            ], 403);
        }

        if (empty($this->repository->findBy('id', $id))) {
            return response()->json(['message' => $this->notFoundMessage, 'data' => ''], 422);
        }

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

        $data = [
            'name'        => $request->name,
            'email'       => $request->email,
            'password'    => bcrypt($request->password),
        ];

        $result = $this->repository->update(['id' => $id], $data);

        if (!$result or empty($result)) {
            return response()->json(['message' => $this->internalErrorMessage, 'data' => ''], 500);
        }

        return response()->json(['message' => $this->resourceUpdatedMessage, 'data' => ''], 200);
    }

    /**
     * Disable user access
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function suspendAccess(Request $request, $id)
    {
        $tokenStatus = SessionService::refreshToken($request->token);

        if (!empty($tokenStatus)) {
            return $tokenStatus;
        }

        if (IdentifyService::isAdmin($request->token) === false) {
            return response()->json([
                'message' => $this->hasNoPermissionMessage,
                'data'  => ''
            ], 403);
        }

        if (empty($this->repository->findBy('id', $id))) {
            return response()->json(['message' => $this->notFoundMessage, 'data' => ''], 422);
        }

        $result = $this->repository->update(['id' => $id], ['status' => 2]);

        if (!$result or empty($result)) {
            return response()->json(['message' => $this->internalErrorMessage, 'data' => ''], 500);
        }

        return response()->json(['message' => $this->resourceUpdatedMessage, 'data' => ''], 200);
    }

    /**
     * Delete user
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Request $request, $id)
    {
        $tokenStatus = SessionService::refreshToken($request->token);

        if (!empty($tokenStatus)) {
            return $tokenStatus;
        }

        if (IdentifyService::isAdmin($request->token) === false) {
            return response()->json([
                'message' => $this->hasNoPermissionMessage,
                'data'  => ''
            ], 403);
        }

        if (empty($this->repository->findBy('id', $id))) {
            return response()->json(['message' => $this->notFoundMessage, 'data' => ''], 422);
        }

        $result = $this->repository->update(['id' => $id], ['status' => 0]);

        if (!$result or empty($result)) {
            return response()->json(['message' => $this->internalErrorMessage, 'data' => ''], 500);
        }

        return response()->json(['message' => $this->resourceDeletedMessage, 'data' => ''], 200);
    }

    /**
     * Find user specified by id
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Request $request, $id)
    {
        $tokenStatus = SessionService::refreshToken($request->token);

        if (!empty($tokenStatus)) {
            return $tokenStatus;
        }

        if (IdentifyService::isAdmin($request->token) === false) {
            return response()->json([
                'message' => $this->hasNoPermissionMessage,
                'data'  => ''
            ], 403);
        }

        $users = $this->repository->findBy('id', $id);

        if (empty($users)) {
            return response()->json(['message' => $this->notFoundMessage, 'data' => ''], 422);
        }

        return response()->json([
            'message' => '',
            'data'  => $users
        ], 200);

    }

    /**
     * Show all deleted users
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleted(Request $request)
    {
        $tokenStatus = SessionService::refreshToken($request->token);

        if (!empty($tokenStatus)) {
            return $tokenStatus;
        }

        if (IdentifyService::isAdmin($request->token) === false) {
            return response()->json([
                'message' => $this->hasNoPermissionMessage,
                'data'  => ''
            ], 403);
        }

        return response()->json([
            'message' => '',
            'result'  => $this->repository->findUserStatus('0')
        ], 200);
    }

    /**
     * Show all routes according to user role
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function lookup(Request $request)
    {
        $tokenStatus = SessionService::refreshToken($request->token);

        if (!empty($tokenStatus)) {
            return $tokenStatus;
        }

        $userType = 'admin';
        if (IdentifyService::isAdmin($request->token) === false) {
            $userType = 'user';
        }

        $routes = new LookupRepository();

        return response()->json([
            'message' => '',
            'result'  => $routes->findAllBy('user_type', $userType)
        ], 200);


    }

}