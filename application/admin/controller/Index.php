<?php
namespace app\admin\controller;
use think\Controller;
class Index extends Common
{
    public function index()
    {
        return view();
    }
    public function indexV1(){
        return view("index_v1");
    }
    
}
