<?php
namespace Admin\Controller;
use Think\Controller;

header("content-type:text/html;charset=utf-8");
class IndexController extends Controller {
    public function index(){
        echo "后台";
    }
}