<?php

namespace App\Http\Controllers;

use App\Http\Response\CommonResponse;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    use CommonResponse;
    public function getList()
    {
        $products = Product::all();
        $response = $this->_formatBaseResponse(200, $products, 'Lấy dữ liệu thành công');
        return response()->json($response);
    }
    public function getListByGroup(Request $res)
    {
        $products = Product::where('product_group_id', $res->input('product_group_id'))->get();
        $response = $this->_formatBaseResponse(200, $products, 'Lấy dữ liệu thành công');
        return response()->json($response);
    }
}
