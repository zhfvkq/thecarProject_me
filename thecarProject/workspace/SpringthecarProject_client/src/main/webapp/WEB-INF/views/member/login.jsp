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

<title>Login</title>

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/login.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/login.css" />

<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != "") {
			// 명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
			switch (parseInt(errCode)) {
			case 1:
				alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.");
				break;
			case 3:
				alert("회원탈퇴에 문제가 있어 정상 처리하지 못하였습니다.\n다시 시도해 주세요");
				break;
			}
		}
	}
</script>

</head>
<body>
		<!-- <c:if test="${login.m_id == null or login.m_id == ''}"> -->
			<form id="loginForm" class="form-horizontal" >
			<div class="body">
			
			<h4 class="text-primary">login</h4>
				<div class="group">
						<h1 class="label-font">아이디</h1>
						<input type="text" id="m_id" name="m_id" class="text-control" placeholder="예) zhfvkq123">
				</div>
				
				<div class="group">
						<h1 class="label-font">비밀번호</h1>
						<input type="password" id="m_pw" name="m_pw" class="text-control" placeholder="예) qwerasdf456">
				</div>
				<br><br>
				<div class="login-form-group">
						<input type="button" value="로그인" id="loginBtn" class="text-control btn-primary btn-lg" />
				</div>
				
					<div class="find">
						<a href="/member/find">아이디 찾기/비밀번호 찾기</a>
					</div>
			</div>
			</form>
<!--		</c:if>
		
 		<c:if test="${login.m_id != null and login.m_id != ''}">
			<fieldset id="loginAfter">
				<legend>
					<strong>[ ${login.m_name} ]님 반갑습니다</strong>
				</legend>
				<span id="memberMenu" class="tac"> <a
					href="/member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp; <a
					href="/member/modify">정보수정(비밀번호변경)</a>&nbsp;&nbsp;&nbsp; <a
					href="/member/delete">회원탈퇴</a>
				</span>
			</fieldset>
		</c:if>  -->
</body>
</html>