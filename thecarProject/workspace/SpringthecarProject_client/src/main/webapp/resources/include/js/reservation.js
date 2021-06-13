$(function() {
	errCodeCheck();

	
	/* 예약하기 버튼 클릭 */
	$("#reservaionBtn").click(function() {
	var phonePattern = /(^01[0-9]{8,9})/;
	var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	

	
		if (phonePattern.test($('#m_phone').val()) != true) {// 전화번호 검사
			alert("전화번호를 잘 못 입력 하셨습니다.");
			$("#m_phone").focus();
			$("#m_phone").val("");
			return false;
		} else if (emailPattern.test($('#m_email').val()) != true) {// 이메일 검사
			alert("이메일을 잘 못 입력 하셨습니다.");
			$("#m_email").focus();
			$("#m_email").val("");
			return false;
		} else if ($(dong1).is(":checked") == false) {
			alert("전체 손해 면책 제도에 동의해 주세요.");
			return;
		} else if ($(dong2).is(":checked") == false) {
			alert("자동차 표준 대여 약관 동의에 동의해 주세요.");
			return;
		} else if ($(dong3).is(":checked") == false) {
			alert("취소 및 위약금 규정 동의에 동의해 주세요.");
			return;
		} else if ($(dong4).is(":checked") == false) {
			alert("대여 자격 확인 동의에 동의해 주세요.");
			return;
		}else{

		
		$("#reservationForm").attr({
			"method": "post",
			"action": "/reservation/reservationView"
		});
		$("#reservationForm").submit();
		
		}

	});

	 
	 /* 목록으로 버튼 클릭 */
	$("#productListBtn").click(function() {
		location.href = "/product/productSelectList";
	});
	
	/*==============================================================================================*/
	
	/* 예약 확인 */
	$("#reservationCheck1Btn").click(function() {
	var phonePattern = /(^01[0-9]{8,9})/;

	
		if (phonePattern.test($('#m_phone').val()) != true) {// 전화번호 검사
			alert("전화번호를 잘 못 입력 하셨습니다.");
			$("#m_phone").focus();
			$("#m_phone").val("");
			return false;
		} else{

		
		$("#reservationCheck1_Form").attr({
			"method": "post",
			"action": "/reservation/reservationCheck1"
		});
		$("#reservationCheck1_Form").submit();
		
		}

	});

});
