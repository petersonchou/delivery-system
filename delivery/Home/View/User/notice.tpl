<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <title>“电抗之声”投稿系统</title>
        <!-- Bootstrap -->
        <link href="{$Think.const.ELSE_URL}bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.ELSE_URL}bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.ELSE_URL}assets/styles.css" rel="stylesheet" media="screen">
        <link href="{$Think.const.USER_CSS_URL}mynotice.css" rel="stylesheet">
        <style>
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

        <!-- <div class="container-fluid topbg">
            <img src="{$Think.const.COMMON_IMG_URL}topbg.jpg" alt="">
            <div class="row-fluid">
               <img src="{$Think.const.USER_IMG_URL}topbg.jpg" alt="">
            </div>
        </div> -->
        <div class="container-fluid" style="background-color: #F5F5F5;padding-top:50px;padding-bottom:30px">
            <div class="main row-fluid">
                <p style="margin-top:170px">一、贴近连队实际，报道中心工作。</p>
                <p>二、字数（含标点符号）400到600字，严禁出现错别字、病句。</p>
                <p>三、单位主管干部负责审核，把好稿件质量关。</p>
                <div style="font-size:17px">
                    <p style="margin-left:400px;margin-bottom:20px;margin-top:150px">联系人：王羽，电话：18908056608，966608</p>
                    <p style="margin-left:470px;margin-bottom:20px">赵学民，电话：18280084983，934983</p>
                    <p style="margin-left:470px">王伟东，电话：18302886918，936918</p>
                </div>
            </div>
        </div>
        <hr>
        <!--解析底部模板-->
        <include file="Public/footer" />

        <script src="{$Think.const.ELSE_URL}vendors/jquery-1.9.1.min.js"></script>
        <script src="{$Think.const.ELSE_URL}bootstrap/js/bootstrap.min.js"></script>
        <script>
            $(function(){
                $(".noticeframe").addClass('active').siblings('li').removeClass('active');
                $(".main").hide();
                $(".main").show("slow");
            })
        </script>

    </body>

</html>