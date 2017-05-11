<?php
namespace Model;
use Think\Model;

class UserModel extends Model{
    public function checkNamePwd($name, $pwd){
        $info=$this->getByUsername($name);
        if($info!=null){
            if($info['password']==$pwd){
                return $info;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

}