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
            .inline, .layupdate li{display:inline-block; *display:inline; *zoom:1; vertical-align:top; font-size:14px;}
            .headtitle th{
                text-align: center;
            }
            .bodyrow td{
                text-align: center;
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
                        
                    </div>

                    <!--列出所有稿件-->
                    <div class="row-fluid section showall">
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="pull-left">
                                   <!--  <h4>统计查询</h4> -->
                                    <span style="font-size:17px;"><b>统计查询</b></span>
                                </div>
                            </div>
                            <div class="block-content collapse in">                                
                                <form class="form-horizontal" style="padding-bottom:0;margin-top:10px;">
                                    <div class="control-group">
                                        <div class="controls" style="margin-left:5px;">                                            
                                            <select class="department" style="width:110px;">
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
                                            <div style="display:inline-block;margin-top:3px;margin-left:30px">
                                                <ul class="inline datebox">
                                                    起始日期：<li class="inline laydate-icon startdate" id="start" style="width:100px; margin-right:10px;"></li>
                                                    截止日期：<li class="inline laydate-icon enddate" id="end" style="width:100px;"></li>
                                                </ul>
                                            </div>
                                            <button class="btn btn-default btn_query" style="margin-left:30px">查询</button>
                                        </div>
                                    </div>
                                </form>

                                <hr style="border:2px solid #eee;">
                                
                                <div class="block-content collapse in">
                                    <div class="span12">
                                        <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-condensed table-hover" id="example">
                                            <thead>
                                                <tr class="headtitle">
                                                    <th style="width:20px">序号</th>
                                                    <th style="width:110px">单位</th>
                                                    <th style="width:60px">起始日期</th>
                                                    <th style="width:60px">截止日期</th>
                                                    <th style="width:30px">总共投稿</th>
                                                    <th style="width:30px">上稿数量</th>
                                                    <th style="width:30px">上稿率</th>
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
                                
            <hr>
			<!--解析底部模板-->
            <include file="Public/footer" />
        
        </div>

        <script src="{$Think.const.ELSE_URL}vendors/jquery-1.9.1.min.js"></script>
        <script src="{$Think.const.ELSE_URL}bootstrap/js/bootstrap.min.js"></script>
        <script src="{$Think.const.ELSE_URL}assets/scripts.js"></script>
        <script src="{$Think.const.ELSE_URL}layer/layer.js"></script>
        <script src="{$Think.const.USER_JS_URL}statistic.js"></script>
        <script src="{$Think.const.ELSE_URL}notie/notie.min.js"></script>
        <script src="{$Think.const.ELSE_URL}laydate/laydate.js"></script>
        <script>
            $(function(){
                $(".statistic").addClass('active').siblings('li').removeClass('active');
                //初始化日期控件
                var start = {
                    elem: '#start',
                    format: 'YYYY-MM-DD',
                    min: '2016-01-11 00:00:00', //设定最小日期为当前日期
                    max: '2099-06-16 23:59:59', //最大日期
                    istime: false,
                    istoday: false,
                    choose: function(datas){
                        end.min = datas; //开始日选好后，重置结束日的最小日期
                        end.start = datas //将结束日的初始值设定为开始日
                    }
                };
                var end = {
                    elem: '#end',
                    format: 'YYYY-MM-DD',
                    min: '2016-01-11 00:00:00',
                    max: '2099-06-16 23:59:59',
                    istime: false,
                    istoday: false,
                    choose: function(datas){
                        start.max = datas; //结束日选好后，重置开始日的最大日期
                        end_time = datas;
                    }
                };
                laydate(start);
                laydate(end);

                //点击查询按钮
                $(".btn_query").click(function(e){
                    e.preventDefault();
                    $(".tablebody").html("");
                    if( $(".department").val()=="default" ){
                        layer.msg('还没选择单位呢', function(){});
                    }else if( $(".startdate").text()=="" && $(".enddate").text()==""){
                        layer.msg('至少选择一个日期吧', function(){});
                    }else{
                        var department = $(".department").val();
                        var from = $(".startdate").text();
                        var to = $(".enddate").text();
                        $.post('./getStatInfo', {username: department, from: from, to: to}, function(result, status) {
                            if(status!="success"){
                                alert("数据连接错误");
                            }else{
                                for(var i=0; i<result.length; i++){
                                    var index = i + 1;
                                    var row = $("<tr class='bodyrow'><td>"+index+"</td><td>"+result[i]["username"]+"</td><td>"+result[i]["startdate"]+"</td><td>"+result[i]["enddate"]+"</td><td>"+result[i]["total"]+"</td><td>"+result[i]["passed"]+"</td><td>"+result[i]["passratio"]+"</td></tr>");
                                    $(".tablebody").append(row);
                                }
                            }
                        });
                    }
                });
            });
            	
        </script>

    </body>

</html>