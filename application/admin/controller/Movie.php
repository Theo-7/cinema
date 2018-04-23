<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\view;

class Movie extends Common
{
    //显示电影列表
    public function index()
    {
        $data = Db::name("movie")->select();
        foreach ($data as $key => &$val) {
            $val['cover'] = json_decode($val['cover'], true);
            $val["cover"] = str_replace("\/", "/", $val['cover'][0]);
            $tidArr = json_decode($val['type'], true);
            $val["type"] = [];
            foreach ($tidArr as $t) {
                $val['type'][] = Db::name("movietype")->where("id", $t)->value("name");
            }
            $val["type"] = implode(",", $val["type"]);
        }
        unset($val);
        $this->assign("data", $data);
        return view();
    }
    //显示添加电影界面
    public function showAdd()
    {
        $typeData = Db::name("movietype")->select();
        $this->assign("typeData", $typeData);
        return view("add");
    }
    //添加电影数据进数据库
    public function addmovie()
    {
        $allData = input("post.");
        $movieData = [];
        $staffData = [];
        $award = [];
        //分开数据
        foreach ($allData as $key => $val) {
            switch ($key) {
                case "name":$movieData[$key] = $val;
                    break;
                case "cover":$movieData[$key] = json_encode($val);
                    break;
                case "duration":$movieData[$key] = $val;
                    break;
                case "area":$movieData[$key] = $val;
                    break;
                case "description":$movieData[$key] = $val;
                    break;
                case "time":$movieData[$key] = $val;
                    break;
                case "type":$movieData[$key] = json_encode($val, JSON_UNESCAPED_UNICODE);
                    break;
                case "version":$movieData[$key] = $val;
                    break;
                case "pictures":$movieData[$key] = json_encode($val, JSON_UNESCAPED_UNICODE);
                    break;
                case "staffName":$staffData[$key] = $val;
                    break;
                case "staffCover":$staffData[$key] = $val;
                    break;
                case "Office":$staffData[$key] = $val;
                    break;
                case "mcharacter":$staffData[$key] = $val;
                    break;
                case "awardCover":$award[$key] = $val;
                    break;
                case "awardName":$award[$key] = $val;
                    break;
                case "award":$award[$key] = $val;
                    break;
            }
        }
        $movie = model("movie");
        $Validate = validate("movie");
        //检测数据
        $checkResult = $Validate->check($movieData);
        // dump($staffData);
        // exit;
        if (false === $checkResult) {
            $this->error($Validate->getError());
        } else {
            //添加电影基本信息
            $movieData["addtime"] = time();
            $result = $movie->data($movieData)->validate("movie")->save();
            if (false === $result) {
                dump($movie->getError());
            } else {
                foreach ($staffData["staffName"] as $key => $val) {
                    if (!empty($val)) {
                        $data = [
                            "staffName" => $val,
                            "staffCover" => $staffData["staffCover"][$key],
                            "office" => $staffData["Office"][$key],
                            "mcharacter" => $staffData["mcharacter"][$key],
                            "movieid" => $movie->id,
                        ];
                        Db::name("staff")->insertGetId($data);
                    }
                }
                if (!empty($award["award"][0])) {
                    foreach ($award["award"] as $key => $val) {
                        if (!empty($val)) {
                            $data2 = [
                                "awardName" => $award["awardName"][$key],
                                "awardCover" => $award["awardCover"][$key],
                                "award" => $val,
                                "movieid" => $movie->id,
                            ];
                            Db::name("award")->insertGetId($data2);
                        }
                    }
                }
                $this->success("添加成功", "/admin/movie/index");

            }
        }

    }
    //显示修改电影页面
    public function showEdit()
    {
        $id = input("get.id");
        if (!empty(intval($id))) {
            $movie = new \app\index\controller\Movie();
            $data = $movie->getMovieByid($id, false);
            //dump($data);

            $typeData = Db::name("movietype")->select();

            $this->assign("typeData", $typeData);
            $this->assign("data", $data);
            return view("edit");

        }

    }
    //修改数据库
    public function edit()
    {
        $allData = input("post.");
        $movieData = [];
        $staffData = [];
        $award = [];
        //分开数据
        foreach ($allData as $key => $val) {
            switch ($key) {
                case "name":$movieData[$key] = $val;
                    break;
                case "movieid":$movieData[$key] = $val;
                    break;
                case "cover":$movieData[$key] = json_encode($val);
                    break;
                case "duration":$movieData[$key] = $val;
                    break;
                case "area":$movieData[$key] = $val;
                    break;
                case "description":$movieData[$key] = $val;
                    break;
                case "time":$movieData[$key] = $val;
                    break;
                case "type":$movieData[$key] = json_encode($val, JSON_UNESCAPED_UNICODE);
                    break;
                case "version":$movieData[$key] = $val;
                    break;
                case "pictures":$movieData[$key] = json_encode($val, JSON_UNESCAPED_UNICODE);
                    break;
                case "staffid":$staffData[$key] = $val;
                    break;
                case "staffName":$staffData[$key] = $val;
                    break;
                case "staffCover":$staffData[$key] = $val;
                    break;
                case "Office":$staffData[$key] = $val;
                    break;
                case "mcharacter":$staffData[$key] = $val;
                    break;
                case "awardCover":$award[$key] = $val;
                    break;
                case "awardName":$award[$key] = $val;
                    break;
                case "award":$award[$key] = $val;
                    break;
                case "awardid":$award[$key] = $val;
                    break;
            }
        }
        $movie = model("movie");
        $Validate = validate("movie");
        //检测数据
        $checkResult = $Validate->check($movieData);
        // dump($staffData);
        // exit;
        if (false === $checkResult) {
            $this->error($Validate->getError());
        } else {
            //添加电影基本信息
            $movieData["addtime"] = time();
            $result = $movie->data($movieData)->validate("movie")->where("id",$movieData["movieid"])->update();
            if (false === $result) {
                dump($movie->getError());
            } else {
                foreach ($staffData["staffName"] as $key => $val) {
                    if (!empty($val)) {
                        $data = [
                            "staffName" => $val,
                            "staffCover" => $staffData["staffCover"][$key],
                            "office" => $staffData["Office"][$key],
                            "mcharacter" => $staffData["mcharacter"][$key],
                            "movieid" => $movieData["movieid"],
                        ];
                        if(empty($staffData["staffid"][$key])){
                            Db::name("staff")->insert($data);
                        }else{
                            Db::name("staff")->where("id",$staffData["staffid"][$key])->update($data);
                        }
                    }
                }
                if (!empty($award["award"][0])) {
                    foreach ($award["award"] as $key => $val) {
                        if (!empty($val)) {
                            $data2 = [
                                "awardName" => $award["awardName"][$key],
                                "awardCover" => $award["awardCover"][$key],
                                "award" => $val,
                                "movieid" => $movieData["movieid"],
                            ];
                            if(empty($award["awardid"][$key])){
                                Db::name("award")->insert($data2);
                            }else{
                                Db::name("award")->where("id",$award["awardid"][$key])->update($data2);
                            }
                        }
                    }
                }
                $this->success("修改成功", "/admin/movie/index");

            }
        }

    }

