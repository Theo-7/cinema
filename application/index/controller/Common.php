<?php
namespace app\index\controller;

use think\Controller;

class Common extends Controller
{
    public function _initialize()
    {
        $user_name = session("user_name");
        $user_id = session("user_id");
        if (empty($user_name) || empty($user_id)) {
            session("referer", $_SERVER["HTTP_REFERER"]);
            $this->jsback("/index/login/index","请先登录");
        }
        // $check = checkGroup();
        // dump($check);
    }

    public function jsback($url="", $msg="错误")
    {
        if(empty($url)){

            echo "<script>
            alert('{$msg}');
            window.history.go(-1);
            </script>";
            die();
        }
        echo "<script>
                alert('{$msg}');
                window.location.href='{$url}';
                </script>";
        die();
    }
}
