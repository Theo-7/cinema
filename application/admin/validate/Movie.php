<?php
namespace app\admin\validate;
use think\Validate;
class Movie extends Validate{
    protected $rule = [
        "name|电影名" => "require|max:15｜unique:movie",
        "cover|电影封面" => "require|max:150",
        "description|电影描述" => "require|max:1200",
        "area|电影地区" => "require|max:50",
        "duration|时长" => "require|max:20",
        "type|电影类型" => "require|max:12",
        "time|上映时间" => "require|max:25",
        "version|版本" => "require|max:8"
    ];
}