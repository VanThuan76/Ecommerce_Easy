<?php

namespace App\Http\Controllers\Auth;

use App\Http\Response\CommonResponse;
use App\Http\Controllers\Controller;
use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    use CommonResponse;
    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/';

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $cartExist = Cart::where("user_id", $user->id)->count();
            $transformedUser = [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'token' => $user->remember_token,
                'cartExits' => $cartExist
            ];
            $response = $this->_formatBaseResponse(200, $transformedUser, 'Thông tin thành viên không tồn tại');
        } else {
            $response = $this->_formatBaseResponse(400, null, 'Đăng nhập không thành công');
        }

        return response()->json($response);
    }


    public function logout(Request $request)
    {
        Auth::logout();
        return response()->json(['message' => 'Đăng xuất thành công']);
    }
}
