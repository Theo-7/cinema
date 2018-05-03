<?php
namespace  app\index\controller;
use think\Controller;
use think\Validate;
use think\Loader;
use think\Db;
class Login extends Controller{
    public function index(){
        $errorCode = " ";
        $uid = session("user_id");
        $uname = session("user_name");
        if(!empty($_GET['errorCode'])){
            $errorCode = $_GET['errorCode'];
        }
        $this->assign("errorCode",$errorCode);
        return view("login");
    }

    public function login(){
        $post = input("post.");
        $result = Db::name("user")->where("phone",$post["phone"])->find();
        
        if(!empty($result)){
            if(password_verify($post['password'],$result['password'])){
                
                if(!empty($result['name'])){
                    session("user_name",$result['name']);
                }else{
                    session("user_name",$result["phone"]);
                }
                Db::name("user")->where("id",$result['id'])->update(['logintime'=>date("Y-m-d H:i:s",time())]);
                session("user_id",$result["id"]);
                session("user_avater",$result['avater']);
                $referer = session("?referer");
                
                if($referer){
                    $referer = session("referer");
                    header("Location:{$referer}");
                    exit;
                }
                header("Location:/index/index");
                exit;
            }else{
                
                $errorCode = 1; //密码错误
            }
        }else{
            $errorCode = 0;//此电话号码未注册
            
        }
    
        header("Location:/index/login/index?errorCode={$errorCode}");//index/login/index?errorCode={$errorCode}
        exit;
    }
}