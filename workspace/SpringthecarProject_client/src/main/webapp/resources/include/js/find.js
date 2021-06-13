$(function() {

	errCodeCheck()
	var idPattern = /^[A-Za-z0-9]{6,20}$/;
	var namePattern = /^[A-Za-z가-힣]{2,10}$/;
	var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

	/*findIDBtn submit에 대한 리스너를 선언한다.*/
	$("#findIDBtn").click(function() {

		if (namePattern.test($('#findIDForm #m_name').val()) != true) {// 이름 검사
			alert("이름을 잘 못 입력 하셨습니다.");
			$("#m_name").focus();
			$("#m_name").val("");
			return false;
		} else if (emailPattern.test($('#findIDForm #m_email').val()) != true) {// 이메일 검사
			alert("이메일을 잘 못 입력 하셨습니다.");
			$("#m_email").focus();
			$("#m_email").val("");
			return false;
		} else {

			$("#findIDForm").attr({
				"method": "POST",
				"action": "/member/findId"
			});
			$("#findIDForm").submit();
		}
	});

	/*findPWBtn submit에 대한 리스너를 선언한다.*/
	$("#findPWBtn").click(function() {

		// 특정 form의 id 값 가져오기 => $('#폼이름 #m_아이디이름').val()
		if (idPattern.test($('#findPWForm #m_id').val()) != true) {// 아이디 검사
			alert("아이디를 잘 못 입력 하셨습니다.");
			$("#m_id").focus();
			$("#m_id").val("");
			return false;
		} else if (namePattern.test($('#findPWForm #m_name').val()) != true) {// 이름 검사
			alert("이름을 잘 못 입력 하셨습니다.");
			$("#m_name").focus();
			$("#m_name").val("");
			return false;
		} else if (emailPattern.test($('#findPWForm #m_email').val()) != true) {// 이메일 검사
			alert("이메일을 잘 못 입력 하셨습니다.");
			$("#m_email").focus();
			$("#m_email").val("");
			return false;
		} else {

			$("#findPWForm").attr({
				"method": "POST",
				"action": "/member/findPw"
			});
			$("#findPWForm").submit();
		}
	});


});
