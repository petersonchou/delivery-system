<?php
namespace Home\Controller;
use Think\Controller;

header("content-type:text/html;charset=utf-8");
class EmptyController extends Controller{
    public function index(){
        $this->redirect("User/notfound");
    }
    
    public function _empty(){
        $this->redirect("User/notfound");
    }
}