<?php
namespace Home\Controller;
use Think\Controller;

header("content-type:text/html;charset=utf-8");
class IndexController extends Controller {
    public function index(){
        echo "前台";
    }
}