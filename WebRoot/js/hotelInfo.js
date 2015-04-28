
//提交订单

$("#submit-order").click(function(){
	var roomId = $(".roomtype-ul .roomtype-selected .roomId").text();
	var hotelId = $("#hotelId").val();
	var selected = $(".date-roomtype tbody .selected a");
	var num = $("#num").val().slice(0,-1);
	var inDays = [];
	var month = $(".month-active a").text();
//	month = month.replace(/(?<=年)\d*(?=月)/,function(day){
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
	
	
//	$.ajax({
//		url:"",
//		type:"post",
//		data:{
//			roomId:roomId,
//			hotelId:hotelId,
//			days:days,
//			num:num
//		}
//	});
	$.get("order/orderAction",{
		"roomId":roomId,
		"hotelId":hotelId,
		"days":days,
		"num":num
	});
	
//	function formatDay(list){
//		 var s1 = [];
//		 var list = [];
//		 var n =0;
//		 s1.push(array[0]);
//		 for(var i = 1;i<array.length;i++){
//		 	if(array[i]-array[i-1]==1){
//		 		s1.push(array[i]);
//		 	}else{
//		 		list[n]=s1;
//		 		n++;
//		 		s1 = [];
//		 		s1.push(array[i]);
//		 	}
//		 }
//		 list[n]=s1;
//		 return list;
//	}
	
});