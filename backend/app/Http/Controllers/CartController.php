<?php

namespace App\Http\Controllers;

use App\Http\Response\CommonResponse;
use App\Models\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    use CommonResponse;
    public function getList(Request $res)
    {
        $carts = Cart::where('user_id', $res->input('user_id'))->get();
        $response = $this->_formatBaseResponse(200, $carts, 'Lấy dữ liệu thành công');
        return response()->json($response);
    }
    public function update(Request $res)
    {
        $cart = Cart::where('product_id', $res->input('product_id'))->first();
        if($res->input('quantity')){
            $cart->quantity = $res->input('quantity');
            $cart->price = $cart->product->price * $res->input('quantity');
        }
        $response = $this->_formatBaseResponse(200, null, 'Cập nhật dữ liệu thành công');
        return response()->json($response);
    }
}
