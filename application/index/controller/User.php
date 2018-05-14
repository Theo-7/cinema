<?php
namespace app\index\controller;

use think\Controller;
use think\Db;
use think\Loader;

class User extends Common
{
    public function index()
    {

    }
    public function ticket()
    {
        $uid = session("user_id");
        $field = "m.name as moviename,p.start,p.end,h.name as hallname,o.seat,o.takenum,o.ordernum,o.num,o.money,u.phone,o.status";
        $data = Db::name("order")->alias("o")->where("userid", $uid)->where("isdel", 0)->join("cinema_platter p", "o.pid=p.id", "left")->join("cinema_movie m", "p.movieid=m.id")->join("cinema_moviehall h", "p.hallid=h.id")->join("cinema_user u", "u.id=o.userid")->field($field)->order("o.id desc")->select();

        foreach ($data as &$val) {
            $val['seat'] = json_decode($val['seat'], true);
            foreach ($val['seat'] as &$v) {
                $v = str_replace("_", "排", $v) . "座";

            }
        }
        unset($v);
        unset($val);

        //dump($data);

        $this->assign("data", $data);

        return view("ticket");
    }

    public function info()
    {
        $id = session("user_id");
        $data = Db::name("user")->field("name,phone,avater,gender")->where("id", $id)->find();

        $this->assign("data", $data);
        return view("info");
    }

    public function edit()
    {
        $id = session("user_id");
        $post = input("post.");
        $post = array_filter($post);
        // var_dump($post);
        // exit;
        $result = Db::name("user")->where("id", $id)->update($post);
        if($result){
            $this->success("修改成功","/index/user/info",2);
        }else{
            $this->error("修改失败");
        }
    }

    public function out()
    {
        session_destroy();
        header("Location:/index/index");
        exit;
    }
    //充值页面
    public function recharge()
    {
        $num = date('Ymd') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT) . substr(time(), 8, 2);

