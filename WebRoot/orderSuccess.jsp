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

    <title>Carousel Template for Bootstrap</title>

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
    
   	<style type="text/css">
   		.center{
   			width:750px;height:480px;
   			padding-top:80px;
   			margin:0 auto;
   			background:url(pic/order-success-back.png);
   			text-align:center;
   			box-sizing:content-box;
   		}
   		
   		.orderSuccess{
	   		border-bottom: thin dashed #cbc6c1;
		    color: #92ce2a;
		    font-size: 30px;
		    font-weight: bolder;
		   
		    line-height: 40px;
		    margin-left: auto;
		    margin-right: auto;
		    margin-top: 15px;
		    padding-bottom: 20px;
		    width: 530px;
	    }
	    
	    .orderSuccess figcaption{
	    	display:inline-block;
	    }
	    
	    .successTime{
	    	 color: #ff9222;
		    line-height: 20px;
		    margin: 0 20px;
	    }
	    
	    .success-btn{
	    	background: url("http://pic1.plateno.com/image2/member/order/botton_icon.png") repeat scroll -36px -389px rgba(0, 0, 0, 0);
		    border-radius: 2px;
		    color: #ad8860;
		    margin-right: 20px;
		    padding: 11px 25px;
		    font-size: 16px;
    line-height: 30px;
    text-align: center;
		    
	    }
	    a:hover,a:focus{
	    	text-decoration:none;
	    	
	    }
	    
	    .control{
	    	padding-top:30px;
	    	height:180px;
	    }
	    
	    .tips{
	    	border: thin solid #ccc;
   			 border-radius: 10px;
   			 width:600px;margin:0 auto;
	    }
   	</style>
  </head>
<!-- NAVBAR
================================================== -->
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
              <li><a href="index.jsp">首页</a></li>
                <li ><a href="hotel/toOrderAction.action">预订</a></li>
                <li><a href="#about">企业差旅</a></li>
                <li><a href="#contact">关于yursile</a></li>
            </ul>
           
          </div><!--/.nav-collapse -->
          
           <div class="navbar-collapse collapse" style="float: right">
              <ul class="nav navbar-nav">
                  <li class="dropdown active">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">我的yursile <span class="caret"></span></a>
                 <ul class="dropdown-menu" style="min-width:160px;font-size: 14px;" role="menu">
                    <li style="display:block"><a style="padding:3px 20px" id="checkOrder" href="javascript:void(0)">订单查询</a></li>
                    <li style="display:block"><a style="padding:3px 20px" id="info" href="javascript:void(0)">个人资料</a></li>
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
    </div><!-- nav结束 -->
    
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
    
    
    <div class="container" style="margin-top:100px;">
    	<div class="center">
    	
	    	<h2 class="hotelName">7天连锁酒店 （${hotelName}）</h2>
	    	
	    	<c:forEach items="${dayList}" var="day">
	    			<time class="successTime">${day}</time>
	    	</c:forEach>
	    	<figure class="orderSuccess">
	    		<img src="pic/order-success.png" alt="预订成功"/>
	    		<figcaption>预订成功！</figcaption>
	    	</figure>
	    	
	    	<div class="control">
	    		<p style="margin-bottom:20px;">铂涛会提供储值、抵用券、信用卡、微信支付等多种在线支付方式。</p>
	    		<a class="success-btn" href="javascript:void(0)" id="checkOrder2">查看订单</a>
	    		<a class="success-btn" href="javascript:void(0)" id="returnMain">返回首页</a>
	    	</div>
    		
    		<p class="tips">
    			根据目前国家公安条例的严格规定，所有进入酒店的住客和访客均需携带身份证到前台登记，如不能提供有效身份证明，我们酒店将无法办理入住，非常感谢您的配合！ 
    		</p>
    	</div>
    </div>
    
   
   
  </body>
  
   <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>
    <script src="jquery-ui.min.js"></script>
  
  	 <script src="js/ajax_log.js"></script>
  	 <script type="text/javascript">
  	 	$("#checkOrder2").click(function(){
			alert("ddd");
			document.location.href="order/checkOrderAction";
		});
		
		$("#returnMain").click(function(){
			document.location.href="/index.jsp";
		});
  	 </script>
</html>
