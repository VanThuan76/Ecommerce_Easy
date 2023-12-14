<?php

namespace App\Http\Controllers;

use App\Http\Response\CommonResponse;
use App\Models\Sales;
use Illuminate\Http\Request;

class SalesController extends Controller
{
    use CommonResponse;
    public function new(Request $res)
    {
        $sales = new Sales();
        $sales->payment_id = $res->input('payment_id');
        $sales->total = $res->input('total');

        $sales->save();
        $response = $this->_formatBaseResponse(200, $sales, 'Cập nhật dữ liệu thành công');
        return response()->json($response);
    }
}
