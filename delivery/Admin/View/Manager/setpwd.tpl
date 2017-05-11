<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <meta charset="utf-8">
        <title>“电抗之声”投稿系统</title>
        <!-- Bootstrap -->
        <link href="{$Think.const.ELSE_URL}bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.ELSE_URL}bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.COMMON_CSS_URL}glyphicon.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.ELSE_URL}assets/styles.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.ELSE_URL}notie/notie.css" rel="stylesheet">
        <script src="{$Think.const.ELSE_URL}vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <style>
            .pwdmain{
                border: 1px solid #ddd;
                margin: 0 auto;
                width: 60%;
                background-color: #fff;
            }
        </style>
    </head>
    
    <body>
    	<!--解析顶部导航栏模板-->
        <include file="Public/header" />

        <div class="container" style="margin-top:20px">
            <form class="pwdmain form-horizontal">
                <div class="pwdtitle">
                    <span style="font-size:18px;font-weight:bold;color:#666;height:2.5em;line-height:2.5em">&nbsp;密码修改</span><span style="float:right;font-size:14px;margin-top:12px;margin-right:5px"><a href="./index.html">返回主页</a></span>
                </div>                
                <hr style="margin-top:0">
                <div class="firststep">
                    <div class="row-fluid control-group firstinput">
                        <label class="control-label" for="old_pwd">原密码:</label>
                        <div class="controls">
                            <input type="password" id="old_pwd">&nbsp;&nbsp;&nbsp;<button class="btn btn-default btn_step1">提交</button>
                        </div>
                    </div>
                </div>
                <div class="secondstep">
                    <div class="row-fluid control-group step_newpwd">
                        <label class="control-label" for="new_pwd">新密码:</label>
                        <div class="controls">
                            <input type="password" id="new_pwd"><span class="help-inline"></span>
                        </div>
                    </div>
                    <div class="row-fluid control-group step_confirmpwd">
                        <label class="control-label" for="confirm_pwd">请确认:</label>
                        <div class="controls">
                            <input type="password" id="confirm_pwd"><span class="help-inline"></span>
                        </div>
                    </div>
                    <div class="row-fluid control-group">
                        <div class="controls">
                            <button class="btn btn-success pwd_post">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="reset" class="btn btn-primary">重置</button>
                        </div>
                    </div>
                </div>
            </form>
            <hr>

			<!--解析底部模板-->
            <include file="Public/footer" />        
        </div>
        <script src="{$Think.const.ELSE_URL}vendors/jquery-1.9.1.min.js"></script>
        <script src="{$Think.const.ELSE_URL}bootstrap/js/bootstrap.min.js"></script>
        <script src="{$Think.const.ELSE_URL}assets/scripts.js"></script>
        <script src="{$Think.const.ELSE_URL}layer/layer.js"></script>
        <script src="{$Think.const.ELSE_URL}notie/notie.min.js"></script>
        <script>
            function checkpwdrule(str){  
                var patrn=/^(\w){6,15}$/;
                if (!patrn.exec(str)) return false;
                return true;
            }

            $(function(){
                $(".secondstep").hide();
                $(".btn_step1").click(function(e){
                    e.preventDefault();
                    var old_pwd = $("#old_pwd").val();
                    $.post('./get_pwd', {old_pwd: old_pwd}, function(data, status) {
                        if(status!="success"){
                            alert("数据连接出错");
                        }else{
                            if(data == 1){
                                $("#old_pwd").val("");
                                $(".firststep").hide("slow");
                                $(".secondstep").show("slow");
                            }else{
                                $(".firstinput").addClass('error');
                            }
                        }
                    });
                });
                $("#old_pwd").focus(function(){
                    $(".firstinput").removeClass('error');
                });
                $("#new_pwd").focus(function(){
                    $(".step_newpwd").removeClass('error').removeClass('success').children('.controls').children('.help-inline').text("").removeClass("glyphicon").removeClass('glyphicon-ok');
                }).blur(function(){
                    var new_pwd = $("#new_pwd").val();
                    if(new_pwd == ""){
                        $(".step_newpwd").removeClass('error').removeClass('success').addClass("error").children('.controls').children('.help-inline').text("不能为空").removeClass("glyphicon").removeClass('glyphicon-ok');
                    }else{
                        if(checkpwdrule(new_pwd)){
                            $(".step_newpwd").removeClass('error').removeClass('success').addClass('success').children('.controls').children('.help-inline').text("").addClass('glyphicon').addClass('glyphicon-ok');
                        }else{
                            $(".step_newpwd").removeClass('error').removeClass('success').addClass('error').children('.controls').children('.help-inline').text("密码必须为5-15位的字母、数字、下划线").removeClass('glyphicon').removeClass('glyphicon-ok');
                        }
                    }                    
                });
                $("#confirm_pwd").focus(function(){
                    $(".step_confirmpwd").removeClass('error').removeClass('success').children('.controls').children('span').text("").removeClass("glyphicon").removeClass('glyphicon-ok');
                }).blur(function(){
                    var confirm_pwd = $("#confirm_pwd").val();
                    if(confirm_pwd==""){
                        $(".step_confirmpwd").removeClass('error').removeClass('success').addClass("error").children('.controls').children('span').text("不能为空").removeClass("glyphicon").removeClass('glyphicon-ok');
                    }else{
                        if(checkpwdrule(confirm_pwd)){
                            $(".step_confirmpwd").removeClass('error').removeClass('success').addClass('success').children('.controls').children('span').text("").addClass('glyphicon').addClass('glyphicon-ok');
                        }else{
                            $(".step_confirmpwd").removeClass('error').removeClass('success').addClass('error').children('.controls').children('span').text("密码必须为5-15位的字母、数字、下划线").removeClass('glyphicon').removeClass('glyphicon-ok');
                        }
                    }
                });
                $(".pwd_post").click(function(e){
                    e.preventDefault();
                    if( $("#confirm_pwd").val() != $("#new_pwd").val() ){
                        layer.msg('两次密码不一致！', function(){});
                    }else if($(".step_newpwd").hasClass('success') && $(".step_confirmpwd").hasClass('success')){
                        var new_pwd = $("#confirm_pwd").val();
                        $.post('./upd_pwd', {new_pwd: new_pwd}, function(data, status) {
                            if(data == 1){
                                notie.alert(1, '修改密码成功!', 1);
                                setTimeout(function(){
                                    window.location.reload();
                                }, 1000)
                            }else{
                                alert("更新失败");
                            }
                        });
                    }
                });

            })
        </script>

    </body>

</html>