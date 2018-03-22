<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Moviehall extends Controller
{
    public function index()
    {
        $data = Db::name("moviehall")->select();
        $this->assign("data",$data);
        return view("moviehall");
    }
    //添加新电影厅
    public function newHall(){
        $post = input("post.");
        if(!empty($post["name"])&&!empty($post['seat'])){
            $post['seat'] = explode("\r\n",$post['seat']);
            $post['seat'] = json_encode($post['seat'],JSON_UNESCAPED_UNICODE);
            $result = Db::name("moviehall")->insert($post);
            if(!empty($result)){
                $this->success("添加成功","/admin/Moviehall/index");
            }
        }
    }
    //删除电影厅
    public function delHall(){
        $id = input("post.id");
        if(!empty(intval($id))){
            $result = Db::name("moviehall")->where("id",$id)->delete();
            if($result != 0){
                return ["code"=>1,"msg"=>"success","data"=>[]];
            }
        }
    }
    //根据id获取电影厅
    public function getHall(){
        $id = input("post.id");
        $data = Db::name("moviehall")->where("id",$id)->find();
        $data["seat"] = json_decode($data["seat"],true);
        $data["seat"] = implode("\r\n",$data["seat"]);
        return ["code"=>1,"data"=>$data,"msg"=>"success"];
    }
    //修改电影厅
    public function modifyHall(){
        $post = input("post.");
        if(!empty($post["name"])&&!empty($post['seat']&&!empty($post['id']))){
            $data['name'] = $post["name"];
            $post['seat'] = explode("\r\n",$post['seat']);
            $post['seat'] = json_encode($post['seat'],JSON_UNESCAPED_UNICODE);
            $data['seat'] = $post['seat'];
            $result = Db::name("moviehall")->where("id",$post["id"])->update($data);
            if(!empty($result)){
                $this->success("更新成功","/admin/moviehall/index");
            }else{
                $this->error("更新失败");
            }
        }
    }
   
    
}