        $this->assign("num", $num);
        return view("recharge");
    }
    //充值支付宝同步跳转
    public function return_url()
    {
        $this->config = array(
            //应用ID,您的APPID。
            'app_id' => "2016082700324503",

            //商户私钥
            'merchant_private_key' => "MIIEowIBAAKCAQEAwU5P8LXleATk2iAbaY4ZY08tEMPNitO6UwNhNS2ZrT/LZCQi0n+SSFTAOahKyViHIcNLQfah8GlOykApjPQaTR0JFDeTGUAJR0y/2wTeJFmyDXLZI/8+NkSJaQTMPqPW4qO3Krl/P9v4UKsQUhHLVqfk5X1vCdhQWrn5ybwuGIhcK130RN9Mx8xjtYmUuQn+WL/Ytlbxg1pkV/J4oho8Mg/6Ka2mT0sJAaE4+CGQ9A73aywk1SZQf0ewaQgTQtfJr25UE/jWpOav+6jYqyT5DB3tYVAE48PJ1yLaQPj4nZNpbHy6zFzjpTpQX6Wvjj0FkJM3tdRihXbWQXFGJNxJ1wIDAQABAoIBAH60YyenQrLJmmvzMaSdlLyIcESV40tE/tNc2sGtkxaBQ0LvgLezEOJCUwE381VIpsKVrOWe0ISxsghVyCZw9jBngMT0rIGXfL10bCkWZrky5cd06Sl0K4YMpHjmwS2p3LcPkob5sZPdDkVp6zewHDU/tYRLFJZCaGEfl8AIjbpbuOxlWnIJyDGIsVqDAlGsOmR9yh5oTfSYBCSoK9qOzVGx/cLq/nb8VWnuYNIPkoj/p4ikvPgEQvmt5gu5FWIh2lD5UjnSFcuJ/xvcExjuBrEoY4pUER1HBX7LpUaOT8LF6mE77cW1i7tVxG+bJWKZRAHUuXlhPPd5RdeSHbRD9bkCgYEA/PhqT+VKGH1ugZyfO6wGpuWPJXKe6tqMDMYzq/YgHk7QbCgWmIjEjZXuhmjo2YJhFoz/3KSY9E4ffKNpDU9Zw7YahZOdO/H4kd2Z9unJdJM/e31IyOq71olOFtmmPV7tWL3qOm63s98aOljdtWZv3Xb2GWgQfSFzJ7wZPdTQatMCgYEAw574lVptMnWFD6+WAsED0WZaPWvV2E0seR3zjKs+/aZrF3qzDIxHZJzAYcI21fcG1PcO2cApXdlegaDhYxQBcDtfQ/YVueGKTIrYxTQcpD8v29PbTfZZNvyPr9l2AmyCMcAAdxI7heH4il7dQicwjPgWZbQLAIssKAp45CeJOm0CgYEAvaPUvvRa6aUOdKffTzKVAgTRnPciX1la6DClh+JJDa9z28Dpv4u4HZQqbiSzemudMPSe0t+psmvmet9d35Z+6pLXqw+QLeIlv+PqigmU9ol0a7TuHYCrNBdWrRaY4yUItSAaOZfKq1MzLE52Vojmj5WgxEcZJVUwKLeADLQ/UfUCgYBqq9BP2Qx8nHrfj9bUT54eXJrOrXPhzEt5DC0XwvXJaSsylXT3XbM8mQGLDVXLnTW7gbE2akPkajjPpQPifDFAmw+axqEYSHWawYftGTqZEd+uFruaqsABbP2JXaKtNbBVIqbeRzHwEsXt5kbu4OHnrQzBjskFFd8RQoyjlS+OjQKBgHYhsa+CUyHJgFw64gmsv3WOAIzkgdwCaf4ILhmHS3RPjLfswSEMwUH8qYSiL917sBAo7EdKejoQleWFR6MJSphRdazxrE7n71skhCbFelGKTk3a9ZAp8r1qxy8XLKoveYNoXgCNtq2cllyyQQf4s2i22wh2TO9DTVk8Wn1lOh3H",

            //异步通知地址
            'notify_url' => "http://www.cinema.org/alipay.trade.page.pay-PHP-UTF-8/notify_url.php",

            //同步跳转
            'return_url' => "http://www.cinema.org/index/alipay/return_url",

            //编码格式
            'charset' => "UTF-8",

            //签名方式
            'sign_type' => "RSA2",

            //支付宝网关
            'gatewayUrl' => "https://openapi.alipaydev.com/gateway.do",

            //支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
            'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwU5P8LXleATk2iAbaY4ZY08tEMPNitO6UwNhNS2ZrT/LZCQi0n+SSFTAOahKyViHIcNLQfah8GlOykApjPQaTR0JFDeTGUAJR0y/2wTeJFmyDXLZI/8+NkSJaQTMPqPW4qO3Krl/P9v4UKsQUhHLVqfk5X1vCdhQWrn5ybwuGIhcK130RN9Mx8xjtYmUuQn+WL/Ytlbxg1pkV/J4oho8Mg/6Ka2mT0sJAaE4+CGQ9A73aywk1SZQf0ewaQgTQtfJr25UE/jWpOav+6jYqyT5DB3tYVAE48PJ1yLaQPj4nZNpbHy6zFzjpTpQX6Wvjj0FkJM3tdRihXbWQXFGJNxJ1wIDAQAB",
        );
        Loader::import("Ali.pagepay.service.AlipayTradeService");
        $arr = $_GET;
        $alipaySevice = new \AlipayTradeService($this->config);
        $result = $alipaySevice->check($arr);
        if ($result) { //验证成功
            //商户订单号
            $out_trade_no = htmlspecialchars($_GET['out_trade_no']);
            //支付宝交易号
            $trade_no = htmlspecialchars($_GET['trade_no']);
            $money = htmlspecialchars($_GET['total_amount']);
            $id = session("user_id");

            $updata = [
                "num" => $out_trade_no,
                "alinum" => $trade_no,
                "time" => $_GET["timestamp"],
                "userid" => $id,
                "money" => $money,

            ];
            $code = 0;
            $result = Db::name("recharge")->where("num", $out_trade_no)->find();
            if (!$result) {
                Db::startTrans();
                try {
                    Db::name("recharge")->insert($updata);
                    $oldMoney = Db::name("user")->where("id", $id)->value("money");
                    $newMoney = round($oldMoney + $money, 2);
                    Db::name("user")->where("id", $id)->update(["money" => $newMoney]);
                    Db::commit();
                    $code = 1;
                    //;
                } catch (\Exception $e) {
                    Db::rollback();
                    
                    $this->error("错误");
                }
                if($code===1){
                    $this->success("充值成功","/index/user/finance",2);
                }
                
            } else {
                $code = 2;
                echo 2;
                // header("Location:/index/user/recharge?code=" . $code);
                exit;
            }

        } else {

            echo "支付失败，请<a href='/index/user/recharge'>重新充值</a><br>";
        }
    }
    public function userPay()
    {
        $num = input("post.num");
        if (!empty($num)) {
            $data = Db::name("order")->where("ordernum", $num)->find();
            $id = session("user_id");
            Db::startTrans();
            try {
                $user_money = Db::name("user")->where("id", $id)->value("money");
                if ($user_money <= $data["money"]) {
                    return ["code" => 0, "msg" => "余额不足", "data" => []];
                } else {
                   
                    $newMoney =$user_money - $data["money"];
                    Db::name("user")->where("id", $id)->update(["money" => $newMoney]);
                    $takenum = mt_rand(10000, 99999);
                    $update = [
                        "status" => 1,
                        "takenum" => $takenum,
                        "isUpay" => 1,
                    ];

                    Db::name("order")->where("ordernum", $num)->update($update);
                    
                    Db::commit();
                    return ["code" => 1, "msg" => "支付成功", "data" => []];
                }
            } catch (\Exception $e) {
                
                Db::rollback();
                
            }

        }
    }
    public function finance(){
        $id = session("user_id");

        $money = Db::name("user")->where("id",$id)->value("money");

        $data = Db::name("recharge")->field("unix_timestamp(time) as time,num,(+money) as money")->where("userid",$id)->union("select time,ordernum as num,(-money) as money from cinema_order where userid={$id} and isdel=0")->order("time desc")->select();
        //dump($data);
        $this->assign("data",$data);
        $this->assign("money",$money);
        return view("finance");
    }
}
