<?php
namespace Admin\Controller;
use Think\Controller;

header("content-type:text/html;charset=utf-8");
class ManagerController extends Controller{
    public function index(){
        if(session("manager")==null){
            redirect(U("Home/User/login"));
        }else{
            $data = $this->getBaseInfo(1);
            $this->assign("info",$data);
            $this->display();
        }
    }
    
    public function denied(){
        if(session("manager")==null){
            redirect(U("Home/User/login"));
        }else{
            $data = $this->getBaseInfo(2);
            $this->assign("info",$data);
            $this->display();
        }
    }
    
    public function passed(){
        if(session("manager")==null){
            redirect(U("Home/User/login"));
        }else{
            $data = $this->getBaseInfo(3);
            $this->assign("info",$data);
            $this->display();
        }
    }
    
    public function statistic(){
        if(session("manager")==null){
            redirect(U("Home/User/login"));
        }else{
            $contribution = M("Contribution");
            $data['unsolved'] = $contribution->where("statusid=1")->count();
            $data['fail'] = $contribution->where("statusid=2")->count();
            $data['ok'] = $contribution->where("statusid=3")->count();
            $this->assign("info",$data);
            $this->display();
        }
    }
    
    public function getBaseInfo($flag){
        if(session("manager")==null){
            redirect(U("Home/User/login"));
        }else{
            $managername = session("manager");
            $contribution = M("Contribution");
            if($flag==1){
                $data["all"] = $contribution->alias("contri")->join("__USER__ user ON contri.userid=user.id")->field("contri.id,contri.title,contri.author,contri.content,contri.postdate,user.username,contri.statusid")->where("statusid=1")->order("postdate DESC")->select();
            }else if($flag==2){
                $data["all"] = $contribution->alias("contri")->join("__USER__ user ON contri.userid=user.id")->field("contri.id,contri.title,contri.author,contri.content,contri.postdate,user.username,contri.statusid")->where("statusid=2")->order("postdate DESC")->select();
            }else if($flag==3){
                $data["all"] = $contribution->alias("contri")->join("__USER__ user ON contri.userid=user.id")->field("contri.id,contri.title,contri.author,contri.content,contri.postdate,user.username,contri.statusid")->where("statusid=3")->order("postdate DESC")->select();
            }
            $data['unsolved'] = $contribution->where("statusid=1")->count();
            $data['fail'] = $contribution->where("statusid=2")->count();
            $data['ok'] = $contribution->where("statusid=3")->count();
            $data['managername'] = $managername;
            return $data;
        }
    }
    
