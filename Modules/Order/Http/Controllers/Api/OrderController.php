<?php

namespace Modules\Order\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

use Modules\Core\Http\Controllers\ApiController;
use Modules\Order\Entities\Order;

use Carbon\Carbon;

class OrderController extends ApiController
{
    protected $order;

    public function __construct(Order $order)
    {
        $this->order = $order;
    }

    public function createBorrowOrder(Request $request)
    {
        DB::beginTransaction();
        try {
            $params = $request->all();

            $validatorArray = [
                'book_id' => 'required',
                'user_info' => 'required'
            ];
            $messages = [
                'book_id.required' => 'Miss id of the book',
                'user_info.required' => 'Miss user information.'
            ];
            $validator = Validator::make($params, $validatorArray, $messages);
            if ($validator->fails()) {
                return $this->successResponse(["errors" => $validator->errors()], 'Response Successfully');
            }

            $order = [];
            $order['status'] = $this->order::BORROW_ORDER_CREATED_STATUS;
            $order['book_id'] = $params['book_id'];
            $order['user_info'] = $params['user_info'];
            $order['created_at'] = Carbon::now();
            $params['order_id'] = $this->order::insertGetId($order);

            DB::commit();
            return $this->successResponse(["success" => 1], 'Response Successfully');

        } catch (\Throwable $th) {
            DB::rollBack();
            // todo: how to xem log
            Log::error('[Borrow Order] ' . $th->getMessage());
            return $this->errorResponse([], $th->getMessage());
        }
    }
}
