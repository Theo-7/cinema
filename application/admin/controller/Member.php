<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;

class Member extends Common
{
    public function index()
    {
        $data = Db::name("user")->field("name,phone,avater,id,money,registertime")->select();

        $this->assign("data",$data);
        return view("member");
    }

    public function group(){
        
        return view("group");
    }
    

}
