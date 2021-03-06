<?php

namespace App\Domains\User\Repository;

use App\Domains\RepositoryInterface;
use App\Domains\User\Model\User;
use Webpatser\Uuid\Uuid;

class UserRepository implements RepositoryInterface
{
    private $model;
    private $apiSecretSize;

    public function __construct()
    {
        $this->model = new User;
        $this->apiSecretSize = 50;
    }

    /**
     * Find all users
     *
     * @param int $take
     * @param bool $paginate
     * @param bool $token
     * @return \Illuminate\Contracts\Pagination\LengthAwarePaginator
     */
    public function findAll($take = 15, $paginate = true, array $token)
    {
        if ($paginate === true) {
            return $this->model
                ->query()
                ->paginate($take)
                ->addQuery('token', $token['value']);
        }
        return $this->model
            ->query()
            ->take($take)
            ->get();
    }

    /**
     * Find by "$atribute" equals to "$value"
     *
     * @param $attribute
     * @param $value
     * @param array $columns
     * @return mixed
     */
    public function findBy($attribute, $value, $columns = array('*'))
    {
        if (empty($attribute) or empty($value)) {
            return false;
        }
        return $this->model->where($attribute, '=', $value)->first($columns);
    }

    /**
     * Create resource
     *
     * @param array $data
     * @return mixed
     */
    public function create(array $data)
    {
        if (empty($data)) {
            return false;
        }

        $data['id']           = Uuid::generate();
        $data['password']     = app('hash')->make($data['password']);
        $data['role']         = 'user';
        $data['status']       = 1;
        $data['api_key']      = str_random($this->apiSecretSize);
        $data['api_secret']   = str_random($this->apiSecretSize);

        return $this->model->create($data);
    }

    /**
     * Update resource
     *
     * @param array $where
     * @param array $data
     * @return mixed
     */
    public function update(array $where, array $data)
    {
        if (empty($where) or empty($data)) {
            return false;
        }
        return $this->model->where($where)->update($data);
    }

    /**
     * Delete resource
     *
     * @param $id
     * @return mixed
     */
    public function delete($id)
    {
        if (empty($id)) {
            return false;
        }

        $deleted = $this->model->find($id);

        if (empty($deleted)) {
            return false;
        }

        return $deleted->delete();
    }

    /**
     * Find user
     *
     * @param $apiSecret
     * @param $apiKey
     * @return bool
     */
    public function findUserBySecretAndKey($apiSecret, $apiKey)
    {
        if (empty($apiKey) or empty($apiSecret)) {
            return false;
        }

        return $this->model->where(['api_secret' => $apiSecret])
                        ->where(['api_key' => $apiKey])
                        ->get();
    }

    /**
     * Find user specified by status
     *
     * @param $status
     * @param int $take
     * @return mixed
     */
    public function findUserStatus($status, $take = 15)
    {
        return $this->model
            ->where('status', $status)
            ->paginate($take);
    }


}