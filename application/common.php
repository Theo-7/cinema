<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
function post($url,$data){
    $init = curl_init();
    $opt = array(
        CURLOPT_URL => $url,
        CURLOPT_POST => true,
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_HEADER => 0,
        CURLOPT_POSTFIELDS =>$data
    );
    curl_setopt_array($init,$opt);
    $ret = curl_exec($init);
    curl_close($init);
    return $ret;
}
function checkGroup(){
    $uid = session("user_id");
    $points = think\Db::name("user")->where("id",$uid)->field("points,groupid")->find();
    $group = think\Db::name("group")->where("points=(select max(points) from cinema_group where {$points['points']}>=points)")->find();
    // dump($points);
    // dump($group);
    // dump(think\Db::getLastSql());
    if($group['id']==$points['groupid']){
        return false;
    }else{
        think\Db::name("user")->where("id",$uid)->update(["groupid"=>$group["id"]]);
        return true;
    }
}