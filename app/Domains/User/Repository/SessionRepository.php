<?php

namespace App\Domains\User\Repository;

use App\Domains\RepositoryInterface;
use App\Domains\User\Model\Session;
use Webpatser\Uuid\Uuid;

class SessionRepository implements RepositoryInterface
{

    private $model;
    private $tokenSize;

    public function __construct()
    {
        $this->model = new Session;
        $this->tokenSize = 50;
    }

    /**
     * Find "$Take" resources
     *
     * @param int $take
     * @param bool $paginate
     * @return mixed
     */
    public function findAll($take = 15, $paginate = true)
    {
        if ($paginate === true) {
            return $this->model
                ->query()
                ->paginate($take);
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
        $data['id']                = Uuid::generate();
        $data['user_id']           = 'b9180dc0-71a2-11e6-8596-fb5b9d7d20b5'; // (string) $data['id'];
        $data['token']             = str_random($this->tokenSize);
        $data['expiration_date']   = date('Y-m-d H:i:s', strtotime('+ 15 minutes'));

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
}