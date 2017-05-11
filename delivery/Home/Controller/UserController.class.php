<?php
namespace Home\Controller;
use Think\Controller;
use Think\Verify;

header("content-type:text/html;charset=utf-8");
class UserController extends Controller{
    public function index(){
        if(session("username")==null){
            $this->redirect("Home/User/login");
        }else{
            $data = $this->getBaseInfo(4);
            $this->assign("info",$data);
            $this->display();
        }
    }
    
    public function stat(){
        if(session("username")==null){
            $this->redirect("Home/User/login");
        }else{
            if(substr(date("m"), 0, 1)=='0'){
                $month_show = substr(date("m"), 1);
            }else{
                $month_show = date("m");
            }
            $year = date("Y");
            $data = $this->getBaseInfo(4);
            $data['year'] = $year;
            $data['month'] = $month_show;
            $this->assign("info",$data);
            $this->display();            
        }
    }
    
    public function wait(){
        if(session("username")==null){
            $this->redirect("Home/User/login");
        }else{
            $data = $this->getBaseInfo(1);
            $this->assign("info",$data);
            $this->display();
        }
    }
    
    public function passed(){
        if(session("username")==null){
            $this->redirect("Home/User/login");
        }else{
            $data = $this->getBaseInfo(3);
            $this->assign("info",$data);
            $this->display();
        }
    }
    
    public function denied(){
        if(session("username")==null){
            $this->redirect("Home/User/login");
        }else{
            $data = $this->getBaseInfo(2);
            $this->assign("info",$data);
            $this->display();
        }
    }    
    
    public function getBaseInfo($flag){
        if(session("username")==null){
            $this->redirect("Home/User/login");
        }else{
            $username = session("username");
            $user = M("User");
            $map['username'] = array("eq",$username);
            $uid = $user->where($map)->getField("id");
            $contribution = M("Contribution");
            $data['total'] = $contribution->where("userid=$uid")->count();
            if($flag==4){
                $data["all"] = $contribution->where("userid=$uid")->order("postdate DESC")->select();
            }else if($flag==1){
                $data["all"] = $contribution->where("userid=$uid and statusid=1")->order("postdate DESC")->select();
            }else if($flag==2){
                $data["all"] = $contribution->where("userid=$uid and statusid=2")->order("postdate DESC")->select();
            }else if($flag==3){
                $data["all"] = $contribution->where("userid=$uid and statusid=3")->order("postdate DESC")->select();
            }
            //$data["all"] = $contribution->where("userid=$uid")->order("postdate DESC")->select();
            $data['unsolved'] = $contribution->where("userid=$uid and statusid=1")->count();
            $data['fail'] = $contribution->where("userid=$uid and statusid=2")->count();
            $data['ok'] = $contribution->where("userid=$uid and statusid=3")->count();
            $data['username'] = $username;
            $data['userid'] = $uid;
            return $data;
        }   
    }
    
    public function getStat(){
        if(session("username")==null){
            $this->redirect("Home/User/login");
        }else{
            $from = I("from");
            $to = I("to");
            $start = $from." 00:00:00";
            $end = $to." 23:59:59";
            $user = M("User");
            $condition["username"] = array("eq",session("username"));
            $uid = $user->where($condition)->getField("id");
            if($from==""){
                $map["postdate"] = array("elt",$end);
            }else if($to==""){
                $map["postdate"] = array("egt",$start);
            }else{
                $map["postdate"] = array("between", array($start,$end));
            }
            $contri = M("Contribution");
            $map["userid"] = array("eq",$uid);
            $data["total"] = $contri->where($map)->count();
            $map["statusid"] = array("eq",1);
            $data["wait"] = $contri->where($map)->count();
            $map["statusid"] = array("eq",3);
            $data["passed"] = $contri->where($map)->count();
            $map["statusid"] = array("eq",2);
            $data["denied"] = $contri->where($map)->count();
            $this->ajaxReturn($data);
        }
    }
    
    public function updateContri(){
        if(session("username")==null){
            $this->redirect("Home/User/login");
        }else{
            if(!empty($_POST)){
                $receive = I("post.");
                $contri = M("Contribution");
                $data["id"] = $receive["edit_id"];
                $data["title"] = $receive["edit_title"];
                $data["author"] = $receive["edit_author"];
                $data["content"] = $_POST["edit_content"];
                $contri->save($data);
                $this->ajaxReturn(1);
            }else{
                $this->redirect("Home/User/login");
            }
        }        
    }
    
    public function deleteContri(){
        if(session("username")==null){
            $this->redirect("Home/User/login");
        }else{
            if(!empty($_POST)){
                $id = I("rowid");
                $contri = M("Contribution");
                $contri->delete($id);
                $this->ajaxReturn(1);
            }else{
                $this->redirect("Home/User/login");
            }            
        }
    }
    
