<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <meta charset="utf-8">
        <title>“电抗之声”投稿系统</title>
        <!-- Bootstrap -->
        <link href="{$Think.const.ELSE_URL}bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.ELSE_URL}bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">->
        <link href="{$Think.const.ELSE_URL}assets/styles.css" rel="stylesheet" media="screen">
        <style>
            .inline, .layupdate li{display:inline-block; *display:inline; *zoom:1; vertical-align:top; font-size:14px;}
            .okpost,.failpost{
                font-weight: bold;
            }
            .okpost{
                color:#59B259;
            }
            .failpost{
                color:red;
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
                
                <div class="span9" id="content">
                    
                    <!--本月稿件统计-->
                    <div class="row-fluid section">
                         <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="pull-left">
                                    <span style="font-weight:bold;font-size:16px;">统计查询</span> 
                                    <!-- <span style="font-size:15px"><span class="year_sel" style="color:green">{$info['year']}</span> 年 <span class="month_sel" style="color:green">{$info['month']}</span> 月，共交稿 <span class="total" style="color:green">{$info["total"]}</span> 篇，上稿 <span class="ok" style="color:green">{$info["ok"]}</span> 篇</span>                                -->
                                </div>
                            </div>
                            <div class="block-content collapse in">
                                <form class="form-horizontal" style="padding-bottom:0;margin-top:10px;">
                                    <div class="control-group">
                                        <div class="controls" style="margin-left:5px;">                                            
                                            <div style="display:inline-block">
                                                <ul class="inline datebox">
                                                    起始日期：<li class="inline laydate-icon startdate" id="start" style="width:100px; margin-right:10px;"></li>
                                                    截止日期：<li class="inline laydate-icon enddate" id="end" style="width:100px;"></li>
                                                </ul>
                                            </div>
                                            <button class="btn btn-default btn_query" style="margin-left:20px">查询</button>
                                        </div>
                                    </div>
                                </form>
                                <hr>
                                <div class="block-content collapse in showstat">
                                    <!--文字统计信息-->
                                    <div class="statgrid" style="display:inline-block;margin-top:100px;font-size:16px;float:left">
                                        投稿总数：<span class="totalpost"></span> 篇，上稿：<span class="okpost"></span> 篇，未通过：<span class="failpost"></span> 篇，待审核：<span class="waitpost"></span> 篇。
                                    </div>
                                    <!--统计图-->
                                    <div class="span5 chart" style="float:right">
                                        <div id="hero-donut" style="height: 250px;"></div>    
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
                </div>
            </div>
            <hr>

			<!--解析底部模板-->
            <include file="Public/footer" />
        
        </div>

        <link rel="stylesheet" href="{$Think.const.ELSE_URL}vendors/morris/morris.css">
        <script src="{$Think.const.ELSE_URL}vendors/jquery-1.9.1.min.js"></script>
        <script src="{$Think.const.ELSE_URL}vendors/raphael-min.js"></script>
        <script src="{$Think.const.ELSE_URL}vendors/morris/morris.min.js"></script>
        <script src="{$Think.const.ELSE_URL}bootstrap/js/bootstrap.min.js"></script>
        <script src="{$Think.const.ELSE_URL}assets/scripts.js"></script>
        <script src="{$Think.const.ELSE_URL}layer/layer.js"></script>
        <script src="{$Think.const.ELSE_URL}laydate/laydate.js"></script>
        <script>
        	function morris(fail, ok, unsolved){
        		// Morris Donut Chart
        		Morris.Donut({
                    element: 'hero-donut',
                    data: [
                        {label: '已通过', value: ok },
                        {label: '未通过', value: fail },
                        {label: '待审核', value: unsolved },
                    ],
                    colors: ["green", "red", "#c4dafe"],
                    formatter: function (y) { return y + "%" }
                });
        	}

            $(function(){
            	//页面初始加载时的显示
                $(".stat").addClass('active').siblings().removeClass('active');
                
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
				
                $(".statgrid").hide();
                //监听事件并重新绘制图表
                $(".btn_query").click(function(e){
                    e.preventDefault();
                    $(".statgrid").hide();
                    if( $(".startdate").text()=="" && $(".enddate").text()=="" ){
                        layer.msg('请至少选择一个日期！', function(){});
                    }else{
                        var from = $(".startdate").text();
                        var to = $(".enddate").text();
                        $.post('./getStat', {from: from, to: to}, function(data, status) {
                            if(status!="success"){
                                alert("数据连接错误");
                            }else{
                                $(".totalpost").text(data["total"]);
                                $(".okpost").text(data["passed"]);
                                $(".failpost").text(data["denied"]);
                                $(".waitpost").text(data["wait"]);
                                $(".statgrid").show("slow");
                                var fail_init = (data["denied"]/data["total"]).toFixed(1) * 100;
                                var ok_init = (data["passed"]/data["total"]).toFixed(1) * 100;
                                var unsolved_init = 100 - fail_init - ok_init;
                                morris(fail_init, ok_init, unsolved_init);
                                $(".chart").hide();
                                $(".chart").show("slow");
                            }
                        });
                        
                        
                    }
                    
                });
                
            });            
        </script>

    </body>

</html>