
$(function() {
	errCodeCheck();

	/* 확인 버튼 클릭 시 처리 이벤트 */
	$("#modify").click(function() {

		var phonePattern = /(^01[0-9]{8,9})/;
		var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		var namePattern = /^[A-Za-z가-힣]{2,10}$/;


		if ($("#m_pw").val() != $("#userPwCheck").val()) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			$("#userPwCheck").focus();
			$("#userPwCheck").val("");
			return false;
		} else if (phonePattern.test($('#m_phone').val()) != true) {// 전화번호 검사
			alert("전화번호를 잘 못 입력 하셨습니다.");
			$("#m_phone").focus();
			$("#m_phone").val("");
			return false;
		} else if (emailPattern.test($('#m_email').val()) != true) {// 이메일 검사
			alert("이메일을 잘 못 입력 하셨습니다.");
			$("#m_email").focus();
			$("#m_email").val("");
			return false;
		} else if (namePattern.test($('#m_name').val()) != true) {// 이름 검사
			alert("이름은 한글/영문 2~10자로 입력해주세요.");
			$("#m_name").focus();
			$("#m_name").val("");
			return false;
		} else if ($("#m_pw").val() == "" && $("#userPwCheck").val() == "") {// 비밀번호 변경 안함
			var pw = $("#oldUserPw").val();
			$("#m_pw").val(pw);
			$("#userPwCheck").val(pw);
		} else {

			$("#memberForm").attr({
				"method": "post",
				"action": "/member/modify"
			});
			$("#memberForm").submit();
		}
	});


	$("#modifyReset").click(function() {
		$("#memberForm").each(function() {
			this.reset();
		});
	});

	$("#modifyCancel").click(function() {
		location.href = "/";
	});

});


function passwordCheck() {
	if ($("#m_pw").val() != $("#userPwCheck").val()) {
		alert("패스워드 입력이 일치하지 않습니다");
		$("#m_pw").val("");
		$("#userPwCheck").val("");
		$("#m_pw").focus();
		return false;
	}
	return true;
}


