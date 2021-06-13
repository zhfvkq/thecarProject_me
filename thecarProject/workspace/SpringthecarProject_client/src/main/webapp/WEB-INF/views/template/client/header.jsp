<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />

</head>

<div class="container">
	<c:if test="${login.m_id == null or login.m_id == ''}">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="navigation">
				<div id="nav1">
					<ul class="nav1_ul">
						<li class="nav1_li" id="nav1_icon"><a href="/"> <img
								src="/resources/images/common/icon_thecar.jpg" /></a></li>
						<li class="nav1_li" id="nav1_p">
							<p>
								고객센터 : 000-0000-0000<br>이용시간 : 08:00~21:00
							</p>
						</li>
						<li class="nav1_li" id="nav1_login"><a class="nav1_a"
							href="/member/login">로그인</a></li>
						<li class="nav1_li" id="nav1_join"><a class="nav1_a"
							href="/member/join">회원가입</a></li>
					</ul>
				</div>
				<div id="nav2">
					<ul class="nav2_ul">
						<li class="nav2_li"><a class="nav2_a"
							href=/template/rentalInfoPage/rentalInfo1>대여안내</a></li>
						<li class="nav2_li"><a class="nav2_a"
							href="/product/productList">렌트예약</a></li>
						<li class="nav2_li"><a class="nav2_a"
							href="/reservation/reservationCheck1">예약확인</a></li>
						<li class="nav2_li"><a class="nav2_a"
							href="/question/questionList">고객센터</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:if>

	<c:if test="${login.m_id != null and login.m_id != ''}">

		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="navigation">
				<div id="nav1">
					<ul class="nav1_ul">
						<li class="nav1_li" id="nav1_icon"><a href="/"><img
								src="../resources/images/common/icon_thecar.jpg" /></a></li>
						<li class="nav1_li" id="nav1_p">
							<p>
								회사 전화번호<br>영업시간 안내
							</p>
						</li>
						<li class="nav1_li" id="nav1_login"><a class="nav1_a"
							href="/member/logout">로그인</a></li>
						<li class="nav1_li" id="nav1_join"><a class="nav1_a"
							href="/reservation/myReservationList">내 예약목록</a></li>
						<li class="nav1_li" id="nav1_join"><a class="nav1_a"
							href="/member/modify">${sessionScope.login.m_name }</a></li>
					</ul>
				</div>
				<div id="nav2">
					<ul class="nav2_ul">
						<li class="nav2_li"><a class="nav2_a"
							href="/template/rentalInfoPage/rentalInfo1">대여안내</a></li>
						<li class="nav2_li"><a class="nav2_a"
							href="/product/productList">렌트예약</a></li>
						<li class="nav2_li"><a class="nav2_a"
							href="/reservation/reservationCheck1">예약확인</a></li>
						<li class="nav2_li"><a class="nav2_a"
							href="/question/questionList">고객센터</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:if>
	<!--/.nav-collapse -->
</div>

<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>