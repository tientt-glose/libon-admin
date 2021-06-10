<?php

namespace Modules\Book\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

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

    public function theBooks()
    {
        return $this->hasMany(TheBook::class);
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'book_category', 'book_id', 'category_id')->withTimestamps();
    }

    public function publisher()
    {
        return $this->belongsTo(Publisher::class);
    }

    public function booksInOrders()
    {
        return $this->hasMany(BookInOrder::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function getBookById($id)
    {
        return $this->where('id', $id)->first();
    }

    public function getBookWithPubById($id)
    {
        return $this->where('id', $id)->with('publisher')->first();
    }

    public function getPicLink($id)
    {
        return $this->select('pic_link')->where('id', $id)->get();
    }

    public function getPreviewLink($id)
    {
        return $this->select('preview_link')->where('id', $id)->first();
    }

    public function getBasicBook()
    {
        return $this->select('id', 'name')->get();
    }

    public function checkStatusOfBook($id)
    {
        return $this->where('id', $id)->whereHas('theBooks', function (Builder $query) {
            $query->where('status', '!=', 0);
        })->exists();
    }

    public function updateBook($id, $book)
    {
        return $this->where('id', $id)->update($book);
    }

    public function updateQuantity($id, $count)
    {
        return $this->where('id', $id)->update([
            'quantity' => $count
        ]);
    }
    public function updateBorrowed($id, $count)
    {
        return $this->where('id', $id)->update([
            'borrowed' => $count
        ]);
    }

    public function updateStatus($id, $status)
    {
        return $this->where('id', $id)->update([
            'can_borrow' => $status
        ]);
    }

    public function deleteBook($id)
    {
        return $this->where('id', $id)->delete();
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
