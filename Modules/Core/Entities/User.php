<?php

namespace Modules\Core\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\Order\Entities\Order;

class User extends Model
{
    protected $fillable = [];

    protected $table = 'users';

    const CHECK_BY_CARD = 1;
    const CHECK_BY_CODE = 0;

    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    public function organization()
    {
        return $this->belongsTo(Organization::class);
    }

    public function getUserByCard($userCard)
    {
        return $this->where('id_card', $userCard)->firstOrFail();
    }

    public function getUserByCode($userCode)
    {
        return $this->where('id_staff_student', $userCode)->firstOrFail();
    }

    public function getUserForAuth($email)
    {
        return $this->where('email', '=', $email)->select(['id', 'email', 'password', 'access_token', 'fullname'])->first();
    }

    public function getUserByAccessToken($accessToken)
    {
        return $this->where('access_token', $accessToken)->get();
    }

    public function updateUser($id, $params)
    {
        return $this->where('id', $id)->update($params);
    }
}
