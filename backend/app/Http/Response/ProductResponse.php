<?php

namespace App\Http\Response;

use App\Models\ProductGroup;
use App\Models\Promotion;

trait ProductResponse
{
    private function _formatProduct($product)
    {
        $productGroup = ProductGroup::all()->keyBy('id');
        if ($product->product_group_id != null) {
            if ($productGroupRecord = $productGroup->get($product->product_group_id)) {
                $product->product_group = $productGroupRecord;
            } else {
                $product->product_group = null;
            }
        }

        $promotions = Promotion::all()->keyBy('product_id');
        if ($promotions->has($product->id)) {
            $promotionRecord = $promotions->get($product->id);
            $product->promotion = $promotionRecord;
        } else {
            $product->promotion = null;
        }
        return $product;
    }
}
