<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <title>“电抗之声”投稿系统</title>
        <!-- Bootstrap -->
        <link href="{$Think.const.ELSE_URL}bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.ELSE_URL}bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.COMMON_CSS_URL}pages.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.COMMON_CSS_URL}glyphicon.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.ELSE_URL}assets/styles.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.ELSE_URL}assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.ELSE_URL}notie/notie.css" rel="stylesheet">
        <style>
            thead{
                background-color: #eee;
            }
            .tablebody td{
               line-height: 2.3em;
               height:2.3em;
            } 
            .btn_css{
                margin-left: 10px
            }
            .reficon:hover{
                text-decoration: none;
            }
            .reficon:visited{
                text-decoration: none;
            }
            .reficon:link{
                text-decoration: none;   
            }
            .mystatus_pass{
                font-weight: bold;
                color:#59B259;
            }
        </style>
        <script src="{$Think.const.ELSE_URL}vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body>
    	<!--解析顶部导航栏模板-->
        <include file="Public/header" />

        <div class="container-fluid">
            <div class="row-fluid">
				<!--解析侧边栏模板-->
				<include file="Public/sidebar" />
                <!--右侧展示区-->
                <div class="span9" id="content">
                    <!--展示区头部-->
                    <div class="row-fluid">
                        <div class="alert alert-success" style="margin-bottom:0">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4 style="font-size:14px;">您好，欢迎使用电子对抗团新闻广播投稿系统！ 请调节浏览器缩放比例(CTRL+"="或CTRL+"-")以获得最佳体验效果^_^</h4>
                        </div>
                        <div id="nativeShare"></div>
                    </div>

                    <!--列出所有稿件-->
                    <div class="row-fluid section showall">
                         <!--block-->
                        <div class="block" style="height:470px">
                            <div class="navbar navbar-inner block-header">
                                <!--列表头-->
                                <div class="pull-left">
                                    <span style="font-size:17px;"><b>稿件列表</b></span>
                                </div>
                            </div>
                            <div class="block-content collapse in">                                
                                <form class="form-horizontal" style="padding-bottom:0">
                                    <div class="control-group">
                                        <div class="controls" style="margin-left:10px">
                                            <select name="" class="sort" style="width:80px;height:30px;">
                                                <option value="default">排序...</option>
                                                <option value="postdate">按日期（默认）</option>
                                                <option value="author">按作者</option>
                                                <option value="title">按标题</option>
                                                <option value="statusid">按状态</option>
                                            </select>                                     
                                            <input id="keyword" type="text" placeholder="请输入关键字" style="width:100px;font-size:12px;margin-left:20px">
                                            <a class="btn btn-default btn_search" href="javascript:void(0)" title="搜索"><i class="icon-search"></i></a>
                                            <div style="float:right;margin-right:13px">
                                                <button class="btn btn-success btn_add"><i class="icon-plus icon-white"></i> 投稿</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <hr style="border:2px solid #eee; margin-bottom:0;">

                                <div class="block-content collapse in">
                                    <div class="span12">
                                        <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-condensed table-hover" id="example">
                                            <thead>
                                                <tr class="headtitle">
                                                    <th style="width:30px">序号</th>
                                                    <th style="width:140px">标题</th>
                                                    <th style="width:60px">作者</th>
                                                    <th style="width:70px">提交日期</th>
                                                    <th style="width:30px">状态</th>
                                                    <th style="width:100px">操作</th>
                                                </tr>
                                            </thead>
                                            <tbody class="tablebody">
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="fenye">
                                        <ul class="pages ulpage"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modal_look" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" style="text-align:center;margin-bottom:0"></h4>&nbsp;<div style="text-align:center">作者：<span class="modal-title-author"></span>&nbsp;&nbsp;&nbsp;提交于：<span class="modal-title-postdate"></span>&nbsp;&nbsp;&nbsp;状态：<span class="modal-title-status mystatus_pass"></span></div>
                        </div>
                        <div class="modal-body">
                            <p class="mycontent"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">看完了</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            
            <div class="modal fade" id="modal_add">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" style="color:#666"><span class="glyphicon glyphicon-envelope" style="color:#0063CC;vertical-align:middle"></span> <span style="vertical-align:middle">我要投稿</span></h4>
                        </div>
                        <div class="modal-body">
                            <div><span style="font-weight:bold">标题：</span><input type="text" class="title_add" style="width:200px;margin-top:5px"><span style="margin-left:40px;font-weight:bold">作者：</span><input type="text" class="author_add" style="width:80px;margin-top:5px"></div>
                            <hr style="margin-top:5px;margin-bottom:5px">
                            <div style="font-weight:bold">正文：</div>
                            <textarea class="mycontent" style="resize: none;"></textarea>
                            <p class="tip"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success btn_post">提交</button>
                            <button type="button" class="btn btn-danger btn_drop">放弃</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            
            
            <hr>
			<!--解析底部模板-->
            <include file="Public/footer" />
        
        </div>

        <script src="{$Think.const.ELSE_URL}vendors/jquery-1.9.1.min.js"></script>
        <script src="{$Think.const.ELSE_URL}bootstrap/js/bootstrap.min.js"></script>
        <script src="{$Think.const.ELSE_URL}assets/scripts.js"></script>
        <script src="{$Think.const.ELSE_URL}layer/layer.js"></script>
        <script src="{$Think.const.USER_JS_URL}list-passed.js"></script>
        <script src="{$Think.const.ELSE_URL}notie/notie.min.js"></script>
        <script>
            $(function(){
            	//页面初始加载
                $(".passed").addClass('active').siblings('li').removeClass('active');
                $(".sort").val("default");
                $("#keyword").val("");
                var pagesize = {$Think.const.PAGE_SIZE};
                var pageulsize = {$Think.const.PAGE_ULSIZE};
                var all = {$info["all"]|json_encode};
                if(all.length==0){
                    layer.msg('欢迎亲来到投稿系统，赶紧投稿吧 ^_^', function(){});
                }else{
                var pagenow = 1;
                var dynamic = all;
                var prev = $("<li class='btn_prev'><a href='javascript:void(0)'><span>上一页</span></a></li>");
                var next = $("<li class='btn_next'><a href='javascript:void(0)'><span>下一页</span></a></li>");
                var sep = $("<li class='btn_sep disabled'><a href='javascript:void(0)'><span class='glyphicon glyphicon-option-vertical'></span></a></li>");
                var front = $("<li class='btn_front'><a href='javascript:void(0)' title='首页'><span class='glyphicon glyphicon-fast-backward'></span></a></li>");
                var end = $("<li class='btn_end'><a href='javascript:void(0)' title='尾页'><span class='glyphicon glyphicon-fast-forward'></span></a></li>");          
                var pageTipDy = $("<span class='pageTip'>当前第<span class='pn'></span>/<span class='totalpages'></span>页,共<span class='totalrows'></span>条记录</span>");
                list_dynamic(all, pagenow, pagesize);
                $(".ulpage").append(prev);
                $(".ulpage").append(next);
                $(".ulpage").append(sep);
                $(".ulpage").append(front);
                $(".ulpage").append(end);
                $(".ulpage").append(pageTipDy);
                show_pagenum(all, pagenow, pagesize, pageulsize);
                $(".showall").hide();
                $(".showall").show("slow");
                setTimeout(function(){
                    $(".alert").hide("slow");
                }, 7000)
            }

                //点击数字按钮
                $(".ulpage").on("click",".pageNum",function(){
                    pagenow = $(this).text();
                    pagenow = parseInt(pagenow);
                    $(this).siblings(".pageNum").removeClass("active");
                    $(this).addClass("active");
                    $(".pn").text(pagenow);                    
                    list_dynamic(dynamic, pagenow, pagesize);
                    var totalpages = Math.ceil(dynamic.length/pagesize);
                    judge(pagenow, totalpages);
                });

                //点击上一页
                $(".ulpage").on("click",".btn_prev",function(e){
                    if($(this).hasClass("disabled")){
                        e.preventDefault();
                    }else{
                        pagenow = pagenow - 1;
                        if(pagenow % pageulsize == 0){
                            show_pagenum(dynamic, pagenow, pagesize, pageulsize);
                        }else{
                            $(".ulpage > .active").removeClass("active").prev().addClass("active");
                            $(".pn").text(pagenow);
                            var totalpages = Math.ceil(dynamic.length/pagesize);
                            judge(pagenow, totalpages);
                        }
                        list_dynamic(dynamic, pagenow, pagesize);
                    }
                });

                //点击下一页
                $(".ulpage").on("click", ".btn_next", function(e){
                    if($(this).hasClass("disabled")){
                        e.preventDefault();
                    }else{
                        pagenow = pagenow + 1; 
                        if(pagenow % pageulsize == 1){
                            show_pagenum(dynamic, pagenow, pagesize, pageulsize);
                        }else{
                            $(".ulpage > .active").removeClass("active").next().addClass("active");
                            $(".pn").text(pagenow);
                            var totalpages = Math.ceil(dynamic.length/pagesize);
                            judge(pagenow, totalpages); 
                        }
                        list_dynamic(dynamic, pagenow, pagesize);
                    }
                });

                //点击首页
                $(".ulpage").on("click", ".btn_front", function(e){
                    if($(this).hasClass("disabled")){
                        e.preventDefault();
                    }else{
                        pagenow = 1;
                        show_pagenum(dynamic, pagenow, pagesize, pageulsize);
                        list_dynamic(dynamic, pagenow, pagesize);
                    }                    
                });

                //点击尾页
                $(".ulpage").on("click", ".btn_end", function(e){
                    if($(this).hasClass("disabled")){
                        e.preventDefault();
                    }else{
                        pagenow = Math.ceil(dynamic.length/pagesize);
                        show_pagenum(dynamic, pagenow, pagesize, pageulsize);
                        list_dynamic(dynamic, pagenow, pagesize);
                    }
                });

                //排序项被选中
                $(".sort").change(function(){
                    var value = $(this).val();
                    if(value != "default"){
                        dynamic = sort_dynamic(dynamic, value);
                        show_pagenum(dynamic, pagenow, pagesize, pageulsize);
                        list_dynamic(dynamic, pagenow, pagesize);
                    }
                });

                //在搜索框中按下回车
                $("#keyword").keydown(function(e){
                    if(e.which == 13){
                        e.preventDefault();
                        $(".btn_search").trigger("click");
                    }
                });

                //点击搜索按钮
                $(".btn_search").click(function(e){
                    e.preventDefault();
                    if( $.trim($("#keyword").val()) != ""){
                        var keyword = $("#keyword").val();
                        all = {$info["all"]|json_encode};
                        result = search_dynamic(all, keyword);
                        if(result.length>0){
                            dynamic = result;
                            list_dynamic(dynamic, pagenow, pagesize);
                            show_pagenum(dynamic, pagenow, pagesize, pageulsize);
                        }else{
                            alert("没有查找到相关记录！");
                        }                        
                    }else{
                        dynamic = all;
                        $(".sort").val("default");
                        list_dynamic(dynamic, pagenow, pagesize);
                        show_pagenum(dynamic, pagenow, pagesize, pageulsize);
                    }
                });

                //点击查看按钮
                $(".tablebody").on("click",".btn_look",function(){
                    var all = {$info["all"]|json_encode};
                    var rowid = parseInt($(this).parent().parent().children('.rowid').text());
                    for(var i=0; i<all.length; i++){
                        if(all[i]["id"]==rowid){
                            row = all[i];
                            break;
                        }
                    }
                    var title = row["title"];
                    var author = row["author"];
                    var postdate = row["postdate"].substring(0, 10);
                    var content = row["content"];
                    var status = "已通过";
                    $("#modal_look .modal-title").text(title);
                    $("#modal_look .modal-title-author").text(author);
                    $("#modal_look .modal-title-postdate").text(postdate);
                    $("#modal_look .modal-title-status").text(status);
                    $("#modal_look .mycontent").html(content);
                    $("#modal_look").modal();
                });

                //点击投稿按钮
                $(".showall").on("click",".btn_add",function(e){
                    e.preventDefault();
                    var content_width = $("#modal_add").width()*0.9;
                    $("#modal_add .mycontent").css("width",content_width);
                    $("#modal_add .mycontent").css("height",260);
                    checkStrLen_add();
                    $("#modal_add").modal();
                });

                //投稿窗口打开时触发
                $('#modal_add').on('shown.bs.modal', function(){
                  $('.title_add').focus();
                });

                //点击提交按钮
                $("#modal_add .btn_post").click(function(){
                    if($.trim($("#modal_add .title_add").val())=="" || $.trim($("#modal_add .author_add").val())=="" || $.trim($("#modal_add .mycontent").val())==""){
                        layer.msg('亲，请填写完整！', function(){});
                    }else if( $.trim($("#modal_add .title_add").val()).length>15 ){
                        layer.msg('标题不能超过15个汉字！', function(){});
                    }else if( $.trim($("#modal_add .author_add").val()).length>10 ){
                        layer.msg('作者姓名太长啦！', function(){});
                    }else{
                        layer.msg('确定投稿？', {
                          time: 0 //不自动关闭
                          ,btn: ['是', '否']
                          ,yes: function(index){
                            layer.close(index);
                            var add_title = $.trim($("#modal_add .title_add").val());
                            var add_author = $.trim($("#modal_add .author_add").val());
                            var add_content = $("#modal_add .mycontent").val();
                            add_content = add_content.replace(/\n/g,"<br/>");
                            var reg1 = new RegExp(" ","g");
                            add_content = add_content.replace(reg1,"&nbsp;");
                            $.post('./addContri', {add_title: add_title, add_author: add_author, add_content: add_content}, function(data, status) {
                                if(data==1){
                                    $("#modal_add .title_add").val("");
                                    $("#modal_add .author_add").val("");
                                    $("#modal_add .mycontent").val("");
                                    $("#modal_add").modal("hide");
                                    notie.alert(1, '投稿成功，正在跳转...', 1);
                                    setTimeout(function(){
                                        window.location.reload();
                                    }, 2000);
                                }else{
                                    alert("投稿失败");
                                }
                            });
                          }
                        });
                        
                    }
                });
                
                //点击放弃按钮
                $("#modal_add .btn_drop").click(function(){
                    layer.msg('确定要退出投稿？', {
                      time: 0 //不自动关闭
                      ,btn: ['是', '否']
                      ,yes: function(index){
                        layer.close(index);
                        $("#modal_add .title_add").val("");
                        $("#modal_add .author_add").val("");
                        $("#modal_add .mycontent").val("");
                        $("#modal_add").modal("hide");
                      }
                    });
                });                

            });
        </script>

    </body>

</html>