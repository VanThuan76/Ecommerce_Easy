<?php

namespace App\Http\Response;

trait CommonResponse
{
    private function _formatBaseResponse($statusCode, $data, $message)
    {
        return [
            'statusCode' => $statusCode,
            'data' => $data,
            'message' => $message,
        ];
    }
}
