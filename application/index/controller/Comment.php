<?php
namespace app\index\controller;

use think\Controller;
use think\Db;
use think\Validate;

class Comment extends Common
{
    public function index()
    {
        $uid = session("user_id");
        $num = input("get.id");
        $odata = Db::name("order")->alias("o")->where("ordernum", $num)->join("cinema_platter p", "p.id=o.pid", "left")->field("o.*,p.movieid")->find();        if (!$odata) {
            die("ERROR!");
        }
        $result = Db::name("comment")->where(array("userid"=>$uid,"movieid"=>$odata['movieid']))->find();
        if($result){
            $this->jsback("","你已经评论过了");
            exit();
        }
        $mObj = new Movie();
        $data = $mObj->getMovieByid($odata['movieid']);

        $this->assign("data", $data);
        return view("index");
    }

    public function ajaxAdd()
    {
        $post = input("post.");
        $rule = [
            'movieid'=>"require",
            "star" => "require",
            "comment" =>"require"
        ];
        $msg = [
            "movieid.require"=>"错误",
            "star.require"=>"请评分",
            "comment.require"=>"请填写评论"
        ];
        $validate = new Validate($rule,$msg);
        $result = $validate->check($post);
        if($result){
            $post["score"] = $post["star"];
            unset($post['star']);
            $post['userid'] = session("user_id");
            $post['time'] = time();
            $re = Db::name("comment")->insert($post);
            if($re){
                return ["code"=>1,"msg"=>"success","data"=>[]];
            }
        }else{
            return ["code"=>0,"msg"=>$validate->getError(),"data"=>[]];
        }
    }
}
