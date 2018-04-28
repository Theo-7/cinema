<?php
namespace app\admin\controller;

use think\captcha\Captcha;
use think\Controller;
use think\Db;

class Login extends Controller
{
    public function index()
    {
        return view("login");
    }

    public function login()
    {
        $post = input("post.");
        $captcha = new Captcha();
        if(!empty($post['code'])){
            if (!$captcha->check($post['code'])) {
                $this->error("验证码错误");
                exit;
            }
        }else{
            $this->error("验证码错误");
        }
        
        $result = Db::name("admin")->where("name", $post["name"])->find();

        if (!empty($result)) {
            if (password_verify($post['password'], $result['password'])) {
                $up = [
                    'logintime' => time(),
                    "lastlogintime" => $result['logintime'],
                    'loginip' => $_SERVER["REMOTE_ADDR"],
                    "lastloginip" => $result['loginip'],
                ];
                Db::name("admin")->where("id", $result['id'])->update($up);
                session("admin_id", $result["id"]);
                session("admin_name", $result["name"]);
                header("Location:/admin/index");
                exit;
            } else {
                $this->error("账号密码错误"); //密码错误
            }
        } else {
            $this->error("账号密码错误");

        }

    }
}
