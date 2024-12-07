<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Area;
use App\Models\Shop;

class ShopController extends Controller
{
    public function index()
    {
        // 1対多　リレーション
        $shops = Area::find(1)->shops;
        // 親→子リレーション検証
        $areas = Shop::find(3)->area;
        // 多対多リレーション検証
        $routes = Shop::find(1)->routes()->get();
        dd($shops,$areas,$routes);
    }
}
