<?php
namespace app\index\controller;
use think\Controller;
use think\Validate;
use think\Loader;
use think\Db;
class Register extends Controller{
    public function index(){
        $error = " ";
        if(!empty($_GET["error"])){
           $error = $_GET['error'];
        }
        $this->assign("error",$error);
        return view("register");
    }

    //注册
    public function register(){
        $post = input("post.");
        $validate = Loader::validate("User");
        
        //判断手机验证码
        if($post["telcode"]!=session("tellcode")&&$post['phone']!=session("tel")){
            $error = "手机验证码错误";
            header("Location:/index/register/index?error={$error}");
            exit;
        }
        //判断用户信息
        if($validate->check($post)){
            $data["phone"] = $post["phone"];
            $data["password"] = password_hash($post["password"],PASSWORD_DEFAULT);
            $data["registertime"] = date("Y-m-d H:i:s",time());
            $data["logintime"] = date("Y-m-d H:i:s",time());
            $result = Db::name("user")->insert($data);
            if($result){
                header("Location:/index/Login/index");
                exit;
            }
        //失败    
        }else{
            $error = $validate->getError();
            header("Location:/index/register/index?error={$error}");
            exit;
        }


        
    }
    //电话验证码
    public function phoneVerify(){
        $url = "http://sms.quweiziyuan.cn/sms.php";
        $random = mt_rand(100000,999999);
        $tel = input("get.phone");
        if(preg_match("/^[1][3,4,5,7,8][0-9]{9}$/",$tel)){
            $data = [
                'key' => "wein07699",
                'tell' => "{$tel}",
                "code"=> "{$random}",
            ];
            session("tellcode",$random);
            session("tel",$tel);
            $ret = post($url,$data);
            echo $ret;
        }else{
            echo "错误的电话号码";
        }
       
    }
}