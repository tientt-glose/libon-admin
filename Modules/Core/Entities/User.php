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

    public function getUserByCard($userCard)
    {
        return $this->where('id_card', $userCard)->firstOrFail();
    }

    public function getUserByCode($userCode)
    {
        return $this->where('id_staff_student', $userCode)->firstOrFail();
    }
}
