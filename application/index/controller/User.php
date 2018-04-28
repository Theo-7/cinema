<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
class User extends Common
{
    public function index()
    {
       
    }
    public function ticket(){
        $uid = session("user_id");
        $field = "m.name as moviename,p.start,p.end,h.name as hallname,o.seat,o.takenum,o.ordernum,o.num,o.money,u.phone,o.status";
        $data = Db::name("order")->alias("o")->where("userid",$uid)->where("isdel",0)->join("cinema_platter p","o.pid=p.id","left")->join("cinema_movie m","p.movieid=m.id")->join("cinema_moviehall h","p.hallid=h.id")->join("cinema_user u","u.id=o.userid")->field($field)->order("o.id desc")->select();
        
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
        
        //dump($data);

        $this->assign("data",$data);

        return view("ticket");
    }

    public function info(){
        $id = session("user_id");
        $data = Db::name("user")->field("name,phone,avater,gender")->where("id",$id)->find();
        
        $this->assign("data",$data);
        return view("info");
    }

    public function edit(){
        $id = session("user_id");
        $post = input("post.");
        $result = Db::name("user")->where("id",$id)->update();
    }

    public function out(){
       session_destroy();
        header("Location:/index/index");
        exit;
    }
}
