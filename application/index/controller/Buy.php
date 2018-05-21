<?php
namespace app\index\controller;

use think\Controller;
use think\Db;

class Buy extends Controller
{

    public function index()
    {
        $userid = session("user_id");
        $orderStatus = Db::name("order")->where(array("userid"=>$userid,"status"=>0,"isdel"=>0))->find();
        if($orderStatus){
            echo "<script>alert('你尚有订单未支付，请支付');location.href='/index/order?id={$orderStatus['ordernum']}'</script>";
        }
        $id = input("get.id");
        //电影信息
        $movieData = new Movie;
        $movieData = $movieData->getMovieByid($id);
        //电影排片信息
        $pdata = array();
        $datetime = date('Y-m-d H:i:s', time());
        $platterData = Db::name("platter")->alias("p")->where("movieid",$id)->join("cinema_moviehall h", "p.hallid=h.id", "left")->where("p.start>'{$datetime}'")->where("datediff('{$datetime}',p.start)<7")->column("p.id as pid,p.start as start,p.end as end,h.name as name,h.id as hid,p.price as price");
        //日期作为键名
        foreach ($platterData as $key => $val) {
            $k = date("Y-m-d", strtotime($val['start']));
            $pdata[$k][] = $val;
        }
        //dump($pdata);
        $this->assign("pdata", $pdata);
        $this->assign("movieData", $movieData);
        return view();
    }

}
