<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sales extends Model
{
    protected $table = 'sales';

    public function payment()
    {
        return $this->belongsTo(Payment::class, 'payment_id');
    }
	protected $hidden = [
    ];

	protected $guarded = [];
}
