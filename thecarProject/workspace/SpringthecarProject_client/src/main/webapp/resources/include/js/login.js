$(function() {

	// 아래 함수는 서버로 받아 온 코드값에 대한 처리 함수(login.jsp 파일에 정의.)
	errCodeCheck()
	$('#m_id, #m_id').bind("keyup", function() {
		$(this).parents("div").find(".error").html("");
	});


	// submit에 대한 리스너를 선언한다.
	$("#loginBtn").click(function() {
		// ID의 정규식이 맞지 않을 때
		if ($("input[name=m_id]").val() == "") {
			alert("아이디를 입력해주세요!");
			$("#m_id").focus();
			return false;
		}
		// PW의 정규식이 맞지 않을 때
		if ($("input[name=m_pw]").val() == "") {
			alert("비밀번호를 입력해주세요!")
			$("#m_pw").focus();
			return false;
		}

		$("#loginForm").attr({
			"method": "POST",
			"action": "/member/login"
		});
		$("#loginForm").submit();

	});
});
