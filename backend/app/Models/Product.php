<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';

    public function productGroup()
    {
        return $this->belongsTo(ProductGroup::class, 'product_group_id');
    }

	protected $hidden = [
    ];

	protected $guarded = [];
}
