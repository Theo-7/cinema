<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
class Index extends Controller
{
    public function index()
    {
        //where("datediff(now(),time)>0")
        $data = Db::name("movie")->field("id,name,cover")->limit(8)->select();
        foreach($data as &$val){
            $val["cover"] = json_decode($val["cover"],true);
            $val["cover"] = str_replace("\/","/",$val["cover"][0]);
        }
        unset($val);
        $this->assign("data",$data);
        return view();
    }
    public function header(){
        return view("header");
    }
}
