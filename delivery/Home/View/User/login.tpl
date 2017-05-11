<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>“电抗之声”投稿系统</title>
    <link rel="stylesheet" href="{$Think.const.COMMON_CSS_URL}bootstrap.min.css">
    <link rel="stylesheet" href="{$Think.const.USER_CSS_URL}component-min.css">
    <link rel="stylesheet" href="{$Think.const.USER_CSS_URL}common_login_reg.css">
    <style>
        .lhlogo {
            background: url({$Think.const.USER_IMG_URL}logo1.png) no-repeat scroll 0 0 rgba(0,0,0,0);
            display: block;
            height: 200px;
            width: 360px;
            left: 20px;
            margin-left: 0px;
            position: absolute;
            top: -110px;
        }
    </style>
</head>
<body style="background:url({$Think.const.USER_IMG_URL}login_bg.jpg) no-repeat center;">

<div class="loginDialog">
    <div class="login loginForm">
        <a href="javascript:void(0)" class="lhlogo"></a>
        <div class="login-inner loginWrapper">
            <h1 class="login-title">"电抗之声"投稿系统</h1>

            <div class="login-item mgb20 inputWrapper">
                <input type="text" class="form-control name" placeholder="请输入用户名">
            </div>

            <div class="login-item mgb20 inputWrapper">
                <input type="password" class="form-control pwd" placeholder="请输入密码">
            </div>

            <div class="login-item mgb20 inputWrapper">
                <input type="text" class="form-control checkcode" placeholder="验证码">
                <img class="checkimg" src="{$ckcode}">
            </div>

            <div class="checkbox-group clearfix">
                <span class="fl loginCheck">
                    <input id="keepLogin" name="keepLogin" checked="checked" type="checkbox">
                    <label for="keepLogin">记住我</label>
                </span>
            </div>

            <div>
                <button class="login-btn btnLoginSubmit" type="submit" tabindex="4">登录</button>
            </div>
        </div>
        <p class="copyright"><a href="javacript:void(0)" target="_blank">© 逆流极光工作室</a>&nbsp;&nbsp;正在全面公测...</p>
    </div>
</div>

<!-- 提示弹框，默认是隐藏的 -->
<div class="modal fade" id="warning_Modal" tabindex="-1">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">温馨提示</h4>
      </div>
      <div class="modal-body">
        <p>您好，请填写完整登录信息。</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="error_Modal" tabindex="-1">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">填写错误</h4>
      </div>
      <div class="modal-body">
        <p class="error_text"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
    var ajax_reg_url = "/index.php?m=&c=Public&a=ajax_reg";
    var ajax_login_url = "/index.php?m=&c=Public&a=ajax_login";
</script>
<script src="{$Think.const.COMMON_JS_URL}jquery-1.12.1.min.js"></script>
<script src="{$Think.const.COMMON_JS_URL}bootstrap.min.js"></script>
<script>
    $(function(){
        $(".name").focus();
        var imgsrc=$(".checkimg").attr("src");

        $(".checkimg").click(function(){
            $(this).attr("src",imgsrc.replace(/\?.*$/,'')+'?'+Math.random());
        });

        $(".checkcode").keydown(function(e){
            if(e.which == 13){
                e.preventDefault();
                $(".btnLoginSubmit").trigger("click");
            }
        });
        
        $(".btnLoginSubmit").click(function(){
            if($(".name").val()=="" || $(".pwd").val()=="" || $(".checkcode").val()==""){
                $("#warning_Modal").modal();
            }else{
                var name=$(".name").val();
                var pwd=$(".pwd").val();
                var checkcode=$(".checkcode").val();
                $.post('./login', {name:name, pwd:pwd, checkcode: checkcode}, function(data, status) {
                    if(status!="success"){
                        alert("数据传输错误");
                    }else{
                        if(data=="check_error"){
                            $(".error_text").text("验证码填写错误");
                            $("#error_Modal").modal();
                        }
                        if(data=="info_error"){
                            $(".error_text").text("用户名或者密码错误");
                            $("#error_Modal").modal();
                        }
                        if(data=="1"){
                            location.href="./index";
                        }
                        if(data=="2"){
                            location.href="{$redirectUrl}/Admin/Manager/index";
                        }                   
                    }
                });
            }
        })
    });
</script>
</body>
</html>