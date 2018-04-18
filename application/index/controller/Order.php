<?php
namespace app\index\controller;

use think\Db;

class Order extends Common
{

    public function index()
    {
        $num = input("get.id");
        $data = Db::name("order")->alias("o")->where("ordernum",$num)->where("isdel",0)->join("cinema_platter p","p.id=o.pid","left")->find();
        if(!$data){
            $this->jsback("","无此订单号或此订单已被删");
        }
        
        $hallData = Db::name("moviehall")->where("id",$data['hallid'])->find();
        $movieData = Db::name("movie")->where("id",$data["movieid"])->find();
        
        $data["seat"] = json_decode($data["seat"],true);
        foreach($data['seat'] as &$val)
        {
            $val = str_replace("_","排",$val)."座";
        }
        unset($val);
        
        // dump($data);
        // dump($hallData);

        $this->assign("data",$data);
        $this->assign("movieData",$movieData);
        $this->assign("hallData",$hallData);
        return view();
    }
}
