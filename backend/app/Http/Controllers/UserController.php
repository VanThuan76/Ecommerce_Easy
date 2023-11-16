<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Response\CommonResponse;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    use CommonResponse;

    public function getById($id)
    {
        $user = User::find($id);

        if (!$user) {
            $response = $this->_formatBaseResponse(404, null, 'Người dùng không được tìm thấy');
            return response()->json($response, 404);
        }
        $transformedUser = [
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
        ];
        $response = $this->_formatBaseResponse(200, $transformedUser, 'Lấy dữ liệu thành công');
        return response()->json($response);
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:22'],
            'password' => ['required', 'string', 'min:6', 'confirmed'],
        ]);
    }

    public function update(Request $request)
    {
        $user = User::where('id', $request->id)->first();

        if ($request->input('name')) {
            $user->name = $request->input('name');
        }
        if ($request->input('email')) {
            $user->email = $request->input('email');
        }
        if ($request->input('address')) {
            $user->address = $request->input('address');
        }
        if ($request->has('gender')) {
            $user->gender = $request->input('gender');
        }
        if ($request->input('birthday')) {
            $user->birthday = date("Y-m-d", strtotime($request->input('birthday')));
        }
        if ($request->hasFile('avatar')) {
            $imagePath = $request->file('avatar')->store('avatars', 'public');
            $user->avatar = $imagePath;
        }
        $user->save();
        if ($user) {
            $response = $this->_formatBaseResponse(200, $user, 'Cập nhật thành công');
            return response()->json($response);
        } else {
            $response = $this->_formatBaseResponse(401, null, 'Cập nhật không thành công');
            return response()->json($response, 401);
        }
    }
}