    //上下映电影
    public function isshow()
    {
        $id = input("post.id");
        if (!empty(intval($id))) {
            $isshow = Db::name("movie")->where("id", $id)->value("isshow");
            if ($isshow) {
                $result = Db::name("movie")->where("id", $id)->update(['isshow' => 0]);
                if ($result) {
                    return ["code" => 1, "msg" => "success", "data" => ["isshow" => 0]];
                }
            } else {
                $result = Db::name("movie")->where("id", $id)->update(['isshow' => 1]);
                if ($result) {
                    return ["code" => 1, "msg" => "success", "data" => ["isshow" => 0]];
                }
            }

        }
    }
    //type_list
    public function type()
    {
        $data = Db::name("movietype")->select();
        $view = new View();
        $view->data = $data;
        return $view->fetch("type");
    }
    //type修改
    public function changeType()
    {
        $value = input("post.value");
        $id = input("post.row_id");
        if (!empty($value) && !empty($id)) {
            $row = Db::name("movietype")->where("id", $id)->update(['name' => $value]);
            if ($row) {
                echo $value;
            }
        }

    }
    //type删除
    public function delType()
    {
        $id = input("get.id");
        if (!empty($id)) {
            $row = Db::name("movietype")->where("id", $id)->delete();
            if ($row) {
                return ["code"=>1,"data"=>[], "msg"=>"success"];
            }

        }
    }
    //type新增
    public function newType()
    {
        $name = input("post.name");
        if (!empty($name)) {
            $data = array("name" => $name);
            $id = Db::name('movietype')->insertGetId($data);
            $res = Db::name("movietype")->where("id", $id)->find();
            return ["code" => 1, "data" => $res, "msg" => "success"];
        }
    }
}
