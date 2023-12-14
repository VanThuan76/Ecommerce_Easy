<?php

namespace App\Http\Controllers;

use App\Http\Response\CommonResponse;
use App\Models\Payment;
use App\Models\Sales;
use Illuminate\Http\Request;
use Carbon\Carbon;

class PaymentController extends Controller
{
    use CommonResponse;
    public function new(Request $res)
    {
        $payment = new Payment();
        $sale = new Sales();
        $payment->user_id = $res->input('userId');
        $payment->date = Carbon::today();
        $payment->address = $res->input('address');
        if($res->input('note')){
            $payment->note = $res->input('note');
        }
        $payment->type = $res->input('type');
        if($res->input('type') == 2){
            $payment->status = 1;
        }
        $payment->save();
        
        $sale->payment_id = $payment->id;
        $sale->total = $res->input('total');
        $sale->save();

        $response = $this->_formatBaseResponse(200, $payment, 'Cập nhật dữ liệu thành công');
        return response()->json($response);
    }
}
