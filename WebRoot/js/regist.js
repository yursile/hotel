
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

function jqueryToArray(jqueryObj){
	 var temp = [];
	 for(var i=0;i<jqueryObj.length;i++){
         temp[i] = jqueryObj[i];
     }
	 return temp;
}


$(".regbtn").click(function(){
	//前端验证
	var temp = $("#regForm .show")[0];
	var items =  $("#regForm .item").not($("#regForm .item").last());
	//是否全部输入
	var tag = jqueryToArray(items).some(function(ele){
         return $(ele).children("input").val()=="";
     });
	if(temp||tag){
		$("#errorInfo .modal-body h4").text("信息不完整");
		$("#errorInfo").addClass("in").css({
			"display":" block",
			"padding-right": "17px",
			"text-align":"center"
			
		});
		setTimeout(function(){
			$("#errorInfo").removeClass("in").css({
				"display":"none",
				"padding-right": "0"
			});
		},2000);
	}else{
		$.post("user/regist.action",$("#regForm").serialize()).done(function(data){
			if(data=="success"){
				$("aside .step").attr("src","http://pic1.plateno.com/image2/login/registry_step2.jpg");
				$("#regForm").hide();
				$("#registRS").show();
				
				$("#registRS a").click(function(){
					clearInterval(timer);
				document.location.href="index.jsp";
				});
				var seconds = 5;
				var timer = setInterval(function(){
					if(--seconds==0){
						clearInterval(timer);
						document.location.href="index.jsp";
					}else{
						$("#registRS span").text(seconds);
					}
				},1000);	
			}
		});
	}
});

$(window).scroll(function(){
	if($(document).scrollTop()>40){
		$("nav").css({
		"box-shadow":"0 3px 3px rgb(233,233,233)"
	});
	}else{
		$("nav").css("box-shadow","");
	}
});