    public function getStatInfo(){
        if(session("manager")==null){
            redirect(U("Home/User/login"));
        }else{
            $username = I("username");
            $from = I("from");
            $to = I("to");
            $contri = M("Contribution");
            $user = M("User");
            if($username=="all"){
                $users =  $user->where("groupid=1")->order("usercode")->field("id,username")->select();
                for($i=0;$i<count($users);$i++){
                    $data[$i]["username"] = $users[$i]["username"];
                    if($from==""){
                        $to1 = $to." 23:59:59";
                        $map["postdate"] = array("elt",$to1);
                        $map1["postdate"] = array("elt",$to1);
                        $data[$i]["startdate"] = "-";
                        $data[$i]["enddate"] = $to1;
                    }else if($to==""){
                        $from1 = $from." 00:00:00";
                        $map["postdate"] = array("egt",$from1);
                        $map1["postdate"] = array("egt",$from1);
                        $data[$i]["startdate"] = $from1;
                        $data[$i]["enddate"] = "-";
                    }else{
                        $from1 = $from." 00:00:00";
                        $to1 = $to." 23:59:59";
                        $map["postdate"] = array("between",array($from1,$to1));
                        $map1["postdate"] = array("between",array($from1,$to1));
                        $data[$i]["startdate"] = $from1;
                        $data[$i]["enddate"] = $to1;
                    }
                    $map["userid"] = array("eq",$users[$i]["id"]);
                    $data[$i]["total"] = $contri->where($map)->count();
                    $map1["userid"] = array("eq",$users[$i]["id"]);
                    $map1["statusid"] = 3;
                    $data[$i]["passed"] = $contri->where($map1)->count();
                    $data[$i]["passratio"] = (round($data[$i]["passed"]/$data[$i]["total"],4)*100)."%";
                }
                $this->ajaxReturn($data);
            }else{
                $data[0]["username"] = $username;
                $condition["username"] = array("eq",$username);
                $id = $user->where($condition)->getField("id");
                if($from==""){
                    $to1 = $to." 23:59:59";
                    $map["postdate"] = array("elt",$to1);
                    $map1["postdate"] = array("elt",$to1);
                    $data[0]["startdate"] = "-";
                    $data[0]["enddate"] = $to1;
                }else if($to==""){
                    $from1 = $from." 00:00:00";
                    $map["postdate"] = array("egt",$from1);
                    $map1["postdate"] = array("egt",$from1);
                    $data[0]["startdate"] = $from1;
                    $data[0]["enddate"] = "-";
                }else{
                    $from1 = $from." 00:00:00";
                    $to1 = $to." 23:59:59";
                    $map["postdate"] = array("between",array($from1,$to1));
                    $map1["postdate"] = array("between",array($from1,$to1));
                    $data[0]["startdate"] = $from1;
                    $data[0]["enddate"] = $to1;
                }
                $map["userid"] = array("eq",$id);
                $data[0]["total"] = $contri->where($map)->count();
                $map1["userid"] = array("eq",$id);
                $map1["statusid"] = 3;
                $data[0]["passed"] = $contri->where($map1)->count();
                $data[0]["passratio"] = (round($data[0]["passed"]/$data[0]["total"],4)*100)."%";
                $this->ajaxReturn($data);
            }
        }
    }
    
    public function test(){
        $contri = M("Contribution");
        $user = M("User");
        $users =  $user->where("groupid=1")->order("usercode")->field("id,username")->select();
        
        $from = "2016-06-01";
        $to = "2016-06-11";
        for($i=0;$i<count($users);$i++){
            $data[$i]["username"] = $users[$i]["username"];
            $map["postdate"] = array("between",array($from,$to));
            $map["userid"] = array("eq",$users[$i]["id"]);
            $data[$i]["total"] = $contri->where($map)->count();
            $map1["postdate"] = array("between",array($from,$to));
            $map1["userid"] = array("eq",$users[$i]["id"]);
            $map1["statusid"] = 3;
            $data[$i]["passed"] = $contri->where($map1)->count();
            $data[$i]["passratio"] = (round($data[$i]["passed"]/$data[$i]["total"],4)*100)."%";
        }
        dump($data);
    }
    
    public function updStatus(){
        if(session("manager")==null){
            redirect(U("Home/User/login"));
        }else{
            $id = I("id");
            $status = I("status");
            $contri = M("Contribution");
            $data["id"] = $id;
            $data["statusid"] = $status;
            $contri->save($data);
            $this->ajaxReturn(1);
        }
    }    
    
    public function setpwd(){
        if(session("manager")==null){
            redirect(U("Home/User/login"));
        }else{
            $this->display();
        }
    }
    
    public function get_pwd(){
        if(session("manager")==null){
            redirect(U("Home/User/login"));
        }else{
            $old_pwd = I("old_pwd");
            $user = M("User");
            $map["username"] = array("eq", session("manager"));
            $pwd = $user->where($map)->getField("password");
            if($old_pwd == $pwd){
                $this->ajaxReturn(1);
            }else{
                $this->ajaxReturn(0);
            }
        }
    }
    
    public function upd_pwd(){
        if(session("manager")==null){
            redirect(U("Home/User/login"));
        }else{
            $new_pwd = I("new_pwd");
            $user = M("User");
            $map["username"] = array("eq", session("manager"));
            $data["password"] = $new_pwd;
            $user->where($map)->save($data);
            $this->ajaxReturn(1);
        }
    }
    
    public function logout(){
        if(session("manager")!=null){
            session("[destroy]");
            redirect(U("Home/User/login"));
        }else{
            redirect(U("Home/User/login"));
        }
    }
    
    public function _empty(){
        $this->redirect("Manager/notfound");
    }
    
    public function notfound(){
        $this->display();
    }
}
