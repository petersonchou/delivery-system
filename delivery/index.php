<?php 
    //开启调试模式
    define('APP_DEBUG',True);
    
    //把几个地址设置成常量
    $host = isset($_SERVER['HTTP_X_FORWARDED_HOST']) ? $_SERVER['HTTP_X_FORWARDED_HOST'] : (isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '');
    define('SITE_URL','http://'.$host.'/');/* 'http://web.tp.com/' */
    
    define('USER_CSS_URL', SITE_URL.'myweb/delivery/delivery/Public/Home/css/');
    define('USER_JS_URL', SITE_URL.'myweb/delivery/delivery/Public/Home/js/');
    define('USER_IMG_URL', SITE_URL.'myweb/delivery/delivery/Public/Home/img/');
    
    define('ADMIN_CSS_URL', SITE_URL.'myweb/delivery/delivery/Public/Admin/css/');
    define('ADMIN_JS_URL', SITE_URL.'myweb/delivery/delivery/Public/Admin/js/');
    define('ADMIN_IMG_URL', SITE_URL.'myweb/delivery/delivery/Public/Admin/img/');

    define('COMMON_CSS_URL', SITE_URL.'myweb/delivery/delivery/Public/Common/css/');
    define('COMMON_JS_URL', SITE_URL.'myweb/delivery/delivery/Public/Common/js/');
    define('COMMON_IMG_URL', SITE_URL.'myweb/delivery/delivery/Public/Common/img/');
    
    define('ELSE_URL', SITE_URL.'myweb/delivery/delivery/Public/Else/');
    
    define('PAGE_SIZE', 6);
    define('PAGE_ULSIZE', 4);
    //把TP核心文件引进来
    include "../ThinkPHP/ThinkPHP.php";
?>