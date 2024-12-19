<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shop extends Model
{
    use HasFactory;

    public function Area()
    {
        return $this->belongsTo(area::class);
    }

    public function routes()
    {
        return $this->belongsToMany(route::class);
    }
}
