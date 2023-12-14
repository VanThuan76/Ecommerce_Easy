<?php

namespace App\Http\Controllers;

use App\Http\Response\CommonResponse;
use App\Http\Response\ProductResponse;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    use CommonResponse, ProductResponse;
    public function getList()
    {
        $products = Product::query()->get();
        foreach ($products as $product) {
            $product->image = 'http://127.0.0.1:8000/storage/' . $product->image;
            $product = $this->_formatProduct($product);
        }
        $response = $this->_formatBaseResponse(200, $products, 'Lấy dữ liệu thành công');
        return response()->json($response);
    }
    public function getListSearch(Request $request)
    {
        $searchQuery = $request->input('search');
        $productsQuery = Product::query();
        if ($searchQuery) {
            $productsQuery->where('title', 'like', '%' . $searchQuery . '%')
                ->orWhere('description', 'like', '%' . $searchQuery . '%');
        }

        $products = $productsQuery->get();

        foreach ($products as $product) {
            $product->image = 'http://127.0.0.1:8000/storage/' . $product->image;
            $product = $this->_formatProduct($product);
        }

        $response = $this->_formatBaseResponse(200, $products, 'Lấy dữ liệu thành công');
        return response()->json($response);
    }

    public function getDetail($id)
    {
        $products = Product::query()->where('id', $id)->get();
        foreach ($products as $product) {
            $product->image = 'http://127.0.0.1:8000/storage/' . $product->image;
            $product = $this->_formatProduct($product);
        }
        $response = $this->_formatBaseResponse(200, $products->first(), 'Lấy dữ liệu thành công');
        return response()->json($response);
    }
    public function getListByGroup($group)
    {
        $products = Product::where('product_group_id', $group)->get();
        foreach ($products as $product) {
            $product->image = 'http://127.0.0.1:8000/storage/' . $product->image;
            $product = $this->_formatProduct($product);
        }
        $response = $this->_formatBaseResponse(200, $products, 'Lấy dữ liệu thành công');
        return response()->json($response);
    }
}
