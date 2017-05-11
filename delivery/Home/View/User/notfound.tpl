<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>页面没找到！</title>
</head>
<body>
	<div style="margin:100px auto; text-align:center">
		<img src="{$Think.const.COMMON_IMG_URL}404.jpg"><br>
		<p style="margin-top:30px;font-size:18px;font-weight:bold"><span class="countdown"></span> 秒钟后跳转...</p>
	</div>
<script src="{$Think.const.ELSE_URL}vendors/jquery-1.9.1.min.js"></script>
<script>
	$(function(){
		var countdown = 5;
		$(".countdown").text(countdown);
		var interId = setInterval(function(){
			if(countdown-- == 1 ){
				clearInterval(interId);
				window.location.href="./index";
			}else{				
				$(".countdown").text(countdown);
			}			
		}, 1000);
	});
</script>
</body>
</html>