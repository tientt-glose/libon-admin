<?php

namespace Modules\Order\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\Core\Entities\User;

class Order extends Model
{
    protected $guarded = [];

    const CANCEL = 0; //Bi huy
    const BORROW_ORDER_CREATED_STATUS = 1; //Tao don muon thanh cong
    const BORROWING = 2; //Dang muon
    const DEADLINE_IS_COMMING = 3; //Sap toi han tra
    const OVERDUE = 4; //Qua han
    const RESTORED = 5; //Da tra


    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public static function genStatusHtml($status)
    {
        $html = '';
        switch ($status) {
            case self::CANCEL:
                $html .= '<span class="badge badge-danger"><i class="fas fa-times"></i>&nbsp;Bị hủy</span>';
                break;
            case self::BORROW_ORDER_CREATED_STATUS:
                $html .= '<span class="badge badge-info"><i class="fas fa-plus"></i>&nbsp;Tạo thành công</span>';
                break;
            case self::BORROWING:
                $html .= '<span class="badge badge-success"><i class="fa fa-refresh fa-spin"></i>&nbsp;Đang mượn</span>';
                break;
            case self::DEADLINE_IS_COMMING:
                $html .= '<span class="badge badge-warning"><i class="fas fa-clock"></i>&nbsp;Sắp tới hạn trả</span>';
                break;
            case self::OVERDUE:
                $html .= '<span class="badge badge-danger"><i class="fas fa-clock"></i>&nbsp;Quá hạn</span>';
                break;
            case self::RESTORED:
                $html .= '<span class="badge badge-success"><i class="fas fa-check"></i>&nbsp;Đã trả</span>';
                break;
            default:
                # code...
                break;
        }
        return $html;
    }

    public static function genColumnHtml($data)
    {
        $message = "'Bạn có chắc chắn muốn xóa đầu sách này không?'";
        $column = "";
        if (!empty($data)) {
            $column .= '<a href="' . route('book.books.the-books.index', $data->id) . '" class="btn btn-info btn-sm"><i class="fas fa-book" title="Danh sách các sách"></i></a>';
            $column .= '<a href="' . route('book.books.edit', $data->id) . '" class="btn btn-primary btn-sm"><i class="fas fa-edit" title="Sửa đầu sách"></i></a>';
            $column .= '<a href="' . route('book.books.destroy', $data->id) . '" onclick="return confirm(' . $message . ')" class="btn btn-danger btn-sm"><i class="fas fa-trash" title="Xóa đầu sách"></i></a>';
        }
        return $column;
    }
}
