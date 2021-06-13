$(function() {

	errCodeCheck()



	$("#adminLoginBtn").click(function() {
		// ID의 정규식이 맞지 않을 때
		if ($("input[name=a_id]").val() == "") {
			alert("아이디를 입력해주세요!");
			$("#a_id").focus();
			return false;
		}
		// PW의 정규식이 맞지 않을 때
		if ($("input[name=a_pw]").val() == "") {
			alert("비밀번호를 입력해주세요!")
			$("#a_pw").focus();
			return false;
		}

		$("#adminLoginForm").attr({
			"method": "POST",
			"action": "/admin/login/adminLogin"
		});
		$("#adminLoginForm").submit();

	});
});
