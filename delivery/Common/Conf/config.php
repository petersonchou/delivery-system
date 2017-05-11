<?php
return array(
	//'配置项'=>'配置值'
	"MODULE_ALLOW_LIST" => array("Home","Admin"),
    "DEFAULT_MODULE" => "Home",
    
    //设置路径重写 
    "URL_MODEL" => "2",
    
    //数据库配置信息
    'DB_TYPE' => 'mysql', // 数据库类型
    'DB_HOST' => '127.0.0.1', // 服务器地址
    'DB_NAME' => 'delivery', // 数据库名
    'DB_USER' => 'root', // 用户名
    'DB_PWD' => '123', // 密码
    'DB_PORT' => 3306, // 端口
    'DB_PARAMS' => array(), // 数据库连接参数
    'DB_PREFIX' => 'think_', // 数据库表前缀
    'DB_CHARSET'=> 'utf8', // 字符集
    'DB_DEBUG' => TRUE, // 数据库调试模式 开启后可以记录SQL日志
    
    //定义模板文件的后缀名
    'TMPL_TEMPLATE_SUFFIX'=>'.tpl'
);