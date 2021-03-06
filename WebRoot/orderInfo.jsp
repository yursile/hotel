<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html xml:lang="zh-CN">
 <head>
 	<base href="<%=basePath%>">
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
	<link href="css/myOrder.css" rel="stylesheet">
		
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
    
	<div class="container" style="margin-top:100px;width:1000px" >
		<form id="filterOrderForm" action="order/checkOrderAction" method="post">
			<ul id="filterBox">
				<li>
					<label>订单号</label>
					<input type="text" class="ipt" name="orderId"/>
				</li>
				<li style="position:relative">
					<label>预订日期</label>
					<div class="dropdown_modal">
						<c:choose>
							<c:when test="${endTime==0}">
								<input type="text" class="ipt" placeholder="开始日期" id="start"/>
							</c:when>
							<c:otherwise>
								<input type="text" class="ipt" placeholder="开始日期" id="start" value="${startTime }"/>
							</c:otherwise>
						</c:choose>
						
						<div id="modal_arr" class="modal_bd">
	    					<div class="date-header">
		    					<a class="ico ico-pre fl" href="javascript:void(0)"></a>
		    					<a class="ico ico-next fr" href="javascript:void(0)"></a>
		    					<span class="date-title fl"></span>
		    					<span class="date-title fr"></span>
		    				</div>
		    				
		    				<div class="date-bd">
		    					<div class="date-bd-l">
		    						<table class="date-tb">
			    						<thead>
			    							<tr>
			    								<td class="weekend">日</td>
		    									<td>一</td>
		    									<td>二</td>
		    									<td>三</td>
		    									<td>四</td>
		    									<td>五</td>
		    									<td class="weekend">六</td>
			    							</tr>
			    						</thead>
		    							<tbody>
		    							</tbody>
		    						</table>
		    					</div>
		    					<div class="date-bd-r">
		    						<table class="date-tb">
			    						<thead>
			    							<tr>
			    								<td class="weekend">日</td>
		    									<td>一</td>
		    									<td>二</td>
		    									<td>三</td>
		    									<td>四</td>
		    									<td>五</td>
		    									<td class="weekend">六</td>
			    							</tr>
			    						</thead>
		    							<tbody>
		    							</tbody>
		    						</table>
		    					</div>
		    				</div>
	    				</div>
    				</div>
				</li>
				<li style="position:relative">
					<label>到</label>
					<div class="dropdown_modal">
					<c:choose>
						<c:when test="${endTime==0}">
							<input id ="end" type="text" class="ipt" placeholder="结束日期"/>
						</c:when>
						<c:otherwise>
							<input id ="end" type="text" class="ipt" placeholder="结束日期" value="${endTime }"/>
						</c:otherwise>
					</c:choose>
					
						<div id="modal_arr" class="modal_bd">
	    					<div class="date-header">
		    					<a class="ico ico-pre fl" href="javascript:void(0)"></a>
		    					<a class="ico ico-next fr" href="javascript:void(0)"></a>
		    					<span class="date-title fl"></span>
		    					<span class="date-title fr"></span>
		    				</div>
		    				
		    				<div class="date-bd">
		    					<div class="date-bd-l">
		    						<table class="date-tb">
			    						<thead>
			    							<tr>
			    								<td class="weekend">日</td>
		    									<td>一</td>
		    									<td>二</td>
		    									<td>三</td>
		    									<td>四</td>
		    									<td>五</td>
		    									<td class="weekend">六</td>
			    							</tr>
			    						</thead>
		    							<tbody>
		    							</tbody>
		    						</table>
		    					</div>
		    					<div class="date-bd-r">
		    						<table class="date-tb">
			    						<thead>
			    							<tr>
			    								<td class="weekend">日</td>
		    									<td>一</td>
		    									<td>二</td>
		    									<td>三</td>
		    									<td>四</td>
		    									<td>五</td>
		    									<td class="weekend">六</td>
			    							</tr>
			    						</thead>
		    							<tbody>
		    							</tbody>
		    						</table>
		    					</div>
		    				</div>
	    				</div>
	    			</div>
				</li>
				<li>
					<label>订单状态</label>
					<select class="ipt"style="width:85px" id="front-status">
						<c:choose>
							<c:when test="${orderStatus ==0||orderStatus==null}">
								<option selected="true">全部</option>
								<option>预订</option>
								<option>取消</option>
								<option>预订未到</option>
								<option>在住</option>
								<option>离店</option>
							</c:when>
							<c:when test="${orderStatus ==1}">
								<option >全部</option>
								<option selected="true">预订</option>
								<option>取消</option>
								<option>预订未到</option>
								<option>在住</option>
								<option>离店</option>
							</c:when>
							<c:when test="${orderStatus ==2}">
								<option >全部</option>
								<option >预订</option>
								<option selected="true">取消</option>
								<option>预订未到</option>
								<option>在住</option>
								<option>离店</option>
							</c:when>
							<c:when test="${orderStatus ==3}">
								<option >全部</option>
								<option >预订</option>
								<option >取消</option>
								<option selected="true">预订未到</option>
								<option>在住</option>
								<option>离店</option>
							</c:when>
							<c:when test="${orderStatus ==4}">
								<option >全部</option>
								<option >预订</option>
								<option >取消</option>
								<option >预订未到</option>
								<option selected="true">在住</option>
								<option>离店</option>
							</c:when>
							<c:when test="${orderStatus ==5}">
								<option >全部</option>
								<option >预订</option>
								<option>取消</option>
								<option>预订未到</option>
								<option>在住</option>
								<option selected="true">离店</option>
							</c:when>
						</c:choose>
					</select>
				</li>
				<li><input type="button" value="查询" class="search-btn" id="searchSub"/></li>
				<li style="display:none">
					<input type="text" id="orderStatus" name="orderStatus"/>
					<input type="text" id="startTime" name="startTime"/>
					<input type="text" id="endTime" name="endTime"/>
				</li>
			</ul>
		</form>
		
		
		<nav ><h1 class="titleName">订单详情</h1></nav>
		
		<c:forEach items="${orders}" var="order" end="0">
		<div class="orderInfo-box">
			<div class="order-title">
				<div class="order-title-item">
					<ul>
						<li class="order-detail-item">
							<label id="orderId">订单号：${order.id}</label>
						</li>
						<li class="order-detail-item">
							<label>预订日期：${order.generateTime}</label>
						</li>
						<li class="order-detail-item">
							<label>预订方式： 网站 </label>
						</li>
						
					</ul>
				</div>
				<div class="order-title-item" id="orderStatusChange">
					<c:choose>
						<c:when test="${order.status==1}">
							<label class="blue">房间保留至 ${order.generateTime} 21:00</label>
						</c:when>
						<c:when test="${order.status==2 }">
							<label class="blue">房间已取消预订</label>
						</c:when>
						<c:when test="${order.status==3 }">
							<label class="blue">预订未到</label>
						</c:when>
						<c:when test="${order.status==4 }">
							<label class="blue">正在入住，祝您愉快</label>
						</c:when>
						<c:otherwise>
							<label class="blue">已于${order.departureDate}离店</label>
						</c:otherwise>
					</c:choose>
					
					<table>
						<tbody>
						<c:choose>
							<c:when test="${order.status==1}">
								<tr>
									<td class="order-info-icon order-status-active"></td>
									<td class="order-info-icon"></td>
									<td class="order-info-icon"></td>
								</tr>
								<tr>
									<td class="order-status">1.新订</td>
									<td>2.在住</td>
									<td>3.离店</td>
								</tr>
							</c:when>
							
							<c:when test="${order.status==2}">
								<tr>
									<td class="order-info-icon"></td>
									<td class="order-info-icon order-status-active"></td>
								</tr>
								<tr>
									<td >1.新订</td>
									<td class="order-status">2.取消</td>
								</tr>
							</c:when>
							
							<c:when test="${order.status==4 }">
								<tr>
									<td class="order-info-icon "></td>
									<td class="order-info-icon order-status-active"></td>
									<td class="order-info-icon"></td>
									<td class="order-info-icon"></td>
								</tr>
								<tr>
									<td >1.新订</td>
									<td class="order-status">2.在住</td>
									<td>3.离店</td>
								</tr>
							</c:when>
							
							<c:when test="${order.status==5 }">
								<tr>
								<td class="order-info-icon"></td>
								<td class="order-info-icon "></td>
								<td class="order-info-icon order-status-active"></td>
							</tr>
							<tr>
								<td >1.新订</td>
								<td class="order-status">2.在住</td>
								<td >3.离店</td>
							</tr>
							</c:when>
							
						</c:choose>
							
						</tbody>
					</table>
				</div>
				<div class="order-title-item">
					<label class="totalPrice">总金额  RMB  ${order.price } </label>
				</div>
			</div>
			
			<div class="order-info">
				<div class="roomInfo">
					<h3 class="infoName">房间信息</h3>
					<div class="roomInfo-top">
						<ul>
							<li class="hotelName"><a href="javascript:void(0)" data-hotelId="${order.room.hotel.id}">${order.room.hotel.name }</a></li>
							<li class="hotelAdress"><address>${order.room.hotel.address }</address></li>
						</ul>
					</div>
					<div class="roomInfo-bottom">
					<!-- 
						<ul>
							<li class="order-info-item">入住日期：2015-05-02</li>
							<li class="order-info-item">离店日期：2015-05-03</li>
							<li class="order-info-item">保留时效：2015-5-2 21:00</li>
							<li class="order-info-item">房型： 自主大床房</li>
							<li class="order-info-item">早餐：无</li>
							<li class="order-info-item">酒店礼物：无</li>
						</ul>
					 -->
					 
					 <ul>
							<li class="order-info-item">入住日期：${order.arriveDate }</li>
							<li class="order-info-item">离店日期：${order.departureDate }</li>
							<li class="order-info-item">保留时效：${order.generateTime }</li>
							<li class="order-info-item">房型： ${order.room.type }</li>
							<li class="order-info-item">早餐：无</li>
							<li class="order-info-item">酒店礼物：无</li>
						</ul>
					</div>
				</div>
				<div class="customerInfo">
					<h3>联系人信息</h3>
					<div>
						<ul>
							<li class="order-info-item">联系人姓名：${order.customer.name}</li>
							<li class="order-info-item">手机号码：${order.customer.phone}</li>
							<li class="order-info-item" id="customerNameNow">入住人：${order.customerName}</li>
							<li class="order-info-item" id="customerPhoneNow">入住人电话：${order.customerPhone}</li>
						</ul>
					</div>
				</div>
				
				<div class="editDiv">
					<a href="javascript:void(0)" id="cancelOrder">取消订单</a>
					<a href="javascript:void(0)" id="editOrder">修改预订内容</a>
				</div>
			</div>
			
		</div>
		</c:forEach>
		
		
		<span>${order.id}</span>
	</div>
	<div class="modal fade" id="editOrderDiv" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:400px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title">修改订单</h4>
                </div>
                <div class="modal-body">
	                <form method="post" action="order/editOrder" name="editOrderForm" id="editOrderForm">
	                	<ul >
	                		<li class="editOrderLi">
	                			<label  class="editOrderLabel" for="customerName">入住人</label>
	                   			<input  id="customerName" class="form-control editOrderIpt" required autofocus name="customerName">
	                		</li>
	                		<li class="editOrderLi">
	                			 <label class="editOrderLabel" for="customerPhone" >联系电话</label>
	                   			 <input type="text" id="customerPhone" class="form-control editOrderIpt" required name="customerPhone">
	                		</li>
	                		<li class="editOrderLi">
	                			<button id="confirmEdit" class="btn  btn-primary " type="button" >确定</button>
	                  			<button id="cancelEdit" class="btn  btn-primary " type="button">取消</button>
	                		</li>
	                		<li style="display:none">
	                			<input type="text" name="orderId" id="editOrderId" />
	                		</li>
	                	</ul>
	                   </form>
                </div>
            </div>
        </div>
      </div>
        
        <div class="modal fade" id="cancelOrderDiv" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	        <div class="modal-dialog" style="width:400px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal">
	                        <span aria-hidden="true">&times;</span>
	                        <span class="sr-only">Close</span>
	                    </button>
	                    <h4 class="modal-title">确定取消吗？</h4>
	                </div>
	                <div class="modal-body">
	          			<button id="confirmCancel" class="btn  btn-primary " type="button" >确定</button>
	            		<button id="cancelCancel" class="btn  btn-primary " type="button">取消</button>
	               </div>
	            </div>
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
	<script type="text/javascript">
	
	var d = new Date();
	var year = d.getFullYear();
	var month = d.getMonth();
  	$(".date-bd").delegate("a","click",function(e){
  		var date = "";
  		if($(this).parents(".date-bd-l")[0]){
  			date = $(this).parents(".date-bd").siblings(".date-header").find(".date-title.fl").text();
  		}else{
  			date = $(this).parents(".date-bd").siblings(".date-header").find(".date-title.fr").text();
  		}
  		var year = date.substring(0,date.indexOf("年"));
		var month = date.substring(date.indexOf("年")+1,date.indexOf("月"));
		var day = $(e.target).text();
 		$(this).parents(".dropdown_modal").children("input").val(year+"/"+month+"/"+day);
 		
 		
 		var formatMonth = (month.length==2)?month:"0"+month;
 		var formatDay = (day.length==2)?day:"0"+day;
 		
 		//格式化提交到后台的数据
 		if($(e.target).parents(".modal_bd").prev().attr("id")=="start"){
 			$("#startTime").val(year+formatMonth+formatDay);
 		}else{
 			$("#endTime").val(year+formatMonth+formatDay);
 		}
  	});
  	
  	$(".ico-pre").click(function(e){
  		e.stopPropagation();
  		month--;
  		$(this).siblings(".date-title.fl").text(year+"年"+(month+1)+"月");
  		$(this).siblings(".date-title.fr").text(year+"年"+(month+2)+"月");
  		createCalendar(".date-bd-l tbody",year,month+1);
		createCalendar(".date-bd-r tbody",year,month+2);
  	});
  	
  	
  	$(".ico-next").click(function(e){
  		e.stopPropagation();
  		month++;
  		$(this).siblings(".date-title.fl").text(year+"年"+(month+1)+"月");
  		$(this).siblings(".date-title.fr").text(year+"年"+(month+2)+"月");
  		createCalendar(".date-bd-l tbody",year,month+1);
		createCalendar(".date-bd-r tbody",year,month+2);
  	});
  	
  	
  	$("#start").click(function(){
  		
		$(".date-title.fl").text(year+"年"+(month+1)+"月");
		$(".date-title.fr").text(year+"年"+(month+2)+"月");
		createCalendar(".date-bd-l tbody",year,month+1);
		createCalendar(".date-bd-r tbody",year,month+2);
		
		
		//$("#start").val();
  	});
  	
  	$("#end").click(function(){
  		
		$(".date-title.fl").text(year+"年"+(month+1)+"月");
		$(".date-title.fr").text(year+"年"+(month+2)+"月");
		createCalendar(".date-bd-l tbody",year,month+1);
		createCalendar(".date-bd-r tbody",year,month+2);
  	});
  	
  	function createCalendar(target,year,month){
   			var weekday = new Date(year,month-1,1).getDay();//当前月第一天
			var days = new Date(year,month,0).getDate();//当前月天数
   			var str = "";
   			var j = 0;
	  		for(var i=1;i<43;i++){
	  			if(i==1){
	  				str+='<tr>';
	  			}else if((i)%7==1){
	  				str+='</tr><tr>';
	  			}
	  			if(j<days&&i>weekday){
	  				str+='<td><a href="javascript:void(0)">' + (j+1) + '</a></td>';
	  				j++;
	  			}else{
	  				str+='<td></td>';
	  			}
	  		}
	  		str+='</tr>';
	  		$(target).html(str);
   		}
   		
   		$(".dropdown_modal").delegate("input","click",function(e){
   			$(".modal_bd").hide();
   			e.stopPropagation();
   			var target = $(this).next();
   		
			target.show();
			$("body").on("click",function(){
				target.hide();
				$("body").off("click",arguments.callee);
			});
   		});
   		
   		
   		
   		
   		$("#searchSub").click(function(){
   			var status = $("#front-status").val();
   			var backStatus = 0;
   			switch(status){
   				case "全部":backStatus = 0;break;
   				case "预订":backStatus = 1;break;
   				case "取消":backStatus = 2;break;
   				case "预订未到":backStatus = 3;break;
   				case "在住":backStatus = 4;break;
   				case "离店":backStatus = 5;break;
   			}
   			$("#orderStatus").val(backStatus);
   			$("#filterOrderForm").submit();
   		});
   		
   		$(".hotelName").click(function(){
   			var hotelId = $(this).find("a").attr("data-hotelId");
   			document.location.href = "hotel/hotelInfoAction?hotelId="+hotelId;
   		});
   		
   		$("#checkOrder").click(function(){
    		document.location.href="order/checkOrderAction";
    	});
    	
    	$("#info").click(function(){
    		document.location.href="toInfoAction";
    	});
    	
    	var orderId = $("#orderId").text().substring(4).trim();
    	
    	//取消订单
    	$("#cancelOrder").click(function(){
    		//document.location.href="order/cancelOrderAction?orderId="+;
    		$("#cancelOrderDiv").addClass("in").css({
				"display":" block",
				"padding-right": "17px",
				"text-align":"center"
			});
			
			$("#cancelCancel").click(function(){
	    		$("#cancelOrderDiv").removeClass("in").css({
					"display":"none",
					"padding-right": "0"
				});
	    	});
	    	
	    	$("#confirmCancel").click(function(){
	    		$.get("order/cancelOrderAction",{"orderId":orderId},function(data){
	    			var result = data.result;
					var html = $("#cancelOrderDiv .modal-content").html();
					$("#cancelOrderDiv .modal-content").html(result);
					
					if(result=="已取消"){
						var order = data.orders[0];
						$("#orderStatusChange label").text("房间已取消预订");
						$("#orderStatusChange table tr:first-child").replaceWith(function(){
							var tds = '<tr><td class="order-info-icon"></td><td class="order-info-icon order-status-active"></td></tr>';
							return tds;
						});
						
						$("#orderStatusChange table tr:last-child").replaceWith(function(){
							var tds = '<tr><td >1.新订</td><td class=" order-status">2.离店</td></tr>';
							return tds;
						});
					}
					setTimeout(function(){
						$("#cancelOrderDiv").removeClass("in").css({
							"display":"none",
							"padding-right": "0"
						});
						$("#cancelOrderDiv .modal-content").html(html);
					},2000);
	    		});
	    	});
    	});
    	
    	
    	
    	$("#editOrder").click(function(){
    		$("#editOrderDiv").addClass("in").css({
				"display":" block",
				"padding-right": "17px",
				"text-align":"center"
			});
			
			$("#cancelEdit").click(function(){
	    		$("#editOrderDiv").removeClass("in").css({
					"display":"none",
					"padding-right": "0"
				});
	    	});
	    	
			
			
			$("#confirmEdit").click(function(){
				$("#editOrderId").val(orderId);
				$.post("order/editOrderAction",$("#editOrderForm").serialize(),function(data){
					var result = data.result;
					var html = $("#editOrderDiv .modal-content").html();
					$("#editOrderDiv .modal-content").html(result);
					
					if(result=="修改成功"){
						var order = data.orders[0];
						$("#customerNameNow").text("入住人："+order.customerName);
						$("#customerPhoneNow").text("入住人电话："+order.customerPhone);
					}
					setTimeout(function(){
						$("#editOrderDiv").removeClass("in").css({
							"display":"none",
							"padding-right": "0"
						});
						$("#editOrderDiv .modal-content").html(html);
					},2000);
				});
			});
    	});
	</script>
	<script src="js/ajax_log.js"></script>
 </body>
</html>
