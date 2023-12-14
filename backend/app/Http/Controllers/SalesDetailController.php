<?php

namespace App\Http\Controllers;

use App\Http\Response\CommonResponse;
use App\Models\SalesDetail;
use Illuminate\Http\Request;

class SalesDetailController extends Controller
{
    use CommonResponse;
    public function new(Request $res)
    {
        $salesDetail = new SalesDetail();
        $salesDetail->sales_id = $res->input('sales_id');
        $salesDetail->product_id = $res->input('product_id');
        $salesDetail->quanlity = $res->input('quanlity');

        $salesDetail->save();
        $response = $this->_formatBaseResponse(200, null, 'Cập nhật dữ liệu thành công');
        return response()->json($response);
    }
}
