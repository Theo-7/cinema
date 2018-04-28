<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Validate;
class Index extends Common
{
    public function index()
    {
        return view();
    }
    public function indexV1(){
        return view("index_v1");
    }
    
    public function lunbo(){
        $data = Db::name("lunbo")->select();

        $this->assign("data",$data);
        return view("lunbo");
    }

    public function newLunbo(){
        $post = input("post.");
        $data['url'] = $post['url'];
        $data['role'] = $post['role'];
        
        if(empty(intval($post["id"]))){
            $result = Db::name("lunbo")->insert($data);
        }else{
            $result = Db::name("lunbo")->where("id",$post["id"])->update($data);
        }
        

        if($result){
            $this->success("添加成功","/admin/index/lunbo",2);
        }else{
            $this->error(Db::getError());
        }

    }
}
