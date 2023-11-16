<?php

namespace App\Http\Controllers;

use App\Http\Response\CommonResponse;
use App\Models\Payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    use CommonResponse;
    public function new(Request $res)
    {
        $data = $res->all();
        $payment = new Payment();
        $payment->create($data);
        
        $response = $this->_formatBaseResponse(200, null, 'Lấy dữ liệu thành công');
        return response()->json($response);
    }
}
