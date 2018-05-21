<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;

class Statistic extends Common
{
    public function index()
    {
        $data = Db::name("order")->group("date_format(paytime,'%Y%m%d')")->where("isdel", 0)->field("SUM(money) as money,date_format(paytime,'%Y%m%d') as day")->select();

        $date = [];
        $money = [];
        foreach ($data as $key => $val) {
            $date[] = $val["day"];
            $money[] = $val["money"];
        }
        $this->assign("date", $date);
        $this->assign("money", $money);
        return view("statistic");
    }

    public function ticket()
    {
        $data = Db::name("movie")->field("name,id as mid,time")->where("isshow", 1)->select();
        foreach ($data as $key => &$val) {
            $sum = Db::name("order")->alias("o")->where("movieid", $val['mid'])->where("isdel",0)->join("cinema_platter p", "p.id=o.pid")->field("sum(money) as sum,p.movieid")->group("movieid")->select();
            if (!empty($sum)) {
                $val['sum'] = $sum[0]['sum'];
            } else {
                $val['sum'] = 0;
            }

            $movie_p = Db::name("platter")->where("movieid", $val['mid'])->field("count(id) as pnum")->group("movieid")->find();
            if (!empty($movie_p)) {
                $val["pnum"] = $movie_p['pnum'];
            } else {
                $val["pnum"] = 0;
            }
            $all_p = Db::name("platter")->where("movieid", $val['mid'])->select();
            $all_p = count($all_p);
            $percent = $movie_p["pnum"] / $all_p;
            $val['pencent'] = round($percent, 4) * 100;

            $seat = Db::name("order")->alias("o")->where("movieid", $val['mid'])->where("isdel",0)->join("cinema_platter p", "p.id=o.pid")->field("seat")->select();
            $sdata = [];
            if (!empty($seat)) {
                foreach ($seat as $k => $v) {
                    $sdata = array_merge($sdata, json_decode($v["seat"], true));
                }
                $people= count($sdata);
               
            }else{
                $people = 0;
            }
            //dump($people);
            // dump($people);
            // dump($all_p);
            $val['pp'] = round($people/$all_p);
            

        }
        unset($val);
        //dump($data);
        $this->assign("data",$data);
        return view("ticket");
    }

}
