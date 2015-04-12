<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html xml:lang="zh-CN">
 <head>
 	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>个人中心—个人中心—铂涛会</title>
 		  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="bootstrap/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="bootstrap/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/carousel.css" rel="stylesheet">
    <style>
    	.info_tb tr th{
    		background:rgb(242,242,242);
    		border-bottom:1px solid #d1d1d1;
    		border-right:1px solid #d1d1d1;
    		text-align:right;
    		width:180px;
    	}
    	.info_tb thead th{
    		text-align:left;
    	}
    	
    	.info_tb tr td{
    		border-bottom:1px solid #d1d1d1;
    		text-indent:2em;
    	}
    	.info_tb{
    		width:914px;
    		border: 1px solid #d1d1d1;
   		 	color: #000;
		    font-family: arial,"Hiragino Sans GB","Microsoft Yahei",sans-serif;
		    font-size: 12px;
		    line-height: 20px;
   		 }
   		.info_tb tr{
   		 	height:35px;
   		 }
   		 .wrap{
   		 	width:100%;padding:30px;
   		 	background:rgb(255,254,248);
   		 	border:2px rgb(249,225,185) solid;
   		 }
   		 
   		 .change-btn{
   		 	background:rgb(231,231,231);
   		 	color:#000;
   		 	border-radius:4px;
   		 	padding:5px 10px;
   		 	margin-left:20px;
   		 }
   		 .change-btn:hover{
			cursor: pointer;
			text-decoration:none;
			color:#000;
		}
		.pas-tb{
			margin:0 auto;
			margin-top:5px;
		}
		.pas-tb tbody{
			display:none;
		}
		.resetpas:hover{
			cursor: pointer;
			text-decoration:none;
			color:#000;
		}
		.changePhone_tb th{
			width:100px;
			text-align:right;
			
		}
		.changePhone_tb input{
			margin-left:20px;
		}
		
    </style>
</head>
 <body>
 <div class="navbar-wrapper" style="margin:10px;">
      <div class="container">

          <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse" style="float: left">
            <ul class="nav navbar-nav">
              <li><a href="#">首页</a></li>
                <li><a href="#about">预订</a></li>
                <li><a href="#about">企业差旅</a></li>
                <li><a href="#contact">关于yursile</a></li>
            </ul>
           
          </div><!--/.nav-collapse -->
          
           <div class="navbar-collapse collapse" style="float: right">
              <ul class="nav navbar-nav">
                  <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">我的yursile <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">订单查询</a></li>
                    <li ><a href="info.jsp">个人资料</a></li>
                  </ul>
                 </li>
                 <li id="logexit"><a data-toggle="modal" href="#loginForm">
                 	<c:choose>
                 		<c:when test="${sessionScope.loginCustomer.name!=null}">退出</c:when>
                 		<c:otherwise>登录</c:otherwise>
                 	</c:choose>
                 	
                 </a></li>
                 <li><a href="regist.jsp">注册</a></li>
              </ul>
            </div>
          
        </div><!--/.container-fluid -->
      </nav>

      </div>
    </div><!-- nav结束 -->
    
	<div class="container" style="margin-top:100px">
		<div class="wrap">
			<h1 style="font-size:12px">个人信息</h1>
			<table style="margin:0 auto" class="info_tb">
				<thead>
					<tr>
						<th colspan="100%">尊敬的会员,以下是您的注册资料</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th >用户名</th>
						<td >杨灿</td>
					</tr>
					<tr>
						<th>证件号码</th>
						<td>身份证     5****************7</td>
					</tr>
					<tr>
						<th>生日</th>
						<td>1992/10/19</td>
					</tr>
					<tr>
						<th>手机号码</th>
						<td>185****8939<a class="change-btn"  data-toggle="modal" href="#changePhoneForm">修改手机</a></td>
					</tr>
				</tbody>
			</table>
			
			<div class="modal fade" id="changePhoneForm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		        <div class="modal-dialog" style="width:400px">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <button type="button" class="close" data-dismiss="modal">
		                        <span aria-hidden="true">&times;</span>
		                        <span class="sr-only">Close</span>
		                    </button>
		                    <h4 class="modal-title">修改手机</h4>
		                </div>
		                <div class="modal-body">
		                <span>修改手机号需先验证旧手机号码：请点击“获取验证码”，验证码将发送至您的旧手机号码，填写验证码后点击“下一步”，进入新手机验证。</span>
		                <form method="get" action="user/login" name="loginForm" id="loginForm">
		               		<table class="changePhone_tb">
		               			<tbody>
		               				<tr>
		               					<th colspan="70px">  <label  for="userName" >原号码</label></th>
		               					<td>  <input  id="userName" class="form-control" style="display:inline-block;width:210px"placeholder="原手机号码" required autofocus name="customer.phone"></td>
		               				</tr>
		               				<tr>
		               					<th colspan="70px"><label  for="inputPassword">新号码</label></th>
		               					<td> <input type="password" id="inputPassword" style="display:inline-block;width:210px" class="form-control" placeholder="密码" required name="customer.password"></td>
		               				</tr>
		               				<tr>
		               					<th colspan="70px"><label  for="code">验证码</label></th>
		               					<td> <input type="password" id="code" class="form-control" style="width:90px;display:inline-block" placeholder="验证码码" required name="customer.password"> <a class="change-btn">获取验证码</a></td>
		               					
		               				</tr>
		               			</tbody>
		               		</table>
		                 
		                  
		                   
		                  
		                   
		                  
		                   <button id="ajaxLogin" class="btn btn-lg btn-primary btn-block" style="margin-top:10px" type="button">修改</button>
		                    </form>
		                </div>
		                
		            </div>
		        </div>
		    </div>
			
			
			<form action="user_changepassword.action">
				<table class="pas-tb info_tb">
					<thead><tr><th colspan="100%"><a class="resetpas">重置密码</a></th></tr></thead>
					<tbody>
						<tr>
							<th >原始密码</th>
							<td ><input type="text" name="oldpass"/></td>
						</tr>
						<tr>
							<th>新密码</th>
							<td><input type="text" name="newpass"/></td>
						</tr>
						<tr>
							<th>确认新密码</th>
							<td><input type="text"/></td>
						</tr>
						<tr>
							<td colspan="100%" style="text-align:center"><a class="change-btn">提交</a></td>
						</tr>
						
					</tbody>
				</table>
			</form>
			
		</div>
	</div>

	 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>
    <script src="jquery-ui.min.js"></script>
	<script>
		$(".resetpas").click(function(){
			$(".pas-tb tbody").toggle();
		});
	</script>
 </body>
</html>
