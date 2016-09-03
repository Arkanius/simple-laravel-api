<?php

namespace App\Domains;

interface RepositoryInterface
{
    /**
     * Find "$Take" resources
     *
     * @param int $take
     * @param bool $paginate
     * @return mixed
     */
    public function findAll($take = 15, $paginate = true);

    /**
     * Find by "$atribute" equals to "$value"
     *
     * @param $attribute
     * @param $value
     * @param array $columns
     * @return mixed
     */
    public function findBy($attribute, $value, $columns = array('*'));

    /**
     * Create resource
     *
     * @param array $data
     * @return mixed
     */
    public function create(array $data);

    /**
     * Update resource
     *
     * @param array $where
     * @param array $data
     * @return mixed
     */
    public function update(array $where, array $data);

    /**
     * Delete resource
     *
     * @param $id
     * @return mixed
     */
    public function delete($id);
}