    public function addcontri(){
        if(session("username")==null){
            $this->redirect("Home/User/login");
        }else{
            if(!empty($_POST)){
                $user = M("User");
                $data["title"] = I("add_title");
                $data["author"] = I("add_author");
                $data["content"] = $_POST["add_content"];
                $data["postdate"] = date("Y-m-d H:i:s");
                $map["username"] = array("eq",session("username"));
                $data["userid"] = $user->where($map)->getField("id");
                $data["statusid"] = 1;
                $contri = M("Contribution");
                $contri->add($data);
                $this->ajaxReturn(1);
            }else{
                //跳转到404，并销毁session
            }
        }
    }
    
    public function login(){
        if($this->getBrowser()=="ie"){
            $this->redirect("User/warning");
        }
        if(session("username")!=null){
            $this->redirect("User/index");
        }else if(session("manager")!=null){
            $this->redirect("Admin/Manager/index");
        }else{
            $verify=new Verify();
            if(!empty($_POST)){
                $username = I("name");
                $password = I("pwd");
                $checkcode = I("checkcode");
                if(!$verify->check($checkcode)){
                    $data="check_error";
                    $this->ajaxReturn($data);
                }else{
                    $user = new \Model\UserModel();
                    $result=$user->checkNamePwd($username, $password);
                    if(!$result){
                        $data="info_error";
                        $this->ajaxReturn($data);
                    }else{
                        if($result['password']==$password){
                            if($result['groupid']==1){
                                session("username",$result['username']);
                                $data = "1";
                            }else if($result['groupid']==2){
                                session("manager",$result['username']);
                                $data = "2";
                            }
                            $info["loginip"] = get_client_ip();
                            $info["lastvisited"] = date("Y-m-d H:i:s");
                            $map["username"] = array("eq", $result["username"]);
                            $user->where($map)->save($info);
                            $this->ajaxReturn($data);
                        }else{
                            $data="info_error";
                            $this->ajaxReturn($data);
                        }
                    }
                }
            }else{
                $checkcode_url = __CONTROLLER__."/verifyImg";
                $selfUrl = __SELF__;
                $redirectUrl = __APP__;
                $this->assign("redirectUrl",$redirectUrl);
                $this->assign("ckcode",$checkcode_url);
                $this->assign("selfUrl",$selfUrl);
                $this->display();
            }  
        }       
    }
    
    public function index_setpwd(){
        if(session("username")==null){
            $this->redirect("User/login");
        }else{
            $this->display();
        }
    }
    
    public function get_pwd(){
        if(session("username")==null){
            $this->redirect("User/login");
        }else{
            $old_pwd = I("old_pwd");
            $user = M("User");
            $map["username"] = array("eq", session("username"));
            $pwd = $user->where($map)->getField("password");
            if($old_pwd == $pwd){
                $this->ajaxReturn(1);
            }else{
                $this->ajaxReturn(0);
            }
        }
    }
    
    public function upd_pwd(){
        if(session("username")==null){
            $this->redirect("User/login");
        }else{
            $new_pwd = I("new_pwd");
            $user = M("User");
            $map["username"] = array("eq", session("username"));
            $data["password"] = $new_pwd;
            $user->where($map)->save($data);
            $this->ajaxReturn(1);
        }
    }
    
    public function notice(){
        if(session("username")==null){
            $this->redirect("User/login");
        }else{
            $data["username"] = session("username");
            $this->assign("info",$data);
            $this->display();
        }
    }

    public function warning(){
        $this->display();
    }
    
    public function logout(){
        if(session("username")!=null){
            //session(null);
            session("[destroy]");
            $this->redirect("User/login");
        }else{
            $this->redirect("User/login");
        }
    }

    public function getBrowser(){
        $agent=$_SERVER["HTTP_USER_AGENT"];
        if(strpos($agent,'MSIE')!==false || strpos($agent,'rv:11.0')) //ie11判断
            return "ie";
        else if(strpos($agent,'Firefox')!==false)
            return "firefox";
        else if(strpos($agent,'Chrome')!==false)
            return "chrome";
        else if(strpos($agent,'Opera')!==false)
            return 'opera';
        else if((strpos($agent,'Chrome')==false)&&strpos($agent,'Safari')!==false)
            return 'safari';
        else
            return 'unknown';
    }
    
    public function verifyImg(){
        $config=array(
            'fontSize' => 16,   // 验证码字体大小(px)
            'imageH'    =>  40,               // 验证码图片高度
            'imageW'    =>  120,               // 验证码图片宽度
            'length'    =>  4,               // 验证码位数
            'fontttf'   =>  '5.ttf',              // 验证码字体，不设置随机获取
        );
        $verify=new Verify($config);
        $verify->entry();
    }
    
    public function _empty(){
        $this->redirect("User/notfound");
    }
    
    public function notfound(){
        $this->display();   
    }
}