<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;

class User extends Common
{
    public function index()
    {
        $data = Db::name("admin")->field("name,lastloginip,lastlogintime,id,roleid")->select();

        $this->assign("data",$data);
        return view();
    }
    //展示添加管理员页面
    public function showAdd()
    {
        return view("add");
    }
    //添加管理员
    public function add()
    {
        $post = input("post.");
        if (!empty($post["name"]) && mb_strlen($post['name']) <= 8) {
            if (!empty($post["password"])) {
                $result = Db::name("admin")->where("name", $post["name"])->field("id")->find();
                if (!$result) {
                    $post["password"] = password_hash($post["password"], PASSWORD_DEFAULT);
                    $post["logintime"] = time();
                    $post['loginip'] = $_SERVER['REMOTE_ADDR'];
                    $result = Db::name("admin")->insert($post);
                    if ($result) {
                        $this->success("添加成功", "/admin/user/index", 2);
                    }
                }else{
                    $this->error("名字已有");
                }

            }
        } else {
            $this->error("名字不符合");
        }
    }
    //管理员权限组
    public function role()
    {
        $data = get_class_methods("app\\admin\\controller\\User");
        dump($data);
        return view("role");
    }

}
