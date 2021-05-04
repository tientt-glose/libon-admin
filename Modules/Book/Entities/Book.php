<?php

namespace Modules\Book\Entities;

use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    protected $fillable = [];

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'book_category', 'book_id', 'category_id')->withTimestamps();
    }

    public function getBookById($id)
    {
        return $this->where('id', $id)->first();
    }
}
