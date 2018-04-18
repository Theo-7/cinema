<?php
namespace app\admin\controller;
use think\Controller;
class Common extends Controller 
{
    public function _initialize(){
        $admin_name = session("admin_name");
        $admin_id = session("admin_id");
        if(empty($admin_name)||empty($admin_id)){
           $this->error("请登录","/admin/login/index");
        }
    }
}