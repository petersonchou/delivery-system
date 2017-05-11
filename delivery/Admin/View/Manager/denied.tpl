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
                                        <div class="controls" style="margin-left:20px">
                                            <select class="department" style="width:110px;float:left">
                                                <option value="default">单位..</option>
                                                <option value="all">全部</option>
                                                <option value="一营营部">一营营部</option>
                                                <option value="二营营部">二营营部</option>
                                                <option value="三营营部">三营营部</option>
                                                <option value="四营营部">四营营部</option>
                                                <option value="训练队队部">训练队队部</option>
                                                <option value="一连">一连</option>
                                                <option value="二连">二连</option>                                                
                                                <option value="三连">三连</option>
                                                <option value="四连">四连</option>
                                                <option value="五连">五连</option>
                                                <option value="六连">六连</option>                                                
                                                <option value="七连">七连</option>
                                                <option value="八连">八连</option>
                                                <option value="九连">九连</option>                                                
                                                <option value="十连">十连</option>
                                                <option value="十一连">十一连</option>
                                                <option value="十二连">十二连</option>                                                
                                                <option value="一中队">一中队</option>
                                                <option value="二中队">二中队</option>
                                                <option value="三中队">三中队</option>
                                                <option value="警通连">警通连</option>
                                                <option value="修理连">修理连</option>
                                            </select>
                                            <select class="sort" style="width:80px;margin-left:30px">
                                                <option value="default">排序...</option>
                                                <option value="postdate">按日期（默认）</option>
                                                <option value="author">按作者</option>
                                                <option value="title">按标题</option>
                                                <option value="username">按单位</option>
                                            </select> 
                                            <a class="btn btn-default btn_search" style="float:right" href="javascript:void(0)" title="搜索"><i class="icon-search"></i></a>
                                            <input id="keyword" type="text" placeholder="请输入关键字" style="float:right;width:100px;font-size:12px;margin-left:20px;margin-right:5px">
                                        </div>
                                    </div>
                                </form>

                                <hr style="border:2px solid #eee; margin-bottom:0;">

                                <div class="block-content collapse in">
                                    <div class="span12">
                                        <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-condensed table-hover" id="example">
                                            <thead>
                                                <tr class="headtitle">
                                                    <th style="width:20px">序号</th>
                                                    <th style="width:140px">标题</th>
                                                    <th style="width:60px">单位</th>
                                                    <th style="width:30px">作者</th>
                                                    <th style="width:70px">提交日期</th>
                                                    <th style="width:30px">状态</th>
                                                    <th style="width:30px">操作</th>
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
                            <h4 class="modal-title" style="text-align:center;margin-bottom:0"></h4>&nbsp;
                            <div style="text-align:center">
                                单位：<span class="modal-title-username"></span>&nbsp;&nbsp;&nbsp;
                                作者：<span class="modal-title-author"></span>&nbsp;&nbsp;&nbsp;
                                提交于：<span class="modal-title-postdate"></span>&nbsp;&nbsp;&nbsp;
                                状态：<span class="modal-title-status" style="color:red;font-weight:bold;"></span>
                            </div>
                        </div>
                        <div class="modal-body">
                            <p class="mycontent"></p>
                        </div>
                        <div class="modal-footer">
                            <span class="check_rowid" style="display:none"></span>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">看完了</button>
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
        <script src="{$Think.const.ADMIN_JS_URL}list-denied.js"></script>
        <script src="{$Think.const.ELSE_URL}notie/notie.min.js"></script>
        <script>
            $(function(){
            	//页面初始加载
                $(".sort").val("default");
                $("#keyword").val("");
                $(".denied").addClass('active').siblings('li').removeClass('active');
                var pagesize = {$Think.const.PAGE_SIZE};
                var pageulsize = {$Think.const.PAGE_ULSIZE};
                var all = {$info["all"]|json_encode};
                if(all.length==0){
                    layer.msg('系统初始化完成，请耐心等待各分队投稿...', function(){});
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

                //单位选项被选中
                $(".department").change(function(){
                    $(".sort").val("default");
                    var depart_val = $(this).val();
                    var all = {$info["all"]|json_encode};
                    if(depart_val!="default"){
                        if(depart_val=="all"){
                            dynamic = all;                        
                        }else{
                            dynamic = getDepartInfo(all, depart_val);
                        }
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
                    var username = row["username"];
                    var author = row["author"];
                    var postdate = row["postdate"].substring(0, 10);
                    var content = row["content"];
                    var status = "未通过";
                    $("#modal_look .modal-title").text(title);
                    $("#modal_look .modal-title-username").text(username);
                    $("#modal_look .modal-title-author").text(author);
                    $("#modal_look .modal-title-postdate").text(postdate);
                    $("#modal_look .modal-title-status").text(status);
                    $("#modal_look .check_rowid").text(rowid);
                    $("#modal_look .mycontent").html(content);
                    $("#modal_look").modal();
                });

                //点击重审按钮
                $(".tablebody").on("click",".btn_recover",function(){
                    var rowid = parseInt($(this).parent().parent().children('.rowid').text());
                    layer.msg('确定要二审？', {
                      time: 0 //不自动关闭
                      ,btn: ['必须的', '不']
                      ,yes: function(index){
                        layer.close(index);
                        var status = 1;
                        $.post('./updStatus', {id: rowid, status: status}, function(data, mystatus) {
                            if(mystatus!="success"){
                                alert("数据连接出错");
                            }else{
                                if(data==1){
                                    notie.alert(1, '更改审核状态成功，正在跳转...', 2);
                                    setTimeout(function(){
                                        window.location.reload();
                                    }, 2000);
                                }else{
                                    alert("更改失败");
                                }
                            }
                        });
                      }
                    });
                });

                //点击拒绝按钮
                $(".tablebody").on("click",".btn_admit",function(){
                    var rowid = parseInt($(this).parent().parent().children('.rowid').text());
                    layer.msg('确定要救他？', {
                      time: 0 //不自动关闭
                      ,btn: ['恩，是的', '不']
                      ,yes: function(index){
                        layer.close(index);
                        var status = 3;
                        $.post('./updStatus', {id: rowid, status: status}, function(data, mystatus) {
                            if(mystatus!="success"){
                                alert("数据连接出错");
                            }else{
                                if(data==1){
                                    notie.alert(1, '更改审核状态成功，正在跳转...', 2);
                                    setTimeout(function(){
                                        window.location.reload();
                                    }, 2000);
                                }else{
                                    alert("更改失败");
                                }
                            }
                        });
                      }
                    });
                });
            });
        </script>

    </body>

</html>