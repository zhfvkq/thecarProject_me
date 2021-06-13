<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/resources/images/common/icon.png">

<title><tiles:getAsString name="title" /></title>

<!-- Bootstrap core CSS -->
<link href="/resources/css/styles.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<!-- <link href="/resources/include/dist/css/sticky-footer-navbar.css" rel="stylesheet"> -->
<style type="text/css">
footer{
position: fixed !important;
bottom: 0;
width: 100%;
height: 200px;
}
</style>
</head>

<body>
	<!-- Fixed navbar -->
	<nav>
		<tiles:insertAttribute name="header" />
	</nav>

	<div class="carousel slide">
		<tiles:insertAttribute name="body" />
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
<footer class="footer">
	<tiles:insertAttribute name="footer" />
</footer>
</html>
