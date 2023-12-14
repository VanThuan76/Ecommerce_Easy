<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Promotion extends Model
{
    protected $table = 'promotion';

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
	protected $hidden = [
    ];

	protected $guarded = [];
}
