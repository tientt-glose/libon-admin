<?php

namespace Modules\Core\Http\Controllers;

use stdClass;
use Illuminate\Http\Request;
use Modules\Core\Entities\User;
use Illuminate\Routing\Controller;
use Illuminate\Contracts\Support\Renderable;

class UserController extends Controller
{
    protected $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }

    public function checkUserInfo(Request $request)
    {
        try {
            $result = new stdClass();

            switch ($request->status) {
                case $this->user::CHECK_BY_CODE:
                    $result->message = $this->user->getUserByCode($request->user_code);
                    $result->result = 1;
                    break;
                case $this->user::CHECK_BY_CARD:
                    $result->message = $this->user->getUserByCard($request->user_code);
                    $result->result = 1;
                    break;
                default:
                    $result->message = 'Không tìm thấy người dùng';
                    $result->result = 0;
                    break;
            }

            return \response()->json($result);
        } catch (\Throwable $th) {
            $result->detail = $th->getMessage();
            $result->message = 'Không tìm thấy người dùng';
            $result->result = 0;
            return \response()->json($result);
        }
    }
}
