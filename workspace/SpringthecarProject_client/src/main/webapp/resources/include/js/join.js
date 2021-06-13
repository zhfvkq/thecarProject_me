
$(function() {

	errCodeCheck();


	/*정규 표현식*/
	var text = "";
	var idPattern = /^[A-Za-z0-9]{6,20}$/;
	var pwPattern = /^(?=.*[a-zA-Z])(?=.*[\d$@$!%*#?&]).{8,20}$/;
	var namePattern = /^[A-Za-z가-힣]{2,10}$/;
	var berthPattern = /^[0-9]{6}$/;
	var numPattern = /^[0-9]{8}$/;
	var phonePattern = /(^01[0-9]{8,9})/;
	var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	var drivingPattern = /^[0-9]{10,12}$/;

	var idConfirm = 1;
	/*아이디 중복 확인*/
	$("#idConfirmBtn").click(function() {

		if ($('#m_id').val() == "") {
			alert("아이디를 입력해주세요!");
			$("#m_id").focus();
			return false;
		} else if (idPattern.test($('#m_id').val()) != true) {// 아이디 검사
			alert("아이디를 잘 못 입력 하셨습니다.");
			$("#m_id").focus();
			$("#m_id").val("");
			return false;
		} else {
			$.ajax({
				url: "/member/userIdConfirm",
				type: "post",
				data: "m_id=" + $("#m_id").val(),
				error: function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
				},
				success: function(resultData) {
					console.log("resultData: " + resultData);
					if (resultData == "1") {
						alert("현재 사용 중인 아이디입니다.");
						$("#m_id").focus();
					} else if (resultData == "2") {
						alert("사용 가능한 아이디입니다.");
						idConfirm = 2;
					}
				}
			});
		}
	});


	/* 확인 버튼 클릭 시 처리 이벤트 */
	$("#joinInsert").click(function() {

		/*비밀번호/비밀번호 확인 일치 여부*/
		if ($("#m_pw").val() != $("#userPwCheck").val()) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			$("#userPwCheck").focus();
			$("#userPwCheck").val("");
			return false;
		}

		if (idConfirm != 2) {
			alert("아이디 중복 체크 진행해 주세요.");
			return false;
		} else if (pwPattern.test($('#m_pw').val()) != true) {// 비밀번호 검사
			alert("비밀번호를 잘 못 입력 하셨습니다.");
			$("#m_pw").focus();
			$("##m_pw").val("");
			return false;
		} else if (namePattern.test($('#m_name').val()) != true) {// 이름 검사
			alert("이름을 잘 못 입력 하셨습니다.");
			$("#m_name").focus();
			$("#m_name").val("");
			return false;
		} else if (berthPattern.test($('#m_brd').val()) != true) {// 생년월일 검사
			alert("생년월일을 잘 못 입력 하셨습니다.");
			$("#m_brd").focus();
			$("#m_brd").val("");
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
		} else if ((drivingPattern.test($('#m_dlnum').val()) != true) && ($('#driving').val() != null)) {// 자동차 운전 면허증 검사
			alert("자동차 운전 면허증을 잘 못 입력 하셨습니다.");
			$("#m_dlnum").focus();
			$("#m_dlnum").val("");
			return false;
		} else if ((numPattern.test($('#m_stDate').val()) != true) && ($('#stDate').val() != null)) {
			alert("면허증 발급일자를 잘 못 입력 하셨습니다.");
			$("#m_stDate").focus();
			$("#m_stDate").val("");
			return false;
		} else if ((numPattern.test($('#m_enDate').val()) != true) && ($('#enDate').val() != null)) {
			alert("면허증 만료일자를 잘 못 입력 하셨습니다.");
			$("#m_enDate").focus();
			$("#m_enDate").val("");
			return false;
		} else if ($(dong1).is(":checked") == false) {
			alert("약관 동의는 필수사항입니다.");
			return false;
		} else if ($(dong2).is(":checked") == false) {
			alert("약관 동의는 필수사항입니다.");
			return false;
		} else {

			$("#memberForm").attr({
				"method": "post",
				"action": "/member/join"
			});

			$("#memberForm").submit();
		}

	});

});