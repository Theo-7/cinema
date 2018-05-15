<?php
namespace app\index\controller;

use think\Db;

class Seat extends Common
{
    public function index()
    {
        $pid = input("get.pid");
        $pid = intval($pid);
        $pData = Db::name("platter")->alias("p")->join("cinema_movie m", "p.movieid=m.id", "left")->join("cinema_moviehall h", "p.hallid=h.id", "left")->where("p.id={$pid}")->column("p.id as pid,p.start as start,p.end as end,h.name as hallname,h.id as hid,h.seat as seat,m.name as moviename,m.cover as moviecover,m.version as version,p.price as price");
        $pData = array_values($pData)[0];
        $pData['moviecover'] = json_decode($pData['moviecover'], true);
        $pData['moviecover'] = str_replace("\/", "/", $pData["moviecover"][0]);
        $pData["start"] = strtotime($pData["start"]);
        $pData["end"] = strtotime($pData["end"]);
        //dump($pData);

        $seat = Db::name("order")->where("pid",$pid)->where("isdel",0)->field("seat")->select();
        $seatArr = [];
        if(!empty($seat[0])){
            foreach($seat as &$s){
                $seatArr = array_merge($seatArr,json_decode($s['seat'],true));
            }
            unset($s);
            $seatJson = json_encode($seatArr,JSON_UNESCAPED_UNICODE);
        }else{
            $seatJson = "[]";
        }
       
        
        $this->assign("seat",$seatJson);
        $this->assign("data", $pData);
        return view();
    }

    public function setorder()
    {
        $post = input("post.");
        $post['userid'] = session("user_id");

        if (empty($post["userid"])) {
            return ["code" => 0, "msg" => "错误", 'data' => []];
        }
        if (empty($post['seat'])) {
            return ["code" => 2, "msg" => "未选座位", "data" => []];
        }
        $post['seat'] = json_encode($post['seat'], JSON_UNESCAPED_UNICODE);
        $post['ordernum'] = date('Ymd') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
        $post["time"] = time();
        $uid = session("user_id");
        $user_group = Db::name("user")->alias("u")->where("u.id",$uid)->join("group g","u.groupid=g.id")->find();
        $post["realmoney"] = $post["money"];
        $post['money'] = $post['money']*($user_group["preferential"]/100);
        $result = Db::name("order")->insert($post);
        if ($result) {
            return ["code" => 1, "msg" => "成功", "data" => ["num"=>$post['ordernum']]];
        }
    }
}
