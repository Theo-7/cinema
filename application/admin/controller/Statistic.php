<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Validate;
class Statistic extends Common
{
    public function index()
    {
        $data = Db::name("order")->group("date_format(paytime,'%Y%m%d')")->where("isdel",0)->field("SUM(money) as money,date_format(paytime,'%Y%m%d') as day")->select();
        
        $date = [];
        $money = [];
        foreach($data as $key=>$val){
            $date[] = $val["day"];
            $money[] = $val["money"];
        }
        $this->assign("date",$date);
        $this->assign("money",$money);
        return view("statistic");
    }
   
}
