
$("#changePhoneDiv .modal-body").delegate("#toChangePhoneBtn","click",function(){
//$("#toChangePhoneBtn").click(function(){
	$.post("user/toChangePhone",$("#toChangePhoneForm").serialize(),function(result){
		var first = $("#changePhoneDiv .modal-body").html();
		if(result!="验证成功，请输入新手机号码"){
//			var a = $("#toChangePhoneForm");
//			var b = a.children("tbody");
			$(".errorInfo").remove();
			$(".changePhone_tb").after('<span class="errorInfo">验证失败</span>');
//			$("#toChangePhoneForm").children("tbody").append('验证失败');
//			$("#toChangePhoneForm").children("tbody").append('<tr><td class="errorInfo">验证失败</td></tr>');
			$("#changePhoneDiv .modal-dialog .close").on("click",function(){
				$("#changePhoneDiv .modal-body").html(first);
				$("#changePhoneDiv .modal-dialog .close").off("click",arguments.callee);
			});
		}else{
			var second = [];
			$("#changePhoneDiv .modal-body").html(function(){
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
			$("#changePhoneDiv .modal-dialog .close").on("click",function(){
				$("#changePhoneDiv .modal-body").html(first);
				$("#changePhoneDiv .modal-dialog .close").off("click",arguments.callee);
			});
			
			$("#changePhoneDiv .modal-backdrop").on("click",function(){
				$("#changePhoneDiv .modal-body").html(first);
				$("#changePhoneDiv .modal-backdrop").off("click",arguments.callee);
			});
			
			//添加下一步事件
			$("#changePhoneBtn").click(function(){
				var newPhone =$("#phone").val(); 
				$.post("user/changePhone",$("#changePhoneForm").serialize(),function(result){
					$("#changePhoneDiv .modal-body").html('<span style="text-align:center">'+result+'</span>');
					if(result="修改成功"){
						var t = $(".change-btn").parent().contents()[0].textContent;
						$(".change-btn").parent().contents()[0].textContent = newPhone;
					}
					setTimeout(function(){
						var event = document.createEvent("HTMLEvents");
	   					event.initEvent("click",true,true);
	   					var t = $("#changePhoneDiv .close");
	   					$("#changePhoneDiv .close")[0].dispatchEvent(event);
					},1000);
				});
			});
		}
	})
});


$("#changPasswordBtn").click(function(){
	$.post("user/changePassword",$("#changePasswordForm").serialize(),function(result){
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

$("#uploadPhoto").click(function(){
	console.log("this is 1");
});

$(".uploadPhotoFile").change(function(){
	$("#fileName").val($(this)[0].files[0].name);
		var formdata = new FormData($("#toUploadPhotoForm")[0]);
		$.ajax({
			type:"post",
			url:"pic/toUploadPhotoAction",
			data:formdata,
			contentType:false,
			processData:false
		}).then(function(result){
			if(result!="上传失败"){
				$("#originalPhoto").empty();
				$("#originalPhoto").append('<img src="'+result+'" width="280px"/>');
				$("#photoClt img").attr("src",result);
			}
		},function(){
			alert("shibai");
		});
});

$("#savePhoto").click(function(){
	var path = $("#originalPhoto img").attr("src");
	$.get("pic/changePhotoAction",{
		picPath:path
	},function(result){
		$("#changePhotoResult").text(result);
		if(result=="保存成功"){
			$(".info-photo img").attr("src",path);
			setTimeout(function(){
				var event = document.createEvent("HTMLEvents");
				event.initEvent("click",true,true);
				$("#changePicDiv .close")[0].dispatchEvent(event);
				$("#changePhotoResult").text("");
			},2000);
		}
	});
});

$("#cancelChangePhoto").click(function(){
	var event = document.createEvent("HTMLEvents");
	event.initEvent("click",true,true);
	$("#changePicDiv .close")[0].dispatchEvent(event);
});
