<?php
namespace Org\Util;

class Tools{
    public $timeout = 10;
    
    public function getLeavingTime($lastvisit, $now){
        $lastvisit = substr($lastvisit, 11);
        $now = substr($now, 11);
        $l_h = intval(substr($lastvisit, 0, 2));
        $l_m = intval(substr($lastvisit, 3, 2));
        $l_s = intval(substr($lastvisit, 6, 2));
        $n_h = intval(substr($now, 0, 2));
        $n_m = intval(substr($now, 3, 2));
        $n_s = intval(substr($now, 6, 2));
        if($l_h>=12 && $n_h<12){
            $l_diff = abs(($l_h-24)*3600 + $l_m*60 + $l_s);
            echo $l_diff."<br/>";
            $n_diff = $n_h*3600 + $n_m*60 + $n_s;
            echo $n_diff."<br/>";
            $result = abs($l_diff+$n_diff);
            echo $result."<br/>";
        }else if($l_h<12 && $n_h>=12){
            $l_diff = $l_h*3600 + $l_m*60 +$l_s;
            $n_diff = abs(($n_h-24)*3600 + $n_m*60 + $n_s);
            $result = $l_diff+$n_diff;
        }else{
            $result = abs(($l_h-$n_h)*3600 + ($l_m-$n_m)*60 + $l_s-$n_s);
        }
        $result = number_format($result/60, 1);
        return $result;
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
    
/*     public function updateLastVisited($username){
        $sqlHelper = new SqlHelper();
        $now = date("Y-m-d H:i:s");
        $sql = "update manager set lastvisited='".$now."' where username='".$username."'";
        $res = $sqlHelper->execute_dml($sql);
        $sqlHelper->close_link();
        return $res;
    } */
    
    public function getLastVisited(){
        $lastVisited = "2016-6-1 11:30:00";
        return $lastVisited;
    }
    
/*     public function updateLoginIp($username){
        $sqlHelper = new SqlHelper();
        $ipAddr=$_SERVER['REMOTE_ADDR'];
        $sql = "update manager set loginIP='".$ipAddr."' where username='".$username."'";
        $res = $sqlHelper->execute_dml($sql);
        $sqlHelper->close_link();
        return $res;
    } */
    
/*     public function getLoginIp($username){
        $sqlHelper = new SqlHelper();
        $sql = "select * from manager where username='".$username."'";
        $arr = $sqlHelper->execute_dql2($sql);
        $loginIP = $arr[0]["loginIP"];
        $sqlHelper->close_link();
        return $loginIP;
    } */
    
    public function checkLeavingTime($username){
        $nowTime = date("Y-m-d H:i:s");
        $lastvisited = $this->getLastVisited();
        if($this->getLeavingTime($lastvisited, $nowTime)<=$this->timeout){
            return 1;
        }else{
            return 0;
        }
        //return $this->getLeavingTime($lastvisited, $nowTime);
    }
    
/*     public function checkIp($username){
        $localAddr = $_SERVER['REMOTE_ADDR'];
        $loginIp = $this->getLoginIp($username);
        if($localAddr == $loginIp){
            return 1;
        }else{
            return 0;
        }
    } */
}