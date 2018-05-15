<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;

class Member extends Common
{
    public function index()
    {
        $data = Db::name("user")->alias("u")->join("group g","u.groupid=g.id")->field("u.name as name,u.phone as phone,u.avater as avater,u.id as id,u.money as money,u.registertime as registertime,g.name as groupname,u.points as points")->select();

        $this->assign("data",$data);
        return view("member");
    }

    public function group(){

        $data = Db::name("group")->select();

        $this->assign("data",$data);
        return view("group");
    }

    //新增用户组
    public function newGroup(){
        $post = input("post.");
        $post = array_filter($post);
        if(isset($post['name'])){
            $result = Db::name("group")->where("name",$post['name'])->field("id")->find();
            
            if(empty($result)){
                $result = Db::name("group")->insert($post);
                if($result){
                    $this->success("添加成功","/admin/member/group",2);
                }else{
                    $error = Db::getError();
                    $this->error("错误信息:".$error);
                }

            }else{
                $this->error("已存在用户组");
                            }
        }
       
    }

    public function editGroup(){
        $post = input("post.");
        $post = array_filter($post);
        if(isset($post['name'])){
            $result = Db::name("group")->where("name",$post['name'])->where("id<>{$post['id']}")->field("id")->find();
            
            if(empty($result)){
                $result = Db::name("group")->where("id",$post["id"])->update($post);
                if($result){
                    $this->success("修改成功","/admin/member/group",2);
                }else{
                    $error = Db::getError();
                    $this->error("错误信息:".$error);
                }

            }else{
                $this->error("已存在用户组");
                            }
        }
    }

    public function getGroup(){
        $id = input("post.id");
        if(!empty($id)){
            $data = Db::name("group")->where("id",$id)->find();
            return ["code"=>1,"msg"=>"success","data"=>$data];
        }
    }

    public function delGroup(){
        $id = input("post.id");
        if(!empty($id)){
            $data = Db::name("group")->where("id",$id)->delete();
            if($data){
                Db::name("user")->where("groupid",$id)->update("group",0);

            }
            return ["code"=>1,"msg"=>"success","data"=>$data];
        }
    }
    

}
