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
            <a class="navbar-brand" href="#">Project name</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse" style="float: left">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">首页</a></li>
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
                    <li><a href="#">个人资料</a></li>
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
    
    
    <div class="wrapper">
	    <div class="container" style="margin-top:60px">
	    	<h1>重庆沙坪坝店</h1>
	    	
	    	<div class="roomtype-box">
	    		<ul class="roomtype-ul">
	    			<li class="roomtype-selected"><a href="javascript:void(0)" >经济房</a></li>
	    			<li><a href="javascript:void(0)" >自主大床房</a></li>
	    			<li><a href="javascript:void(0)" >商务大床房</a></li>
	    			<li><a href="javascript:void(0)" >版主双床房</a></li>
	    			<li><a href="javascript:void(0)" >传统双床房</a></li>
	    			<li><a href="javascript:void(0)" >设备双床房</a></li>
	    		</ul>
	
				<div class="orderInfo">
					<h3>预订信息</h3>
					<form id="hotel-orderForm">
					<ul>
						<li>
							<label >姓名</label>
							<input type="text"/>
						</li>
						<li>
							<label>手机号码</label>
							<input type="text"/>
						</li>
						<li>
							<label>房型 </label>
							<input type="text" value="1278976" class="hidden-outline" />
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
						<li>
							<label>支付</label>
							<input value="" class="hidden-outline hl" id="price"/>
						</li>
						<li style="text-align:center">
							<a href="javascript:void(0)" id="submit-order"></a>
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
	    			<img src="http://img1.plateno.com/inn/023040/e0c533bc6b7bac44b4c2463365d709b6_640_480.jpg" />
	    		</figure>
	    		<div class="control-pic">
	    			<a href="javascript:void(0)" class="link-prev" title="上一页"></a>
	    			<a href="javascript:void(0)" class="link-next" title="下一页"></a>
	    			<div class="picroll-box">
	    			<ul class="pic-roll">
	    				<li class="active"><img  src="http://img1.plateno.com/inn/023040/e2d45cb45af35a3912563a99c973790e_120_120.jpg"></li><li><img  src="http://img1.plateno.com/inn/023040/5b54802ab4058d064a398b37f4b665f5_120_120.jpg"></li><li><img  src="http://img1.plateno.com/inn/023040/e2abb0a72aa00d4f9def423c49f6801b_120_120.jpg"></li><li><img  src="http://img1.plateno.com/inn/023040/e2d45cb45af35a3912563a99c973790e_120_120.jpg"></li><li><img src="http://img1.plateno.com/inn/023040/5b54802ab4058d064a398b37f4b665f5_120_120.jpg"></li><li><img class="" src="http://img1.plateno.com/inn/023040/e2abb0a72aa00d4f9def423c49f6801b_120_120.jpg"></li>
	    			</ul>
	    			</div>
	    		</div>
	    		
	    		<p class="instruction">酒店位于重庆北碚区中心地段云泉路18号天生市场国美电器旁,距离西南大学仅仅500米。至轻轨6号线终点站北碚站不足150米。距离悦来会展中心约15分钟车程。步行2分钟即可到达天奇广场步行街，步行3分钟到达北碚区客运中心，在此可乘坐到重庆主城各区线路车、北碚旅游景区路线车和北碚周边路线车,紧邻朝阳中学、田家炳中学、</p>
	    		<p class="address">地址：北碚区云泉路18号（天生市场国美电器旁 ）地铁北碚站2A出口直行一百米右转二十米，西南大学一号门往区门诊方向下行一百米</p>
	    		<p class="phone">电话：023-86083388</p>
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
    			<a href="javascript:void(0)" id="personalCommnet" title="我要点评">[我要点评]</a>
    			<h2>客户点评</h2>
    			
    		</div>
    		
    		<ul class="comment-ul">
    			<li class="comment-li">
    				<span class="comment-man">银卡会员18*******75</span>
    				<div class="comment-content">
    					<p class="comment-p">网速可以更快些</p>
    					<time class="comment-time">(2015-4-5 11:37)</time>
    				</div>
    			</li>
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
   		$(function(){
   			
	   		(function(){
		   		var d = new Date();
				var year = d.getFullYear();
				var month = d.getMonth();
				$.each($(".banner a"),function(i,n){
	   				$(n).text(year+"年"+(month+1+i)+"月");
	   			});
	   			createCalendar(year,month+1);
	   		})();
	   		
	   		
	   		//初始化价格
	   		(function(){
	   			var l = $(".roomtype-ul li").length;
	   			for(var i=0;i<l;i++){
	   				$(".roomtype-ul li:eq('"+i+"')").data("price",i*100+99);
	   			}
	   		})();
	   		
	   		
	   		function createCalendar(year,month){
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
		  		$(".date-roomtype tbody").html(str);
	   		}
	   		
	   		
	   		$(".banner").delegate("li","click",function(){
	   			$(".banner .month-active").removeClass("month-active");
	   			$(this).addClass("month-active");
	   			var date = $(this).find("a").text();
	   			var year = date.substring(0,date.indexOf("年"));
	   			var month = date.substring(date.indexOf("年")+1,date.indexOf("月"));
	   			createCalendar(year,month);
	   		});
	   		
   			
   			//订房日期  //动态生成的td用代理
   			$(".date-roomtype tbody").delegate("td","click",function(){
   				if($(this).hasClass("selected")){
   					$(this).removeClass("selected");
   				}else{
   					$(this).addClass("selected");
   				}
   				//修改天数
   				
   				var days = $(".date-roomtype .selected").length;
   				var unit_price = $(".roomtype-selected").data("price");
   				var num = $("#num").val().substr(0,1);
   				$("#date-num").val(days+"天");
   				//修改金额
   				$("#price").val("￥"+unit_price*days*num);
   			});
   			//房间类型导航
   			$(".roomtype-ul").delegate("li","click",function(e){
   				$(".roomtype-ul li").removeClass("roomtype-selected");
   				$(this).addClass("roomtype-selected");
   				var price = $(this).data("price");
   				$("#price").val("￥"+price*$("#num").val().substr(0,1)*$(".date-roomtype .selected").length);
   			});
   			$("#num").change(function(){
   				var num = this.value.substr(0,1);
   				$("#price").val("￥"+$(".roomtype-selected").data("price")*num*$(".date-roomtype .selected").length);
   			});
   			
   			//图片轮播
   			$(".link-next").click(function(){
   				$(".pic-roll").offset({
   					left:$(".pic-roll").offset().left-($(".pic-roll img").width()+3)
   				});
   				var active = $(".pic-roll .active");
   				active.removeClass("active");
   				active.next().addClass("active");
   				$("figure img").attr("src",$(".pic-roll .active img").attr("src"));
   			});
   			
   			$(".link-prev").click(function(){
   				$(".pic-roll").offset({
   					left:$(".pic-roll").offset().left+($(".pic-roll img").width()+3)
   				});
   				var active = $(".pic-roll .active");
   				active.removeClass("active");
   				active.prev().addClass("active");
				$("figure img").attr("src",$(".pic-roll .active img").attr("src"));
   			});
   			
   			$(".pic-roll").delegate("li","mouseover",function(){
   				$(this).siblings().removeClass("active");
   				$(this).addClass("active");
   				var img = $(this).find("img").attr("src");
   				$("figure img").attr("src",img);
   			});
   			
   		});
   		
   		
   	</script>
</html>
