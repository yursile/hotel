
//提交订单

$("#submit-order").click(function(){
	
	if(/登录/.test($("#logexit a").text())){
		var clickEvent = document.createEvent("HTMLEvents");
		clickEvent.initEvent("click",true,true);
		clickEvent.eventType="message";
		$("#logexit a")[0].dispatchEvent(clickEvent);
	}
	
	
	var roomId = $(".roomtype-ul .roomtype-selected .roomId").text();
	var hotelId = $("#hotelId").val();
	var selected = $(".date-roomtype tbody .selected a");
	var num = $("#num").val().slice(0,-1);
	var inDays = [];
	var month = $(".month-active a").text();
	month = month.replace(/年\d*月/,function(day){
		day = day.slice(1,-1);
		if(day.length<2){
			day = "0" + day;
		} 
		return day;
	});

	(function(){
		var i = 0;
		var l = selected.length;
		for(;i<l;i++){
			var day = $(selected[i]).text();
			if(day.length<2){
				day = "0" + day;
			} 
			inDays.push(month+day);
		}
	})();
	var days = (inDays.join(","));
	
	
	$("#days").val(days);
	$("#roomId").val(roomId);
	$("#back-num").val(num);
	$("#hotel-orderForm").submit();
	
});