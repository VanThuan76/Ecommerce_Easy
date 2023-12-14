<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;
use App\Http\Response\CommonResponse;

class VnpayController extends Controller
{
    use CommonResponse;

    public function vnpayUrl(Request $res)
    {
        if (\App::environment('local')) {
            $vnp_Url = env('VNP_URL');
        } else {
            $vnp_Url = env('VNP_URL');
        }
        $vnp_Returnurl = env('VNP_RETURN_URL') . "/";
        $vnp_TmnCode = env('VNP_TMNCODE'); //Mã website tại VNPAY
        $vnp_HashSecret = env('VNP_HASHSECRET'); //Chuỗi bí mật

        $vnp_TxnRef = $res->input('orderId');
        $vnp_OrderInfo = 'Thanh toan website';
        $vnp_OrderType = 'billpayment';
        $vnp_Amount = $res->input('total') * 100;
        $vnp_Locale = config('app.locale');
        $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];

        $inputData = array(
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,
            "vnp_BankCode" => "Ncb"
        );

        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }
        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }
        Cart::where("user_id", $res->input('userId'))->delete();
        $response = $this->_formatBaseResponse(200, $vnp_Url, 'Chuyển hướng thành công');
        return response()->json($response);
    }
}