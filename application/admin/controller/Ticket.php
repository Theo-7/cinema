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

    public function printTic()
    {
        $post = input("post.num");
        $post = intval($post);

        $field = "m.name as moviename,p.start,p.price,p.end,h.name as hallname,o.seat,o.takenum,o.ordernum,o.num,o.money,u.phone,o.status";
        $data = Db::name("order")->alias("o")->where("takenum", $post)->where("isdel", 0)->join("cinema_platter p", "o.pid=p.id", "left")->join("cinema_movie m", "p.movieid=m.id")->join("cinema_moviehall h", "p.hallid=h.id")->join("cinema_user u", "u.id=o.userid")->field($field)->order("o.id desc")->find();

        $data['seat'] = json_decode($data['seat'], true);
        foreach ($data['seat'] as &$v) {
            $v = str_replace("_", "排", $v) . "座";

        }
        $data["start"] = strtotime($data['start']);

        unset($v);
        //dump($data);

        $this->assign("data", $data);
        return view("print");
    }
}
