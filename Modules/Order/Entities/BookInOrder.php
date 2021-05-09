<?php

namespace Modules\Order\Entities;

use Illuminate\Database\Eloquent\Model;

class BookInOrder extends Model
{
    protected $fillable = [];
    protected $table = 'books_in_orders';

    public function book()
    {
        return $this->belongsTo(Book::class);
    }

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function theBook()
    {
        return $this->belongsTo(TheBook::class);
    }
}
