<?php
namespace app\index\controller;

use think\Controller;

class Img extends Common
{
    public function index()
    {
        $files = request()->file("_img");
        foreach ($files as $file) {
            if ($file) {
                $info = $file->rule("date")->move(ROOT_PATH . 'public' . DS . 'uploads');
                $path = DS . 'uploads' . DS . $info->getSaveName();
                echo $path;

            } else {
                echo $file->getError();
            }
        }
    }

    public function one()
    {
        $file = request()->file("file");
      
            if ($file) {
                $info = $file->rule("date")->move(ROOT_PATH . 'public' . DS . 'uploads');
                $path = DS . 'uploads' . DS . $info->getSaveName();
                //echo $path;
                return ["code"=>200,"data"=>$path];
            } else {
                echo $file->getError();
            }
        
    }
    public function show()
    {
        $file = request()->file("file");
        if ($file) {
            $info = $file->rule("date")->move(ROOT_PATH . 'public' . DS . 'uploads');
            $path = DS . 'uploads' . DS . $info->getSaveName();
            echo $path;

        } else {
            echo '{"jsonrpc" : "2.0", "error" : {"code": 102, "message": "Failed to open output stream."}, "id" : "id"}';
        }
    }
}
