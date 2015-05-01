<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	 <!-- Bootstrap core CSS -->
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
		.logBtn{
			background: none repeat scroll 0 0 #ff454d;
		    border: 1px solid #ff0f38;
		    border-radius: 3px;
		    color: #fff;
		    height: 36px;
		    line-height: 36px;
		    margin-top: 22px;
		    width: 278px;
		    display:inline-block;
		    font-size: 14px;
		    margin-left:86px;
		}
		.regBtn{
			background: -moz-linear-gradient(center top , #fff 0px, #f7f7f7 100%) repeat scroll 0 0 rgba(0, 0, 0, 0);
		    border: 1px solid #ccc;
		    border-radius: 3px;
		    color: #ff434f;
		    height: 34px;
		    line-height: 34px;
		    margin-top: 17px;
		    width: 278px;
		    display:inline-block;
		    font-size: 14px;
		    margin-left:86px;
		}
		.logBtn:hover{
			color: #fff;
			text-decoration:none;
		}
		.regBtn:hover{
			color: #ff434f;
			text-decoration:none;
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
            
          </div>
          <div id="navbar" class="navbar-collapse collapse" style="float: left">
            <ul class="nav navbar-nav">
              <li ><a href="index.jsp">首页</a></li>
                <li class="active"><a  href="hotel/toOrderAction.action">预订</a></li>
                <li><a href="#about">企业差旅</a></li>
                <li><a href="#contact">关于yursile</a></li>
            </ul>
           
          </div><!--/.nav-collapse -->
          
            <div class="navbar-collapse collapse" style="float: right">
              <ul class="nav navbar-nav">
                  <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">我的yursile <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a id="checkOrder" href="javascript:void(0)">订单查询</a></li>
                    <li><a id="info" href="javascript:void(0)">个人资料</a></li>
                  </ul>
                 </li>
	             
	             <c:choose>
               		<c:when test="${sessionScope.loginCustomer.name!=null}">
               			<li id="log" style="display:none"><a data-toggle="modal" href="#logDiv">登录</a></li>
               			<li id="exit" ><a data-toggle="modal" href="#exitDiv">退出</a></li>
               		</c:when>
               		<c:otherwise>
               			<li id="log" ><a data-toggle="modal" href="#logDiv">登录</a></li>
               			<li id="exit" style="display:none"><a data-toggle="modal" href="#exitDiv">退出</a></li>
               		</c:otherwise>
               	</c:choose>
	            
                 <li><a href="regist.jsp">注册</a></li>
              </ul>
            </div>
          
        </div><!--/.container-fluid -->
      </nav>

      </div>
    </div>
    
    <div class="modal fade" id="logDiv" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:400px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title">登录</h4>
                </div>
                <div class="modal-body">
	                <form method="get" action="user/login" name="loginForm" id="loginForm">
	                   <label class="sr-only" for="userName" >用户名</label>
	                   <input  id="userName" class="form-control" placeholder="用户名/手机号码" required autofocus name="customer.phone">
	                   <label class="sr-only" for="inputPassword">密码</label>
	                   <input type="password" id="inputPassword" class="form-control" placeholder="密码" required name="customer.password">
	                   <div class="checkbox" style="text-align:center;overflow:hidden">
	                      <label style="float:left;" >
	                        <input type="checkbox" value="remember-me"> 记住我
	                      </label>
	                      <span style="margin:0 10px;color:#f60"></span>
	                   </div>
	                   <button id="ajaxLogin" class="btn  btn-primary btn-block" type="button">登录</button>
	                   </form>
                </div>
                
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="exitDiv" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:400px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="exitDivClose" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                </div>
                <div class="modal-body">
                	确认退出？
                </div>
                <div class="modal-footer">
		            <button type="button" class="btn btn-default" id="confirm">确定</button>
		            <button type="button" class="btn btn-primary" id="cancle">取消</button>
		         </div>
            </div>
        </div>
    </div>
	
	<div class="container" style="width:1000px;margin-top:70px;">
		<h1 class="htmlTitle">登录</h1>
		<img src="pic/bg-img.jpg" class="bg-img" width="536px" height="410px">
		<aside>
			<div class="tittle">
				<h3 class="regTittle">这一刻，遇见全新yursile</h3>
			</div>
			
			<img class="step" alt="" src="http://pic1.plateno.com/image2/login/registry_step1.jpg" src2="http://pic1.plateno.com/image2/login/registry_step2.jpg">
			<form id="logForm" action="user/login.action" method="post">
				<ul>
					<li class="item">
						<label>手机号码</label><input class="text" type="text" name="customer.phone" />
						<span for="mobilePhone" class="error hidden">请输入您的手机号码</span>
					</li>
					<li class="item">
						<label>密码</label><input class="text" type="password" name="customer.password"  id="password"/>
						<span for="mobilePhone" class="error hidden">请输入您的密码</span>
					</li>
					
					<li class="item">
						<label>验证码</label><input class="text" type="text" name="code" />
						<span for="mobilePhone" class="error hidden">请输入验证码</span>
					</li>
					<li>
						<a class="logBtn" href="javascript:void(0)" id="logBtn">立即登录</a>
					</li>
					<li>
						<a class="regBtn" href="javascript:void(0)" id="regBtn">注册新用户</a>
					</li>
				</ul>
			</form>
			
			<div id="registRS">
				<h4>恭喜您，注册成功</h4>
				<span></span>秒钟之后自动登录
				<a href="javascript:void(0);">立即登录</a>
			</div>
		</aside>
	</div>
	
	<div class="modal fade" id="errorInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-body">
	         	<h4 ></h4>
	         </div>
	      </div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	 <script src="jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>
    <script src="jquery-ui.min.js"></script>
	<script	type="text/javascript">
		$("#logForm").delegate(".item input","blur",function(){
			var val = $(this).val();
			if(val.trim()==""){
				$(this).next().removeClass("hidden");
				$(this).next().addClass("show");
			}else{
				$(this).next().removeClass("show");
				$(this).next().addClass("hidden");
			}
		});
	
		$("#logBtn").click(function(){
			$("#logForm").submit();
		});
		
		$("#regBtn").click(function(){
			document.location.href="regist.jsp";
		});
	</script>
  </body>
</html>
