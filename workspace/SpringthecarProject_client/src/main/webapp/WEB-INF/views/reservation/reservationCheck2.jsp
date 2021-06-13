<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인페이지2</title>
<script type="text/javascript"
	src="/resources/include/js/reservation.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != '') {
			switch (parseInt(errCode)) {
			case 1:
				alert("입력하신 정보에 맞는 예약 내역이 없습니다.");
				location.href = "/";
				break;
			}
		}
	}
</script>
<style type="text/css">
#reservationCheck2_Form {
	margin-top: 13%;
	margin-left: 30%;
	margin-bottom: 260px;
	width: 600px;
	height: auto;
}

input {
	width: 540px !important;
	height: 38px;
}

hr {
	width: 549px;
	float: left;
	margin-left: 10px;
}
</style>

</head>
<body>
	<form id="reservationCheck2_Form" class="form-horizontal">
		<c:forEach var="show" items="${show}" varStatus="status">
			<h4 class="text-primary">예약확인</h4>
			<div class="form-group form-group-sm">
				<label class="col-sm-2 control-label">예약번호</label>
				<div class="col-sm-3">
					<input class="form-control" placeholder="492112"
						value="${show.r_num}" />
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-sm-2 control-label">예약상태</label>
				<div class="col-sm-3">
					<input class="form-control" placeholder="예약대기"
						value="${show.r_status}" />
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-sm-2 control-label">예약자명</label>
				<div class="col-sm-3">
					<input class="form-control" placeholder="이윤경"
						value="${member.m_name}" />
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-sm-2 control-label">전화번호</label>
				<div class="col-sm-3">
					<input class="form-control" placeholder="010-4200-6859"
						value="${member.m_phone}" />
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label class="col-sm-2 control-label">차량번호</label>
				<div class="col-sm-3">
					<input class="form-control" placeholder="더뉴모닝(가솔린)"
						value="${show.c_num}" />
				</div>
			</div>

			<div class="form-group form-group-sm">
				<label class="col-sm-2 control-label">인수일수</label>
				<div class="col-sm-3">
					<input class="form-control" placeholder="2021-06-07 16:00"
						value="${show.r_prerentalDate}" />
				</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-sm-2 control-label">반납일시</label>
				<div class="col-sm-3">
					<input class="form-control" placeholder="2021-06-08 19:30"
						value="${show.r_prereturnDate}" />
				</div>
			</div>
			<%-- 			<label class="col-sm-2 control-label">차종보험</label>
			<div class="col-sm-4">
				<input class="form-control" placeholder="기본가입완료(대인,대물,자손)" value="${show.r_status}" />
			</div> --%>
			<%-- 
			<label class="col-sm-2 control-label">자차보험</label>
			<div class="col-sm-4">
				<input class="form-control" placeholder="미가입" value="${show.r_exsystem}" />
			</div> --%>
			<hr>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-3" style="margin-left: -10px">
					<input type="button" value="닫기" id="reservationCheck1Btn"
						class="form-control btn-primary btn-lg"
						onClick="location.href='/'" />
				</div>
			</div>
		</c:forEach>
		<!-- <div class="form-group">
			<label class="col-sm-2 control-label">결제</label>
			<div class="col-sm-4">
				<input class="form-control" placeholder="제주은행 09-01-038450 (예금주:덕카렌트카)">
				<input type="text" class="form-control" value="만나서결제">
			</div>
		</div> -->

	</form>

</body>
</html>