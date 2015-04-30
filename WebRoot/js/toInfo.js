
$("#changePhoneDiv .modal-body").delegate("#toChangePhoneBtn","click",function(){
//$("#toChangePhoneBtn").click(function(){
	$.post("user/toChangePhone",$("#toChangePhoneForm").serialize(),function(result){
		
		if(result!="验证成功，请输入新手机号码"){
			$(this).children("tbody").append('<tr><td class="errorInfo">验证失败</td></tr>');
			$(".modal-dialog .close").on("click",function(){
				$(".modal-body").html(first);
				$(".modal-dialog .close").off("click",arguments.callee);
			});
		}else{
			var first = $(".modal-body").html();
			var second = [];
			
			$(".modal-body").html(function(){
				second.push('<span>'+result+'</span>');
				second.push('<form method="post" action="user/changePhone" name="changePhoneForm" id="changePhoneForm">');
				second.push('<table class="changePhone_tb"><tbody>');
				second.push('<tr><th colspan="70px">  <label  for="phone" >新号码</label></th>');
				second.push('<td>  <input  id="phone" class="form-control" style="display:inline-block;width:210px"placeholder="新手机号码" required autofocus name="newPhone"></td></tr>');
				second.push('<tr><th colspan="70px">  <label  for="rePhone" >确认号码</label></th>');
				second.push('<td>  <input  id="rePhone" class="form-control" style="display:inline-block;width:210px"placeholder="新手机号码" required autofocus></td></tr>');
				second.push('</tbody></table>');
				second.push(' <button id="changePhoneBtn" class="btn btn-lg btn-primary btn-block" style="margin-top:10px" type="button">修改</button>');
				second.push('</form>');
				return second.join("");
			});
			
			
			//当点击关闭按钮时，将表单反回第一个
			$(".modal-dialog .close").on("click",function(){
				$(".modal-body").html(first);
				$(".modal-dialog .close").off("click",arguments.callee);
			});
			
			$(".modal-backdrop").on("click",function(){
				$(".modal-body").html(first);
				$(".modal-backdrop").off("click",arguments.callee);
			});
			
			
			//添加下一步事件
			$("#changePhoneBtn").click(function(){
				$.post("user/changePhone",$("#changePhoneForm").serialize(),function(result){
					$(".modal-body").html('<span style="text-align:center">'+result+'</span>');
					setTimeout(function(){
//						$("#changePhoneDiv").removeClass("in").css({
//							"display":"none",
//							"padding-right": "0"
//						});
						var event = document.createEvent("HTMLEvents");
	   					event.initEvent("click",true,true);
	   					var t = $("#changePhoneDiv .close");
	   					$("#changePhoneDiv .close")[0].dispatchEvent(event);
					},1000);
//					$(".modal-dialog .close").on("click",function(){
//						$(".modal-body").html(first);
//						$(".modal-dialog .close").off("click",arguments.callee);
//					});
				});
			});
		}
	})
});


$("#changPasswordBtn").click(function(){
	$.post("user/changePassword",$("#changePasswordForm").serialize(),function(result){
		//$("#changePassResult modal-body").text(result);
		$("#changePassResult .modal-body h4").text(result);
		$("#changePassResult").addClass("in").css({
			"display":" block",
			"padding-right": "17px",
			"text-align":"center"
			
		});
		setTimeout(function(){
			$("#changePassResult").removeClass("in").css({
				"display":"none",
				"padding-right": "0"
			});
		},2000);
	});
});
