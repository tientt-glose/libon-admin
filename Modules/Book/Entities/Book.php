<?php

namespace Modules\Book\Entities;

use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    protected $fillable = [
        'name',
        'publisher_id',
        'page_number',
        'content_summary',
        'author',
        'pic_link'
    ];

    const BORROWABLE = 1;
    const UNBORROWABLE = 0;

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'book_category', 'book_id', 'category_id')->withTimestamps();
    }

    public function publisher()
    {
        return $this->belongsTo(Publisher::class);
    }

    public function getBookById($id)
    {
        return $this->where('id', $id)->first();
    }

    public function deleteBook($id)
    {
        return $this->where('id', $id)->delete();
    }

    public function getPicLink($id)
    {
        return $this->select('pic_link')->where('id', $id)->get();
    }

    public function updateBook($id, $book)
    {
        return $this->where('id', $id)->update($book);
    }

    public static function genColumnHtml($data)
    {
        $message = "'Bạn có chắc chắn muốn xóa đầu sách này không?'";
        $column = "";
        if (!empty($data)) {
            $column .= '<a href="' . route('book.books.edit', $data->id) . '" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>';
            $column .= '<a href="' . route('book.books.destroy', $data->id) . '" onclick="return confirm(' . $message . ')" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>';
        }
        return $column;
    }
}
