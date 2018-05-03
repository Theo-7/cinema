<?php
namespace app\index\controller;

use think\Loader;
use think\Db;

class Alipay extends Common
{
    public function _initialize()
    {
        parent::_initialize();
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
    }
    public function pay()
    {

        
        //商户订单号，商户网站订单系统中唯一订单号，必填
        $out_trade_no = trim($_POST['WIDout_trade_no']);

        //订单名称，必填
        $subject = trim($_POST['WIDsubject']);

        //付款金额，必填
        $total_amount = trim($_POST['WIDtotal_amount']);

        //商品描述，可空
        $body = trim($_POST['WIDbody']);
        //改变同步跳转地址
        if(trim($_POST['recharge'])==="recharge"){
            $this->config['return_url'] = "http://www.cinema.org/index/user/return_url";
        }
        Loader::import("Ali.pagepay.buildermodel.AlipayTradePagePayContentBuilder");
        Loader::import("Ali.pagepay.service.AlipayTradeService");

        //构造参数
        $payRequestBuilder = new \AlipayTradePagePayContentBuilder();
        $payRequestBuilder->setBody($body);
        $payRequestBuilder->setSubject($subject);
        $payRequestBuilder->setTotalAmount($total_amount);
        $payRequestBuilder->setOutTradeNo($out_trade_no);

        $aop = new \AlipayTradeService($this->config);

        /**
         * pagePay 电脑网站支付请求
         * @param $builder 业务参数，使用buildmodel中的对象生成。
         * @param $return_url 同步跳转地址，公网可以访问
         * @param $notify_url 异步通知地址，公网可以访问
         * @return $response 支付宝返回的信息
         */
        $response = $aop->pagePay($payRequestBuilder, $this->config['return_url'], $this->config['notify_url']);

        //输出表单
        var_dump($response);
    }
    //同步返回
    public function return_url()
    {
        Loader::import("Ali.pagepay.service.AlipayTradeService");
        $arr = $_GET;
        $alipaySevice = new \AlipayTradeService($this->config);
        $result = $alipaySevice->check($arr);
        if ($result) { //验证成功
            //商户订单号
            $out_trade_no = htmlspecialchars($_GET['out_trade_no']);
            //支付宝交易号
            $trade_no = htmlspecialchars($_GET['trade_no']);
            $takenum = mt_rand(10000,99999);
            $updata = [
                        "status"=>1,
                        "alinum"=>$trade_no,
                        "takenum"=>$takenum,
                        "paytime"=>$_GET["timestamp"],
                        "isdel"=>0
                    ];
            Db::name("order")->where("ordernum",$out_trade_no)->update($updata);
            $this->success("支付成功","/index/user/ticket",2);

        } else {

            echo "支付失败，请<a href='/index/order/index'>重新支付</a><br>";
        }

    }
}
