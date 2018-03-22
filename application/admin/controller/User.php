<?php
namespace app\admin\controller;
use think\Controller;
class User extends Common
{
    public function index()
    {
        return view();
    }
    //展示添加管理员页面
    public function showAdd(){
        return view("add");
    }
    //添加管理员
    public function add(){
        dump($_POST);
    }
    //管理员权限组
    public function role(){
        return view("role");
    }
    
    
}
