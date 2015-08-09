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










$("#regForm").delegate(".item input","blur",function(){
    var val = $(this).val().trim();
    var validate_type = $(this).attr("data-validate");
    if(val==""){
        $(this).next().removeClass("hidden");
        $(this).next().addClass("show");
    }else if(validate_type && !validateType(validate_type,val)){
        $(this).next().text($(this).attr("data-validateInfo"));
        $(this).next().removeClass("hidden");
        $(this).next().addClass("show");
    }else{
        $(this).next().removeClass("show");
        $(this).next().addClass("hidden");
    }
});

function validateType(type,val){
    switch(type){
        case "phone": return /^1[3,4,5,8,9][1-9]\d{8}$/.test(val);break;
        case "IDCard": return /^\d{17}(\d|X|x)$/.test(val); break;
        case "name": return /^[\u4E00-\u9FA5]{2,4}$/.test(val);break;
        case "password": return /^[a-z | A-Z](\w|\.|,){5,15}$/.test(val);break;
        default: return false;
    }
}


$("#regForm").delegate("#password","blur",function(){
    var password = $(this).val();
    var repassword = $("#repassword").val();
    if(password.trim()!=""&& repassword.trim()!=""){
        if(password!=repassword){
            $(this).next().removeClass("hidden");
            $(this).next().text("两次输入不一致").addClass("show");
        }
        else{
            $(this).next().removeClass("show");
            $(this).next().text("请确认密码").addClass("hidden");
        }
    }
});

$("#regForm").delegate("#repassword","blur",function(){
    var password = $("#password").val();
    var repassword = $(this).val();
    if(password.trim()!=""&& repassword.trim()!=""){
        if(password!=repassword){
            $(this).next().removeClass("hidden");
            $(this).next().text("两次输入不一致").addClass("show");
        }
        else{
            $(this).next().text("请确认密码").addClass("hidden");
        }
    }
});

