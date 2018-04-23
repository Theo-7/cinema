<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Ticket extends Common
{
    public function index()
    {
        return view("ticket");
    }
    
    public function printTic(){
        $post = input("post.num");
        $post = intval($post);

        $field = "m.name as moviename,p.start,p.end,h.name as hallname,o.seat,o.takenum,o.ordernum,o.num,o.money,u.phone,o.status";
        $data = Db::name("order")->alias("o")->where("takenum",$post)->where("isdel",0)->join("cinema_platter p","o.pid=p.id","left")->join("cinema_movie m","p.movieid=m.id")->join("cinema_moviehall h","p.hallid=h.id")->join("cinema_user u","u.id=o.userid")->field($field)->order("o.id desc")->select();
        
        foreach($data as &$val)
        {
            $val['seat'] = json_decode($val['seat'],true);
            foreach($val['seat'] as &$v)
            {
                $v = str_replace("_","排",$v)."座";

            }
        }
        unset($v);
        unset($val);
        dump($data);
    }
}
