$(".modal-dialog").draggable({
	handle:".modal-header"
});

$("#ajaxLogin").click(function(){
	var obj = $("form[name='loginForm']").serialize();
	//get第二个参数可以是{}配置项，也可以是字符串
	$.post("user/ajax_login",obj,function(result){
		if(result=="success"){
			$(".checkbox span").text(result);
			$("#log").hide();
			$("#exit").show();
			
			setTimeout(function(){
				var event = document.createEvent("HTMLEvents");
				event.initEvent("click",true,true);
				$("#logDiv .close")[0].dispatchEvent(event);
			},1000);
		}else{
			$(".checkbox span").text("登录失败，手机号或密码输入错误");
		}
	});
});

$("#exitDiv").delegate("#confirm","click",function(){
//$("#confirm").click(function(){
	$.get("user/ajax_exit",function(result){
		
		$("#log").show();
		$("#exit").hide();
		
		var oldHtml = $("#exitDiv .modal-content").html();
		
		$("#exitDiv .modal-content").html('<button style="display:none" type="button" class="close" data-dismiss="modal"></button><div class="modal-body" style="text-align:center">'+result+'</div>');
		
		setTimeout(function(){
			var event = document.createEvent("HTMLEvents");
			event.initEvent("click",true,true);
			$("#exitDiv .close")[0].dispatchEvent(event);
			setTimeout(function(){
				$("#exitDiv .modal-content").html(oldHtml);
			},500);
			
		},1000);
		
	});
});

$("#checkOrder").click(function(){
	document.location.href="order/checkOrderAction";
});

$("#info").click(function(){
	document.location.href="toInfoAction";
});

