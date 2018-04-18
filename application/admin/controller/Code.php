<?php
namespace app\admin\controller;

use think\Controller;
use think\captcha\Captcha;

class Code extends Controller
{
    public function index()
    {
        $config = [
            'length' => 4,

        ];
        $captcha = new Captcha($config);
        return $captcha->entry();
    }
   

}
