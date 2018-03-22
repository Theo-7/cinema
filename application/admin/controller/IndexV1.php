<?php
namespace app\admin\controller;
use think\Controller;
class IndexV1 extends Common
{
    public function index()
    {
        return view("IndexV1");
    }
}
