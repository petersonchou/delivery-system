<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
            </a>
            <style>
                .brand:hover{
                    cursor: default;
                }
            </style>
            <a class="brand" href="javascript:void(0)" style="padding-top:0px;padding-bottom:0px;padding-right:15px;"><img src="{$Think.const.COMMON_IMG_URL}tg.png" alt=""></a>
            <div class="nav-collapse collapse">
                <ul class="nav pull-right">
                    <li class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> 
                            <i class="icon-user"></i> <span class="uname">{$info['managername']}</span> 
                            <i class="caret"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a tabindex="-1" href="./setpwd.html"><i class="icon-wrench"></i> 修改密码</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a tabindex="-1" href="./logout.html"><i class="icon-off"></i> 注销</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav">
                    <li class="mainframe active">
                        <a href="./index">稿件管理</a>
                    </li>
                    <li class="noticeframe disabled">
                        <a href="javascript:void(0)">规章制度</a>
                    </li>
                    <li class="aboutframe disabled">
                        <a href="javascript:void(0)">关于我们</a>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>