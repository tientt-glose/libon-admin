<?php

namespace Modules\Book\Entities;

use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    protected $fillable = [];

    public function getBookById($id)
    {
        return $this->where('id', $id)->first();
    }
}
