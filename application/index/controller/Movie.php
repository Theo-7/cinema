<?php
namespace app\index\controller;

use think\Controller;
use think\Db;

class Movie extends Controller
{
    //显示电影介绍页面
    public function index()
    {
        //电影介绍
        $id = input("get.id");
        $data = $this->getMovieByid($id);

        $field = "c.id,c.time,c.score,c.comment,u.name,u.phone";
        $cdata = Db::name("comment")->alias("c")->where("movieid",$id)->join("user u","c.userid=u.id","left")->field($field)->paginate(2);
        
        unset($val);
        //dump($cdata);
        //dump($data);
        $this->assign("data", $data);
        $this->assign("cdata",$cdata);
        return view();
    }
    //根据ｉｄ查询电影信息
    public function getMovieByid($id, $bo = true)
    {
        $data = Db::name("movie")->where("id", $id)->find();
        $data["cover"] = str_replace("\/", "/", implode("", json_decode($data["cover"], true)));
        $data["pictures"] = json_decode($data["pictures"], true);
        $data["type"] = json_decode($data["type"], true);

        foreach ($data["pictures"] as &$val) {
            $val = str_replace("\/", "/", $val);
        }
        unset($val);

        foreach ($data["type"] as $key => $v) {
            $data["type"][$key] = Db::name("movietype")->where("id", $v)->value("name");
        }
        //电影演职
        $data['staff'] = Db::name("staff")->where("movieid", $data['id'])->select();
        if ($bo === true) {
            //var_dump(1231354);
            foreach ($data["staff"] as $k => $vo) {
                $staff[$vo["office"]][] = $vo;
            }
            $data["staff"] = $staff;
        }

        //电影奖项
        $data["award"] = Db::name("award")->where("movieid", $data['id'])->select();
        foreach ($data["award"] as &$vv) {
            $vv["award"] = str_replace("\n", "<br>", $vv["award"]);
        }
        unset($vv);

        return $data;
    }

}
