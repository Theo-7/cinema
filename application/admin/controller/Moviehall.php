<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Moviehall extends Common
{
    public function index()
    {
        $data = Db::name("moviehall")->select();
        foreach($data as &$val){
            $val["seat"] = json_decode($val["seat"],true);
            $val['seat'] = implode("<br/>",$val["seat"]);
        }
        $this->assign("data",$data);
        return view("moviehall");
    }
    //添加新电影厅
    public function newHall(){
        $post = input("post.");
        if(!empty($post["name"])&&!empty($post['seat'])){
            $post['seat'] = explode("\r\n",$post['seat']);
            $post['seat'] = json_encode($post['seat'],JSON_UNESCAPED_UNICODE);
            $result = Db::name("moviehall")->insert($post);
            if(!empty($result)){
                $this->success("添加成功","/admin/Moviehall/index");
            }
        }
    }
    //删除电影厅
    public function delHall(){
        $id = input("post.id");
        if(!empty(intval($id))){
            $result = Db::name("moviehall")->where("id",$id)->delete();
            if($result != 0){
                return ["code"=>1,"msg"=>"success","data"=>[]];
            }
        }
    }
    //ajax根据id获取电影厅
    public function getHall(){
        $id = input("post.id");
        $data = Db::name("moviehall")->where("id",$id)->find();
        $data["seat"] = json_decode($data["seat"],true);
        $data["seat"] = implode("\r\n",$data["seat"]);
        return ["code"=>1,"data"=>$data,"msg"=>"success"];
    }
    //修改电影厅
    public function modifyHall(){
        $post = input("post.");
        if(!empty($post["name"])&&!empty($post['seat']&&!empty($post['id']))){
            $data['name'] = $post["name"];
            $post['seat'] = explode("\r\n",$post['seat']);
            $post['seat'] = json_encode($post['seat'],JSON_UNESCAPED_UNICODE);
            $data['seat'] = $post['seat'];
            $result = Db::name("moviehall")->where("id",$post["id"])->update($data);
            if(!empty($result)){
                $this->success("更新成功","/admin/moviehall/index");
            }else{
                $this->error("更新失败");
            }
        }
    }
    //显示排片页面
    public function platter(){
        $id = input("get.id");
        $id = intval($id);
        $hallRow = Db::name("moviehall")->where("id",$id)->find();
        if($hallRow){
            $movieRows = Db::name("movie")->where("datediff(time,now())<=7")->column("id,name,time,duration");
            $data = Db::name("platter")->alias("p")->join("cinema_movie m","p.movieid=m.id")->join("cinema_moviehall h","p.hallid=h.id")->field("h.name as hallname,m.name as moviename,p.movieid,p.hallid,p.start,p.end,p.id,p.price")->where("p.hallid={$id}")->order("id desc")->select();
            $this->assign("movieRows",$movieRows);
            $this->assign("id",$id);
            $this->assign("hall",$hallRow);
            $this->assign("data",$data);
            return view("platter");
        }else{
            $this->error("无此电影厅");
        }
       
    }
    //添加排片
    public function newPlatter(){
        $post = input("post.");
        // dump($post);
        // exit;
        $result1 = Db::name("platter")->where("id",$post["hallid"])->where("'{$post['start']}'>=start")->where("'{$post['start']}'<=end")->find();
        $result2 = Db::name("platter")->where("id",$post["hallid"])->where("'{$post['end']}'>=start")->where("'{$post['end']}'<=end")->find();

        if($result1||$result2){
            $this->error("失败:时间冲突");
        }else{
                    $result = Db::name("platter")->insert($post);

        }
        if($result){
            $this->success("添加成功");
        }else{
            $this->error("失败:".Db::name("platter")->getError());
        }
    }
    //显示修改排片的页面
    public function showEditPlatter(){
        $id = input("get.id");
        $id = intval($id);
        if($id){
           
            $data = Db::name("platter")->where("id",$id)->find();
           
            if(strtotime($data["start"])<=time()){
                $this->error("此排片以播放");
                exit;
            }
            $hall = Db::name("moviehall")->where("id",$data['hallid'])->find();
            $movieRows = Db::name("movie")->where("datediff(time,now())<=7")->column("id,name,time,duration");

            $this->assign("movieRows",$movieRows);
            $this->assign("hall",$hall);
            $this->assign("data",$data);
        }else{
            $this->error("非法请求","",2);
        }
        return view("edit_platter");
    }
    //修改排片
    public function editPlatter(){
        $post = input("post.");
        $result1 = Db::name("platter")->where("id",$post["hallid"])->where("'{$post['start']}'>=start")->where("'{$post['start']}'<=end")->find();
        $result2 = Db::name("platter")->where("id",$post["hallid"])->where("'{$post['end']}'>=start")->where("'{$post['end']}'<=end")->find();

        if($result1||$result2){
            $this->error("失败:时间冲突");
        }else{
                    $data['movieid'] = $post['movieid'];
                    $data['price'] = $post["price"];
                    $data["start"] = $post["start"];
                    $data["end"] = $post["end"];
                    $result = Db::name("platter")->where("id",$post['pid'])->update($data);

        }
        if($result){
            $this->success("修改成功","/admin/moviehall/platter",2);
        }else{
            $this->error("失败:".Db::name("platter")->getError());
        }
    }
    //删除排片
    public function delPlatter(){
        $id = input("post.id");
        $id = intval($id);
        if($id){
            $result = Db::name("platter")->where("id",$id)->delete();
            if($result){
                return ["code"=>1,"msg"=>"success","data"=>[]];
            }
        }
    }
    //ajax判断排片是否冲突
    public function checkTime(){
        $post = input("post.");
        $result1 = Db::name("platter")->where("hallid",$post["hallid"])->where("'{$post['date']}'>=start")->where("'{$post['date']}'<=end")->find();
        //dump(Db::getLastSql());
        //dump($post);
        $endtime = strtotime($post["date"])+$post['duration']*60;
        $enddate = date("Y-m-d H:i:s",$endtime);
        $result2 = Db::name("platter")->where("hallid",$post["hallid"])->where("'{$enddate}'>=start")->where("'{$enddate}'<=end")->find();
        if($result1){
            return [
                    "code"=>0,
                    "msg"=>"开始时间有冲突",
                    "data"=>["time"=>$result1['end']]
                    ];
        }else{
            if($result2){
                return [
                    "code"=>2,
                    "msg"=>"介绍时间有冲突",
                    "data"=>["time"=>$result2['end']]
                    ];
            }else{
                return [
                    "code"=>1,
                    "msg"=>"时间无冲突",
                    "data"=>["enddate"=>$enddate]
                    ];
            }
            
        }
    }
   
    
}
