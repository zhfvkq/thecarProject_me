$(function() {
	showGetDate();
	console.log("search : " + $("#search1").val());
		/*30분 간격으로 시간 지정*/
		//jb("#stTime").timepicker({
		//	step: 30,            /*시간간격 : 30분*/
		//	timeFormat: "H:i"    /*시간:분 으로표시*/
		//});
		//jb("#enTime").timepicker({
		//	step: 30,            /*시간간격 : 30분*/
		//	timeFormat: "H:i"    /*시간:분 으로표시*/
		//});

/*===================================================================*/

		/* 대여/반납일 검색 버튼 클릭 */
		$("#serchBtn").click(function() {
			
			
			/* 날짜 조건 확인 */
			var toDay = new Date(); // 현재 날짜
			toDay=toDay.toISOString().substring(0, 10); 
			if (($('#stDate').val() >= $('#enDate').val()) == true) {
				alert("날짜 선택이 잘못 되었습니다.");
				return false;
			} else if (($('#stDate').val() < toDay) == true) {
				alert("대여날짜 선택이 잘못 되었습니다.");
				return false;
			}
			
			
			console.log($("#search1").val());
			/* 예약할 날짜 + 시간 */
			stTime = $("#stTime").val()
			/*var stTime = stTime.replace(":", "");
			stTime = stTime.replace(/ /g, "");*/
			var stDate = $("#stDate").val()
			stDate = stDate.replace("-", "");
			stDate = stDate.replace("-", "");
			stDate = stDate.replace(/ /g, "");

			enTime = $("#stTime").val()
			/*var enTime = enTime.replace(":", "");
			enTime = enTime.replace(/ /g, "");*/
			var enDate = $("#enDate").val()
			enDate = enDate.replace("-", "");
			enDate = enDate.replace("-", "");
			enDate = enDate.replace(/ /g, "");

			$("#r_prerentalDate").val(stDate + stTime);
			$("#r_prereturnDate").val(enDate + enTime);
			
			var url = $("#url").val();
			$("#search").attr({
				"method": "get",
				"action": url
			});
			$("#search").submit();

		});

/*===================================================================*/
		/*예약하기 버튼 클릭*/
		$(".productBtn").click(function() {
			
			/* 날짜 조건 확인 */
			var toDay = new Date();
			toDay = toDay.toISOString().substring(0, 10);
			
			console.log($("#search1").val());
			if ($("#search1").val() != 2) {
				alert("검색을 진행해주세요.");
				return false;
			}
			

			var c_num = $(this).parents("li").attr("data-num");
			$("#c_num").val(c_num);
			console.log("차량번호 : " + c_num);


			/* 예약할 날짜 + 시간 */
			var stTime = $("#stTime").val()
			stTime = stTime.replace(":", "");
			stTime = stTime.replace(/ /g, "");
			var stDate = $("#stDate").val()
			stDate = stDate.replace("-", "");
			stDate = stDate.replace("-", "");
			stDate = stDate.replace(/ /g, "");

			var enTime = $("#stTime").val()
			enTime = enTime.replace(":", "");
			enTime = enTime.replace(/ /g, "");
			var enDate = $("#enDate").val()
			enDate = enDate.replace("-", "");
			enDate = enDate.replace("-", "");
			enDate = enDate.replace(/ /g, "");

			$("#r_prerentalDate").val(stDate + stTime);
			$("#r_prereturnDate").val(enDate + enTime);

			$("#search").attr({
				"method": "get",
				"action": "/reservation/reservationView"
			});
			$("#search").submit();

		});

	});
