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
    
   	<link href="css/order.css" rel="stylesheet">
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
    
    <div class="container">
    	<div id="search-box">
    		<form id="search-form">
    			<input type="text" name="city" value="重庆"/>
    			<div class="dropdown" style="display:inline-block">
    				<input type="text" name="district" placeholder="行政区域" id="dropdownMenu-district" data-toggle="dropdown"/>
    				 <span class="caret" style="margin-left:-20px;margin-right:13px"></span> 
	    			<ul class="dropdown-menu" aria-labelledby="dropdownMenu-district">
	    				<li><a href="javascript:void(0)">不限</a></li>
	    				
						<li><a href="javascript:void(0)">高新区</a></li>
						<li><a href="javascript:void(0)">江北区</a></li>
						<li><a href="javascript:void(0)">九龙坡区</a></li>
						<li><a href="javascript:void(0)">南岸区</a></li>
						<li><a href="javascript:void(0)">沙坪坝区</a></li>
						<li><a href="javascript:void(0)">渝中区</a></li>
						<li><a href="javascript:void(0)">高新区</a></li>
						<li><a href="javascript:void(0)">江北区</a></li>
						<li><a href="javascript:void(0)">九龙坡区</a></li>
						<li><a href="javascript:void(0)">南岸区</a></li>
						<li><a href="javascript:void(0)">沙坪坝区</a></li>
						<li><a href="javascript:void(0)">渝中区</a></li>
					</ul>
	    		</div>
    			
    			<div class="dropdown_modal">
    				<input id="dropdownMenu-arrive" type="text" name="arriveDate" placeholder="入住日期"/>
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
    			
    			<div class="dropdown_modal">
    				<input id="departureDate" type="text" name="departureDate" placeholder="退房日期"/>
    				<div id="modal_dep" class="modal_bd">
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
    			<input type="button" value="搜索" id="search-btn">
    		</form>
    	</div>
    	
    	<div class="hotels">
    		<ul>
    			<c:forEach items="${hotels}" var="hotel">  
				
    			<li>
    				<figure>
    				<!--  -->
    					<c:forEach items="${hotel.pics}" var="pic" end="0"> 
    						<img class="fig-img" src="${pic.path}"/>
    					</c:forEach>
    					
    					<a class="watchpic">查看相册</a>
    					<figcaption>
    						<h3><a class="fig-title" href="hotel/hotelInfoAction.action?hotelId=${hotel.id}">${hotel.name}</a></h3>
    						<address>${hotel.address}</address>
    						<p class="phone">${hotel.phone}</p>
    					</figcaption>
    				</figure>
	    				<table class="hotel-tb">
	    					<thead>
	    						<tr>
	    							<td>房型</td>
	    							<td>门市价</td>
	    							<td>普卡</td>
	    						</tr>
	    					</thead>
	    					<tbody>
	    						<c:forEach items="${hotel.rooms}" var="room">  
	    						<tr>
	    							<td>${room.type }</td>
	    							<td>￥${room.price }</td>
	    							<td>￥${room.price }</td>
	    							<td><a class="quickorder" href="hotel/hotelInfoAction.action?hotelId=${room.hotel.id}&roomType=${room.type}">预订</a></td>
	    						</tr>
	    						</c:forEach>
	    					</tbody>
	    				</table>
    			</li>
    			</c:forEach> 
    			<li>
    				<figure>
    					<img class="fig-img" src="http://img1.plateno.com/inn/023040/e2d45cb45af35a3912563a99c973790e_120_120.jpg"/>
    					<a class="watchpic">查看相册</a>
    					<figcaption>
    						<h3><a class="fig-title" href="#">7天重庆北碚轻轨总站西南大学店</a></h3>
    						<address>北碚区云泉路18号（天生市场国美电器旁 ）地铁北碚站2A出口直行</address>
    						<p class="phone">124u923334</p>
    					</figcaption>
    				</figure>
	    				<table class="hotel-tb">
	    					<thead>
	    						<tr>
	    							<td>房型</td>
	    							<td>门市价</td>
	    							<td>普卡</td>
	    						</tr>
	    					</thead>
	    					<tbody>
	    						<tr>
	    							<td>自主大床房</td>
	    							<td>￥163</td>
	    							<td>￥155</td>
	    							<td><a class="quickorder">预订</a></td>
	    						</tr>
	    						<tr>
	    							<td>自主大床房</td>
	    							<td>￥163</td>
	    							<td>￥155</td>
	    						</tr>
	    						<tr>
	    							<td>自主大床房</td>
	    							<td>￥163</td>
	    							<td>￥155</td>
	    						</tr>
	    					</tbody>
	    				</table>
    			</li>
    		</ul>
    	</div>
    	
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
    			<li>
    				<ul class="jump_box">
    					<li><a class="jump_num active" href="javascript:void(0)">1</a></li>
    					<li><a class="jump_num" href="javascript:void(0)">2</a></li>	
		    			<li><a class="jump_num" href="javascript:void(0)">3</a></li>
		    			<li><a class="jump_num" href="javascript:void(0)">4</a></li>
		    			<li><a class="jump_num" href="javascript:void(0)">5</a></li>
    				</ul>
    			</li>
    		
    			<li><a class="p_btn" href="javascript:void(0)">下一页</a></li>
    			<li><a class="p_btn" href="javascript:void(0)">末页</a></li>
    			<li>共<span id="totalNum">30</span>页</li>
    		</ul>
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
  <script>
	var d = new Date();
	var year = d.getFullYear();
	var month = d.getMonth();
	var datas=[];//已下载的房间信息
	
	
	//初始化datas
	(function(){
		//返回hotels数组 hotel:img name href address phone rooms room.name room.price
		var l = $(".hotels>ul>li").length;
		$.each($(".hotels>ul>li"),function(i,list){
			var img = $(list).find("img").attr("src");
			var name = $(list).find("h3>a").text();
			var href = $(list).find("h3>a").attr("href");
			var address = $(list).find("figcaption>address").text();
			var phone = $(list).find(".phone").text();
			var rooms = [];
			
			$.each($(list).find("tbody tr"),function(j,room){
				var name = $(room).find("td:eq(0)").text();
				var price = $(room).find("td:eq(1)").text();
				var vipPrice = $(room).find("td:eq(2)").text(); 
				var obj = {
					name:name,
					price:price,
					vipPrice:vipPrice
				};
				rooms.push(obj);
			});
			var hotel = {
				img:img,
				name:name,
				href:href,
				address:address,
				phone:phone,
				rooms:rooms
			};
			datas.push(hotel);
		});
	})();
	
  	$("#dropdownMenu-district~.dropdown-menu").click(function(event){
  		var district = event.target.innerHTML;
  		$("#dropdownMenu-district").val(district);
  	});
  	$(".date-bd").delegate("a","click",function(e){
  		var date = "";
  		if($(this).parents(".date-bd-l")[0]){
  			date = $(this).parents(".date-bd").siblings(".date-header").find(".date-title.fl").text();
  		}else{
  			date = $(this).parents(".date-bd").siblings(".date-header").find(".date-title.fr").text();
  		}
  		var year = date.substring(0,date.indexOf("年"));
		var month = date.substring(date.indexOf("年")+1,date.indexOf("月"));
 		$(this).parents(".dropdown_modal").children("input").val(year+"/"+month+"/"+$(e.target).text());
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
  	
  	
  	$("#departureDate").click(function(){
  		
		$(".date-title.fl").text(year+"年"+(month+1)+"月");
		$(".date-title.fr").text(year+"年"+(month+2)+"月");
		createCalendar(".date-bd-l tbody",year,month+1);
		createCalendar(".date-bd-r tbody",year,month+2);
  	});
  	
  	$("#dropdownMenu-arrive").click(function(){
  		
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
   			function hide(){
   				target.hide();
   			}
			target.show();
			$("body").on("click",function(){
				target.hide();
				$("body").off("click",arguments.callee);
			});
   		});
   		
   		
   		$("#search-btn").click(function(){
   			$.get("hotel/quickSearchAction",$("#search-form").serialize(),function(hotels){
   				//返回hotels数组 hotel:img name href address phone rooms room.name room.price
   				//datas = [];
   				$.merge(datas,hotels);
   				var numPerPage = $("#numPerPage").val();
   				var str = createLi(hotels,numPerPage);
   				$(".hotels ul").html(str);
   			});
   		});
   		
   		function createLi(arr,numPerPage,isFollow){
   			var str = [];
			$.each(arr,function(k,hotel){
				if(isFollow||k>=numPerPage){
					str.push('<li class="hidden">');
				}else{
					str.push('<li></li>');
				}
				str.push('<figure>');
				str.push('<img class="fig-img" src="'+hotel.pics[0].path+'">');
				str.push('<a class="watchpic">查看相册</a>');
				str.push('<figcaption><h3><a class="fig-title" href="hotel/hotelInfoAction.action?hotelId='+hotel.id+'">'+hotel.name+'</a></h3>');
				str.push('<address>'+hotel.address+'</address>');
				str.push('<p class="phone">'+hotel.phone+'</p>');
				str.push('</figcaption></figure>');
				str.push('<table class="hotel-tb"><thead><tr><td>房型</td><td>门市价</td><td>市场价</td></tr></thead>');
				str.push('<tbody>');
				$.each(hotel.rooms,function(i,room){
					str.push('<tr><td>'+room.type+'</td><td>'+room.price+'</td><td>'+room.price+'</td><td><a class="quickorder" href="hotel/hotelInfoAction.action?hotelId='+hotel.id+'&roomType='+room.type+'">预订</a></td></tr>');
				});
				str.push('</tbody></table></li>');
			});
			return str.join("");
   		}
   		
   		
   		function refreshLi(numPerPage,currentPage){
   			var lis = $(".hotels>ul>li");
   			lis.addClass("hidden");
   			$(".hotels>ul>li:eq");
   			var start = currentPage*(numPerPage-1);
   			var end = currentPage*numPerPage-1;
   			$.each(lis,function(i,li){
   				if(i>=start&&i<=end){
   					li.addClass("show");
   				}
   			});
   		}
   		
   		//分页 //先加载10条
   		
   		//var maxPage = 
   		$("#numPerPage").change(function(){
   			var numPerPage = $("#numPerPage").val();
   			var currentPage = $(".jump_num.active").val();
   			
   			refresh(numPerPage,currentPage);
   			/* 不经后台
   			$().getJSON("",{
   				"numPerPage":numPerPage,
   				"currentPage":currentPage
   			},function(data){
   				$.merge(datas,data);
   			});
   			*/
   		});
   		
   		$(".p_btn").click(function(e){
   			var target = $(this).text();
   			switch(target){
   				case "下一页": next($(this));break;
   				case "上一页": prev($(this));break;
   				case "首页": first();break;
   				case "末页": last();break;
   				default: console.log("分页出错");
   			}
   		});
   		
   		function next(ele){
   			var numPerPage = $("#numPerPage").val();
   			var currentPageE = $(".jump_box .active");
   			var currentPage = parseInt(currentPageE.text());
   			currentPageE.removeClass("active");
   			//更改跳转样式
   			if(currentPageE.parent().next().children()[0]){
   				currentPageE.parent().next().children().addClass("active");
   			}else{
   				$.each($(".jump_num"),function(i,a){
   					$(a).text(currentPage+i+1);
   				});
   				$(".jump_num:eq(0)").addClass("active");
   			}
   			
   			//刷新内容
   			refreshLi(numPerPage,currentPage+1);
   			
   			//预加载10条
   			if(currentPage+1>datas.length-10){
   				$.get("",{
   					"currentPage":currentPage+1,
   					"numPerPage":numPerPage
   				},function(hotels){
   					$.merge(datas,hotels);
   					var str = createLi(hotels,numPerPage,false);
   					$(".hotels>ul").append(str);
   				});
   			}
   			
   		}
   		
   		function prev(ele){
   			var numPerPage = $("#numPerPage").val();
   			var currentPageE = $(".jump_box .active");
   			var currentPage = parseInt(currentPageE.text());
   			currentPageE.removeClass("active");
   			//更改跳转样式
   			if(currentPageE.parent().prev().children()[0]){
   				currentPageE.parent().prev().children().addClass("active");
   			}else{
   				$.each($(".jump_num"),function(i,a){
   					$(a).text(currentPage-numPerPage+i+1);
   				});
   				$(".jump_num:last-child").addClass("active");
   			}
   			
   			//刷新内容
   			refreshLi(numPerPage,currentPage-1);
   		}
   		
   		function first(){
   			var numPerPage = $("#numPerPage").val();
   			var currentPageE = $(".jump_box .active");
   			currentPageE.removeClass("active");
   			$.each($(".jump_box"),function(i,a){
   				$(a).text(i+1);
   			});
   			$(".jump_num:first-child").addClass("active");
   			refreshLi(numPerPage,1);
   		}
   		
   		function last(){
   			var numPerPage = $("#numPerPage").val();
   			var currentPageE = $(".jump_box .active");
   			currentPageE.removeClass("active");
   			//totalNum 总页数
   			var totalNum = $("#totalNum");
   			if(!(totalNum = datas.length/numPerPage+1)){
   				$.getJSON("",{
	   				"numPerPage":numPerPage,
	   				"end":totalNum
	   			},function(hotels){
	   				datas = getUnique(datas,hotels);
	   			});
   			}
   			
			$.each($(".jump_box"),function(i,a){
				$(a).text(totalNum-numPerPage+i);
   			});
   			
   			$(".jump_num:last-child").addClass("active");
   			refreshLi(numPerPage,totalNum);
   		}
   		
   		//删除数组中重复对象
   		function getUnique(a,b){
			$.merge(a,b);	
			var obj = {};
			for(var i in a){
				obj[JSON.stringify(a[i])] = true;
			}
			var results = [];
			for(var j in obj){
				results.push(j);
			}
			 for (var k=0;k<results.length;k++){
			 	results[k]=JSON.parse(results[k]);
			 }
			 return results;
		}
		
		$("#checkOrder").click(function(){
    		document.location.href="order/checkOrderAction";
    	});
    	
    	$("#info").click(function(){
    		document.location.href="toInfoAction";
    	});
  </script>
  <script src="js/ajax_log.js"></script>
</html>
