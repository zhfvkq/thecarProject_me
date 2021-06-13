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

<title>아이디/비밀번호 찾기</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/find.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != "") {
			// 명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
			switch (parseInt(errCode)) {
			case 1:
				alert("이름 또는 이메일이 일치 하지 않거나 존재하지 않는 \n회원입니다");
				break;
			case 2:
				alert("아이디 찾기 성공 \n아이디는 '${find.m_id}'입니다.");
				break;
			case 3:
				alert("회원탈퇴에 문제가 있어 정상 처리하지 못하였습니다.\n다시 시도해 주세요");
				break;
			case 4:
				alert("비밀번호 찾기 성공 \n비밀번호는'${find.m_pw}'입니다.");
				break;
			}
		}
	}
</script>
<style type="text/css">
#findIDForm{ margin-top:230px; margin-left: 100px;}
 #findPWForm{ margin-left: 100px;}
</style>
</head>
<body>
		<form id="findIDForm" class="form-horizontal">
			<h4 class="text-primary">아이디 찾기</h4>
			<div class="form-group">
				<label for="m_name" class="col-sm-2 control-label">회원 이름</label>
				<div class="col-sm-3">
					<input type="text" id="m_name" name="m_name" class="form-control" placeholder="ex) 홍길동">
				</div>
			</div>
			<div class="form-group">
				<label for="m_email" class="col-sm-2 control-label">회원 이메일</label>
				<div class="col-sm-3">
					<input type="text" id="m_email" name="m_email"
						class="form-control" placeholder="ex) E-Mail@gmail.com">
				</div>
			</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-3">
				<input type="button" value="검색" id="findIDBtn" class="form-control btn-primary" />
			</div>
		</div>
	</form>
<br>
		<form id="findPWForm" class="form-horizontal">
			<h4 class="text-primary">비밀번호 찾기</h4>
			<div class="form-group">
				<label for="m_id" class="col-sm-2 control-label">회원 아이디</label>
				<div class="col-sm-3">
					<input type="text" id="m_id" name="m_id" class="form-control" placeholder="ex) qwer417">
				</div>
			</div>
			<div class="form-group">
				<label for="m_name" class="col-sm-2 control-label">회원 이름</label>
				<div class="col-sm-3">
					<input type="text" id="m_name" name="m_name" class="form-control" placeholder="ex) 홍길동">
				</div>
			</div>
			<div class="form-group">
				<label for="m_email" class="col-sm-2 control-label">회원 이메일</label>
				<div class="col-sm-3">
					<input type="text" id="m_email" name="m_email"
						class="form-control" placeholder="ex) E-Mail@gmail.com">
				</div>
			</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"></label>
			<div class="col-sm-3">
				<input type="button" value="검색" id="findPWBtn" class="form-control btn-primary" />
			</div>
		</div>
	</form>

</body>
</html>