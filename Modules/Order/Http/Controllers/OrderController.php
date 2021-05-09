<?php

namespace Modules\Order\Http\Controllers;

use stdClass;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Modules\Book\Entities\Book;
use Yajra\Datatables\Datatables;
use Modules\Order\Entities\Order;
use Illuminate\Routing\Controller;
use Modules\Book\Entities\TheBook;
use Illuminate\Support\Facades\Validator;
use Illuminate\Contracts\Support\Renderable;


class OrderController extends Controller
{
    protected $book;
    protected $order;
    protected $theBook;

    public function __construct(Book $book, TheBook $theBook, Order $order)
    {
        $this->book = $book;
        $this->order = $order;
        $this->theBook = $theBook;
    }

    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        $actions = request()->route()->getAction();
        $controller = (explode("@", $actions['controller']));
        $controller = $controller[0];
        return view('order::orders.index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('order::orders.create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        dd($request->all());
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        return view('order::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('order::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        //
    }

    public function get(Request $request)
    {
        $query = $this->order->with('user:id,id_card,fullname,id_staff_student');

        return Datatables::of($query)
            ->escapeColumns([])
            ->addColumn('actions', function ($order) {
                $html = $this->order->genColumnHtml($order);
                return $html;
            })
            ->editColumn('status', function ($order) {
                $html = $this->order->genStatusHtml($order->status);
                return $html;
            })
            ->editColumn('restore_deadline', function ($order) {
                if (!empty($order->restore_deadline)) {
                    return Carbon::parse($order->restore_deadline)->format('d-m-Y H:i');
                }
            })
            ->editColumn('pick_time', function ($order) {
                if (!empty($order->pick_time)) {
                    return Carbon::parse($order->pick_time)->format('d-m-Y H:i');
                }
            })
            ->editColumn('restore_time', function ($order) {
                if (!empty($order->restore_time)) {
                    return Carbon::parse($order->restore_time)->format('d-m-Y H:i');
                }
            })
            ->editColumn('created_at', function ($order) {
                if (!empty($order->created_at)) {
                    return Carbon::parse($order->created_at)->format('d-m-Y H:i');
                }
            })
            ->addColumn('user_name', function ($order) {
                if (!empty($order->user)) {
                    return $order->user->fullname;
                } else {
                    return '';
                }
            })
            ->addColumn('user_card', function ($order) {
                if (!empty($order->user)) {
                    return $order->user->id_card;
                } else {
                    return '';
                }
            })
            ->addColumn('user_code', function ($order) {
                if (!empty($order->user)) {
                    return $order->user->id_staff_student;
                } else {
                    return '';
                }
            })
            ->make(true);
    }

    public function addTheBookToOrder(Request $request)
    {
        try {
            $result = new stdClass();
            $params = $request->all();

            $validatorArray = [
                'list_barcode' => 'required',
            ];

            $messages = [
                'list_barcode.required' => 'Thiếu barcode của sách',
            ];

            $validator = Validator::make($params, $validatorArray, $messages);
            if ($validator->fails()) {
                $result->result = 0;
                $result->detail = $validator->errors();
                $result->message = 'Thiếu barcode của sách';
                return \response()->json($result);
            }
            $listBarcode = array_unique(preg_split('/\R/', $params['list_barcode']));

            $result->errorMess = array();
            $result->html = '';

            $i = $request->index;
            foreach ($listBarcode as $value) {
                $theBook = $this->theBook->getTheBookByBarcode($value);

                if (!empty($theBook)) {
                    if ($theBook->status == 1) {
                        $img = json_decode($theBook->book->pic_link);
                        $img = url($img[0]);

                        $result->html .= '<tr><td>' . ++$i . '</td>' .

                            '<td>' . $theBook->barcode . '<input type="hidden" name="barcode[]" value="' . $theBook->barcode . '"/></td>' .
                            '<td>' . $theBook->book->id . '<input type="hidden" name="book_id[]" value="' . $theBook->book->id . '"/></td>' .
                            '<td><img class="image-book" src="' . $img . '"></td>' .
                            '<td>' . $theBook->book->name . '</td>' .
                            '<td>' . $theBook->book->author . '</td>' .
                            '<td><button type="button" class="btn btn-danger btn-xs" onclick="deleteRow($(this))" title="Xóa sách"><i
                            class="fas fa-trash"></i></button></td></tr>';
                    } else {
                        array_push($result->errorMess, $value . ': Sách với barcode này không khả dụng');
                    };
                } else {
                    array_push($result->errorMess, $value . ': Không tồn tại cuốn sách có mã barcode này');
                }
            }

            $result->errorMess = nl2br(implode(PHP_EOL, $result->errorMess));
            $result->result = 1;
            return \response()->json($result);
        } catch (\Throwable $th) {
            $result->detail = $th->getMessage();
            $result->message = 'Lỗi nhập sách. Vui lòng thử lại';
            $result->result = 0;
            return \response()->json($result);
        }
    }
}
