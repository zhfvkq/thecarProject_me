<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>회원가입</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->


<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/join.js"></script>

<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != '') {
			switch (parseInt(errCode)) {
			case 1:
				alert("이미 가입된 회원입니다!");
				break;
			case 2:
				alert("회원가입 처리가 실패하였습니다. 잠시 후 다시 시도해 주십시오.");
				break;
			}
		}
	}
</script>

<style type="text/css">

#memberForm {
	margin-left: 30%;
}
.col-sm-2 {
	font-size: 10pt;
}
h4 {
	font-size: 12pt;
	font-weight: bold;
}
.contentContainer {
	position: inherit;
	width: 100%;
	height: 1200px;
	margin-top: 210px;
	margin-bottom: 20px;
}
footer {
	height: 140px;
}
.form-control{
 width: 100px;
}
#joinInsert{margin-left: 10px;}
</style>

</head>
<body>
	<div class="contentContainer">
		<form id="memberForm" class="form-horizontal">
			<h4 class="text-primary">필수 사항</h4>
			<div class="form-group form-group-sm">
				<label for="m_id" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="m_id" name="m_id" maxlength="20"
						class="form-control" placeholder="영문/숫자포함 6-20자 입력" />
				</div>
				<div class="col-sm-2">
					<input type="button" id="idConfirmBtn" value="중복확인"
						class="form-control btn-primary" />
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label for="m_pw" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="m_pw" name="m_pw" maxlength="15"
						class="form-control" placeholder="영문/숫자포함 8-20자 입력">
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label for="userPwCheck" class="col-sm-2 control-label">비밀번호
					재입력</label>
				<div class="col-sm-3">
					<input type="password" id="userPwCheck" name="userPwCheck"
						maxlength="20" class="form-control">
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label for="m_name" class="col-sm-2 control-label">이름</label>
				<div class="col-sm-3">
					<input type="text" id="m_name" name="m_name" maxlength="10"
						class="form-control" placeholder="한글/영문 2-10자 입력">
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label for="m_brd" class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-3">
					<input type="text" id="m_brd" name="m_brd" maxlength="6"
						class="form-control" placeholder="주민등록번호 앞 6자리 입력 (ex 990218)">
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label for="m_gender" class="col-sm-2 control-label">성별</label>
				<div class="col-sm-3">
					<input type="radio" id="m_gender" name="m_gender" value="M">
					남자 <input type="radio" id="m_gender" name="m_gender" value="F">
					여자
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label for="m_phone" class="col-sm-2 control-label">전화번호</label>
				<div class="col-sm-3">
					<input type="text" id="m_phone" name="m_phone" maxlength="11"
						class="form-control">
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label for="m_add" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-3">
					<input type="text" id="m_add" name="m_add" maxlength="30"
						class="form-control" placeholder="시/구/동까지 입력">
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label for="m_email" class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-3">
					<input type="text" id="m_email" name="m_email" maxlength="60"
						class="form-control" placeholder="(@)포함 이메일 형식으로 영문/숫자 10-50자">
				</div>
			</div>


			<h4 class="text-primary">선택 사항</h4>
			<div class="form-group form-group-sm">
				<label class="col-sm-2 control-label">운전 면허증</label>
				<div class="col-sm-3">
					<input type="text" id="m_dlnum" name="m_dlnum" maxlength="12"
						class="form-control" placeholder="(-)제외 숫자로만 12자 입력">
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label class="col-sm-2 control-label">면허증 발급일자</label>
				<div class="col-sm-3">
					<input type="text" id="m_stDate" name="m_stDate" maxlength="8"
						class="form-control"
						placeholder="년,월,일 순으로 8개의 숫자로 입력(ex 20000504)">
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label class="col-sm-2 control-label">면허증 만료일자</label>
				<div class="col-sm-3">
					<input type="text" id="m_enDate" name="m_enDate" maxlength="8"
						class="form-control"
						placeholder="년,월,일 순으로 8개의 숫자로 입력(ex 20250504)">
				</div>
			</div>
			<br>
			<h4 class="text-primary">약관 동의</h4>
			<div class="form-group form-group-sm">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-6" style="font-size: 10pt;">
					<input type="checkbox" id="dong1" name="dong1" required>
					[필수] 덕카 이용약관 동의<br> <input type="checkbox" id="dong2"
						name="dong2" required> [필수] 개인정보 수집 및 동의
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-3">
					<input type="button" value="가입하기" id="joinInsert"
						class="form-control btn-primary btn-lg" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>
