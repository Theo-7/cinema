<?php 
namespace app\index\validate;
use think\Validate;
class User extends Validate{
    protected $rule = [
        "phone|电话号码"=>"require|unique:user|regex:/^[1][3,4,5,7,8][0-9]{9}$/",
        "password|密码"=>"require|confirm"

    ];
    protected $message = [
        "phone.regex"=>"手机号码不对"
    ];
}