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
    
   	<link href="css/hotelInfo.css" rel="stylesheet">
  </head>
<!-- NAVBAR
================================================== -->
  <body>
    <div class="navbar-wrapper" style="margin:10px;">
      <div class="container" style="width:1160px">

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
                 <li class="active"><a href="hotel/toOrderAction.action">预订</a></li>
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
    
    
    <div class="wrapper">
	    <div class="container" style="margin-top:60px">
	    	<h1>${hotel.name}</h1>
	    	
	    	<div class="roomtype-box">
	    		<ul class="roomtype-ul">
	    			
	    			<c:forEach items="${hotel.rooms}" var="room">
	    				<c:choose> 
		    				<c:when test="${roomType==room.type}">
		    					<li class="roomtype-selected">
		    						<a href="javascript:void(0)">${room.type}</a>
		    						<span class="roomId">${room.id}</span>
		    						<span class="roomPrice">${room.price}</span>
		    					</li>
		    				</c:when> 
		    				<c:otherwise>
		    					<li>
		    						<a href="javascript:void(0)" >${room.type}</a>
		    						<span class="roomId">${room.id}</span>
		    						<span class="roomPrice">${room.price}</span>
		    					</li>
		    				</c:otherwise>
		    			</c:choose>
	    			</c:forEach>
	    		</ul>
	
				<div class="orderInfo">
					<h3>预订信息</h3>
					<form id="hotel-orderForm" action="order/orderAction">
					<ul>
						<c:choose>
						<c:when test="${sessionScope.loginCustomer!=null}">
							<li>
								<label >姓名</label>
								<input type="text" value="${sessionScope.loginCustomer.name }" />
							</li>
							<li>
								<label>手机号码</label>
								<input type="text" value="${sessionScope.loginCustomer.phone }" />
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<label >姓名</label>
								<input type="text" placeholder="请输入姓名" />
							</li>
							<li>
								<label>手机号码</label>
								<input type="text" placeholder="请输入手机" />
							</li>
						</c:otherwise>
						</c:choose>
					
						<li>
							<label>房型 </label>
							<input type="text" value="${roomType}" class="hidden-outline"/>
						</li>
						<li>
							<label>预订天数</label>
							<input type="text" id="date-num" class="hidden-outline"/>
						</li>
						<li>
							<label>数量</label>
							<select id="num">
								<option>1间</option>
								<option>2间</option>
								<option>3间</option>
							</select>
						</li>
						
						<li style="position:relative;">
							<label>支付</label>
							<input value="" class="hidden-outline hl" id="price"/>
							<span class="error" id="dateError">请选择日期</span>
							<span class="error" id="typeError">请选择房间</span>
						</li>
						<li style="text-align:center">
							<a href="javascript:void(0)" id="submit-order"></a>
						</li>
						
						<li class="hidden">
							<input type="text" id="hotelId" name="hotelId" value="${hotel.id}"/>
							<input type="text" id="roomId" name="roomId" />
							<input type="text" id="days" name="days" />
							<input type="text" id="back-num" name="num"/>
						</li>
						
					</ul>
					</form>
				</div>
				    		
	    		<div class="center-box">
	   				<ul class="banner">
	   					<li class="month-active"><a href="javascript:void(0)"></a></li>
	   					<li><a href="javascript:void(0)"></a></li>
	   					<li><a href="javascript:void(0)"></a></li>
	   					<li><a href="javascript:void(0)"></a></li>
	   				</ul>
	   				
	    			<table class="date-roomtype">
		    			<thead>
		    				<tr class="weeks-title">
		    					<td><a>星期日</a></td>
		    					<td><a>星期一</a></td>
		    					<td><a>星期二</a></td>
		    					<td><a>星期三</a></td>
		    					<td><a>星期四</a></td>
		    					<td><a>星期五</a></td>
		    					<td><a>星期六</a></td>
		    				</tr>
		    			</thead>
		    			<tbody>
		    			</tbody>
		    		</table>
	    		</div>
	    	</div>
    	</div>
    </div>
    
    <div class="container" style="margin-top:60px;">
    	<div class="hotelinfo-box">
    		<div class="box-left">
	    		<figure>
	    			<figcaption><h4 class="left-h">酒店图片</h4></figcaption>
	    			<c:forEach items="${hotel.pics}" var="pic" end="0">
    					<img src="${pic.path}"/>
    				</c:forEach>
	    		</figure>
	    		<div class="control-pic">
	    			<a href="javascript:void(0)" class="link-prev" title="上一页"></a>
	    			<a href="javascript:void(0)" class="link-next" title="下一页"></a>
	    			<div class="picroll-box">
	    			<ul class="pic-roll">
	    				<c:forEach items="${hotel.pics}" var="pic0" end="0">
	    					<img src="${pic0.path}"/>
	    				</c:forEach>
	    				
	    				<c:forEach items="${hotel.pics}" var="pic" begin="1">
	    					<li class="active"><img  src="${pic.path}"></li>
	    				</c:forEach>
	    				<!-- 
	    				<li class="active"><img  src="http://img1.plateno.com/inn/023040/e2d45cb45af35a3912563a99c973790e_120_120.jpg"></li><li><img  src="http://img1.plateno.com/inn/023040/5b54802ab4058d064a398b37f4b665f5_120_120.jpg"></li><li><img  src="http://img1.plateno.com/inn/023040/e2abb0a72aa00d4f9def423c49f6801b_120_120.jpg"></li><li><img  src="http://img1.plateno.com/inn/023040/e2d45cb45af35a3912563a99c973790e_120_120.jpg"></li><li><img src="http://img1.plateno.com/inn/023040/5b54802ab4058d064a398b37f4b665f5_120_120.jpg"></li><li><img class="" src="http://img1.plateno.com/inn/023040/e2abb0a72aa00d4f9def423c49f6801b_120_120.jpg"></li>
	    				 -->
	    			</ul>
	    			</div>
	    		</div>
	    		
	    		<p class="instruction">酒店位于重庆北碚区中心地段云泉路18号天生市场国美电器旁,距离西南大学仅仅500米。至轻轨6号线终点站北碚站不足150米。距离悦来会展中心约15分钟车程。步行2分钟即可到达天奇广场步行街，步行3分钟到达北碚区客运中心，在此可乘坐到重庆主城各区线路车、北碚旅游景区路线车和北碚周边路线车,紧邻朝阳中学、田家炳中学、</p>
	    		<p class="address">${hotel.address }</p>
	    		<p class="phone">${hotel.phone }</p>
    		</div>
    		
    		<div class="box-right">
    			<h4 class="right-h">地理位置</h4>
    			<div class="distance">
    				<span class="icon-distance"></span>
    				<ul class="info-distance">
    					<li>公交车站：5米</li>
    					<li>火车站：1.5公里 </li>
    					<li>飞机场：35公里</li>
    					<li>地铁站：150米 </li>
    				</ul>
    			</div>
    			<div class="distance">
    				<span class="icon-distance"></span>
    				<ul class="info-distance">
    					<li>公交车站：5米</li>
    					<li>火车站：1.5公里 </li>
    					<li>飞机场：35公里</li>
    					<li>地铁站：150米 </li>
    				</ul>
    			</div>
    		</div>
    	</div>
    	
    	<div class="comment">
    		<div class="comment-h">
    			<a href="javascript:void(0)" id="personalComment" title="我要点评">[我要点评]</a>
    			<h2>客户点评</h2>
    		</div>
    		
    		
    		<ul class="comment-ul">
    			<li class="comment-li comment-box">
    				<textarea class="commentIpt" id="commentIpt" placeholder="留下您一珍贵的记忆，或宝贵的意见"></textarea>
    				<button type="button" class="close" id="closeComment">
    					<span aria-hidden="true">×</span>
						<span class="sr-only">Close</span>
    				</button>
    				<button type="button" class="btn btn-default" id="commit" >确定</button>
    			</li>
    		
    		
    			<c:forEach items="#{comments}" var = "comment">
    				<li class="comment-li">
	    				<span class="comment-man">${comment.customer.name}</span>
	    				<div class="comment-content">
	    					<p class="comment-p">${comment.content}</p>
	    					<time class="comment-time">(${comment.time})</time>
	    				</div>
	    			</li>
    			</c:forEach>
    		
    			<li class="comment-li">
    				<span class="comment-man">银卡会员18*******75</span>
    				<div class="comment-content">
    					<p class="comment-p">网速可以更快些</p>
    					<time class="comment-time">(2015-4-5 11:37)</time>
    				</div>
    			</li>
    			<li>
    				<div class="page-box">
			    		<ul>
			    			<li>每页
			    				<select id="numPerPage">
			    					<option>5</option>
			    					<option>10</option>
			    					<option>20</option>
			    				</select>
			    				条
			    			</li>
			    			<li><a class="p_btn" href="javascript:void(0)">首页</a></li>
			    			<li><a class="p_btn" href="javascript:void(0)">上一页</a></li>
			    			<li><a class="jump_num active" href="javascript:void(0)">1</a></li>
			    			<li><a class="jump_num" href="javascript:void(0)">2</a></li>
			    			<li><a class="jump_num" href="javascript:void(0)">3</a></li>
			    			<li><a class="jump_num" href="javascript:void(0)">4</a></li>
			    			<li><a class="jump_num" href="javascript:void(0)">5</a></li>
			    			<li><a class="p_btn" href="javascript:void(0)">下一页</a></li>
			    			<li><a class="p_btn" href="javascript:void(0)">末页</a></li>
			    		</ul>
			    	</div>
    			</li>
    		</ul>
    	</div>
    </div>
    
    <div class="modal fade" id="commentResult" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-body">
	         	<h4></h4>
	         </div>
	      </div><!-- /.modal-content -->
		</div><!-- /.modal -->
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
   	<script src="js/hotelInfo.js"></script>
   
</html>
