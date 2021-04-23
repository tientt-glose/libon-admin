<?php

namespace Modules\Book\Http\Controllers\api;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use Modules\Core\Http\Controllers\ApiController;
use Modules\Book\Entities\Category;
use Modules\Book\Entities\Book;

use stdClass;

class BookController extends ApiController
{
    protected $book;
    protected $category;

    //todo: tai sao lai can
    public function __construct(Book $book, Category $category)
    {
        $this->book = $book;
        $this->category = $category;
    }

    public function getAllBook(Request $request)
    {
        try {
            $listData = new stdClass();
            $listData->book = Book::select('*')->get();
            if ($listData) {
                return $this->successResponse(['result' => $listData], 'Response Successfully');
            } else {
                return $this->errorResponse([], 'Data not exist!');
            }
            //todo: hoi ve dau gach \, hoi ve chuc nang catch o duoi (lay message tu dau)
        } catch (\Throwable $th) {
            return $this->errorResponse([], $th->getMessage());
        }
    }

    public function getBookDetail(Request $request)
    {
        try {
            $id = $request->id;

            if (empty($id)) {
                return $this->errorResponse([], 'Invalid! Need id of the book.');
            }

            $bookItem = $this->book->getBookById($id);

            if ($bookItem) {
                return $this->successResponse(['result' => $bookItem], 'Response Successfully');
            } else {
                return $this->errorResponse([], 'None data!');
            }
        } catch (\Throwable $th) {
            return $this->errorResponse([], $th->getMessage());
        }
    }
}
