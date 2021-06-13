<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="http://localhost:8081/admin/member/memberList">THE CAR</a>
			</div>
			<!-- /.navbar-header -->
			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="/admin/login/adminLogin"><i
								class="fa fa-sign-out fa-fw"></i> Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">


						<li><a href="http://localhost:8081/admin/member/memberList"><p
									class="fa fa-user"></p> 회원</a></li>
						<li><a href="http://localhost:8081/admin/member/memberChart"><p
									class="fa fa-bar-chart-o"></p> 회원통계</a></li>
						<!-- /.nav-second-level -->
						<li><a href="#"><p class="fa fa-list-alt"></p> 예약<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a
									href="http://localhost:8081/admin/reservation/reservationList">예약조회</a></li>
								<li><a
									href="http://localhost:8081/admin/reservation/rentalList">대여조회</a></li>
								<li><a
									href="http://localhost:8081/admin/reservation/returnList">반납완료조회</a></li>
								<li><a href="#">취소조회 <span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li><a
											href="http://localhost:8081/admin/reservation/cancelList">취소요청조회</a></li>
										<li><a
											href="http://localhost:8081/admin/reservation/cancelOkList">취소완료조회</a></li>
									</ul> <!-- /.nav-third-level --></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="#"><p class="fa fa-automobile"></p> 차량<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a
									href="http://localhost:8081/admin/product/productList">차량조회</a></li>
							</ul>
						<li><a href="#"><p class="fa fa-phone"></p> 고객상담<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="http://localhost:8081/admin/notice/noticeList">공지사항</a></li>
								<li><a
									href="http://localhost:8081/admin/question/questionList">1:1문의</a></li>
							</ul> <!-- /.nav-second-level --></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<div id="page-wrapper">

			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>