<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>注册yursile</title>
	<link href="css/reset.css" rel="stylesheet">
	<link href="css/regist.css" rel="stylesheet">
	
  </head>

  <body>
	<nav>
		<ul>
			<li><a class="navbtn">首页</a></li>
			<li><a class="navbtn">国内预订</a></li>
			<li><a class="navbtn">国际预订</a></li>
			<li><a class="navbtn">企业差旅</a></li>
			<li><a class="navbtn">特惠专区</a></li>
			<li><a class="navbtn">关于</a></li>
		</ul>
	</nav>
	
	<div class="container">
		<h1>注册会员</h1>
		<img src="pic/bg-img.jpg" class="bg-img" width="536px" height="410px">
		<aside>
			
			<a class="loginlink">我已经注册，现在登录</a>
			<h3>赶紧注册，成为yursile的一员</h3>
			
			<img class="step" alt="" src="http://pic1.plateno.com/image2/login/registry_step1.jpg" src2="http://pic1.plateno.com/image2/login/registry_step2.jpg">
			<form id="regForm" action="user/regist.action" method="post">
				<ul>
					<li class="item">
						<label>姓名</label><input class="text" type="text" name="customer.name" />
						<span for="mobilePhone" class="error">请输入您的手机号码</span>
					</li>
					<li class="item">
						<label>手机号码</label><input class="text" type="text" name="customer.phone" />
						<span for="mobilePhone" class="error">请输入您的手机号码</span>
					</li>
					<li class="item">
						<label>身份证号</label><input class="text" type="text" name="customer.IDCard" />
						<span for="mobilePhone" class="error">请输入您的手机号码</span>
					</li>
					<li class="item">
						<label>密码</label><input class="text" type="password" name="customer.password" />
						<span for="mobilePhone" class="error">请输入您的手机号码</span>
					</li>
					<li class="item">
						<label>确认密码</label><input class="text" type="password" name="repassword" />
						<span for="mobilePhone" class="error">请输入您的手机号码</span>
					</li>
					<li class="item">
						<label>验证码</label><input class="text" type="text" name="code" />
						<span for="mobilePhone" class="error">请输入您的手机号码</span>
					</li>
					<li class="item">
						<input type="checkbox"/>
						<label class="agree">我已阅读同意</label>
						<a href="#" style="color:#36c">yursile服务条款</a>
					</li>
					<li>
						<input type="button" class="regbtn" value="下一步验证">
					</li>
				</ul>
			</form>
			
			<div id="registRS">
				<h4>恭喜您，注册成功</h4>
				<span>3</span>秒钟之后自动登录
				<a href="javascript:void(0);">立即登录</a>
				<form id="loginForm" style="display:none" method="post" action="user/login">
					<input type="text" name="customer.phone">
					<input type="text" name="customer.password">
				</form>
			</div>
		</aside>
		
   
	</div>
	<script src="jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$(function($) {
		
			
  			$(".regbtn").click(function(){
  			/*
  				$("#regForm").promise().then(function(){
  					this.submit();
  				}).done(function(data){
  					alert(data.result);
  				});
  				*/
  				var phone = $("#regForm input[name='customer.phone']").val();
  				var pas = $("#regForm input[name='customer.password']").val();
  				
  				$.post("user/regist.action",$("#regForm").serialize()).done(function(data){
  					$("aside .step").attr("src","http://pic1.plateno.com/image2/login/registry_step2.jpg");
  					$("#regForm").hide();
  					$("#registRS").show();
  					
  					var customer = "customer.phone="+ phone + "&customer.password=" + pas;
  					$("#registRS a").click(function(){
  						clearInterval(timer);
  						//$.post("user/login.action",customer);
  						$("#loginForm input[name='customer.phone']").val(phone);
						$("#loginForm input[name='customer.password']").val(pas);
						$("#loginForm").submit();
  					});
  					var seconds = 5;
  					var timer = setInterval(function(){
  						if(--seconds==0){
  							clearInterval(timer);
  							$("#loginForm input[name='customer.phone']").val(phone);
  							$("#loginForm input[name='customer.password']").val(pas);
  							$("#loginForm").submit();
  						}else{
  							$("#registRS span").text(seconds);
  						}
  					},1000);	
 				});
  			});
  			
  			$(window).scroll(function(){
  				//console.log($(document).scrollTop());
  				if($(document).scrollTop()>40){
  					$("nav").css({
						"box-shadow":"0 3px 3px rgb(233,233,233)"
					});
  				}else{
  					$("nav").css("box-shadow","");
  				}
  			});
		});
	</script>
  </body>
</html>
