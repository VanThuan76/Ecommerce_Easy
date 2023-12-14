<?php

namespace App\Http\Controllers;

use App\Http\Response\CommonResponse;
use App\Http\Response\ProductResponse;
use App\Models\Cart;
use App\Models\Product;
use Illuminate\Http\Request;

class CartController extends Controller
{
    use CommonResponse, ProductResponse;
    public function getList($userId)
    {
        $carts = Cart::where('user_id', $userId)->get();
        foreach ($carts as $key => $cart) {
            $product = Product::where("id", $cart->product_id)->first();
            $product->image = 'http://127.0.0.1:8000/storage/' . $product->image;
            $formattedProduct = $this->_formatProduct($product);
            $cart->product_infor = $formattedProduct;
        }
        $response = $this->_formatBaseResponse(200, $carts, 'Lấy dữ liệu thành công');
        return response()->json($response);
    }


    public function create(Request $res)
    {
        $cart = new Cart();
        $cart->user_id = $res->input('user_id');
        $cart->product_id = $res->input('product_id');
        $cart->quantity = $res->input('quantity');
        $cart->price = $res->input('price') * $res->input('quantity');

        $cart->save();
        $response = $this->_formatBaseResponse(200, null, 'Cập nhật dữ liệu thành công');
        return response()->json($response);
    }
    public function update(Request $res)
    {
        $cart = Cart::find($res->input('id'));
        if (!$cart) {
            $response = $this->_formatBaseResponse(404, null, 'Không tìm thấy sản phẩm trong giỏ hàng');
            return response()->json($response);
        }

        $cart->user_id = $res->input('user_id');
        $cart->product_id = $res->input('product_id');
        $cart->quantity = $res->input('quantity');
        $cart->price = $res->input('price') * $res->input('quantity');

        $cart->save();

        $response = $this->_formatBaseResponse(200, null, 'Cập nhật dữ liệu thành công');
        return response()->json($response);
    }

    public function delete($id)
    {
        $cart = Cart::find($id);
        if (!$cart) {
            $response = $this->_formatBaseResponse(404, null, 'Không tìm thấy sản phẩm trong giỏ hàng');
            return response()->json($response);
        }
        $cart->delete();
        $response = $this->_formatBaseResponse(200, null, 'Xoá sản phẩm khỏi giỏ hàng thành công');
        return response()->json($response);
    }

}
