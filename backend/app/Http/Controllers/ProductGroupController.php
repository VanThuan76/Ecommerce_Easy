<?php

namespace App\Http\Controllers;

use App\Http\Response\CommonResponse;
use App\Models\ProductGroup;

class ProductGroupController extends Controller
{
    use CommonResponse;
    public function getList()
    {
        $productGroups = ProductGroup::all();
        $response = $this->_formatBaseResponse(200, $productGroups, 'Lấy dữ liệu thành công');
        return response()->json($response);
    }
}
