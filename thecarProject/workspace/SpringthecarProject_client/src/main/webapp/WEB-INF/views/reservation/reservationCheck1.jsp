<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인페이지1(고객명, 전화번호 입력)</title>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/reservation.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/login.css" />

<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != '') {
			switch (parseInt(errCode)) {
			case 1:
				alert("입력하신 정보에 맞는 예약 내역이 없습니다.");
				break;
			}
		}
	}
	
</script>

<style type="text/css">


/* ******************************* */
/* #reservationCheck1_Form {
	margin-top: 18%;
	margin-left: 34%;
}

input {
	width: 540px !important;
	height: 38px;
}


label {
	width: 100px;
	height: auto;
} */
</style>
</head>
<body>

	<form id="reservationCheck1_Form" class="form-horizontal">
	<div class="body">
	<h4 class="text-primary">예약확인</h4>
		<div class="group">
			<h1 class="label-font">이름</h1>
				<input type="text" id="m_name" name="m_name" maxlength="10"
					class="text-control" placeholder="한글/영문 2-10자 입력">
		</div>
		<div class="group">
			<h1 class="label-font">전화번호</h1>
				<input type="text" id="m_phone" name="m_phone" maxlength="11"
					class="text-control" placeholder="'-'없이 입력해 주세요!">
		</div>
		<div class="login-form-group">
				<input type="button" value="조회" id="reservationCheck1Btn"
					class="text-control btn-primary btn-lg" />
		</div>
		</div>
	</form>
</body>
</html>