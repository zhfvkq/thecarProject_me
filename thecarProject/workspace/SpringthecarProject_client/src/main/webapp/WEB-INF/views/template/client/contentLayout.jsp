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
<link rel="icon" href="/resources/images/common/icon.jpg">
<title><tiles:getAsString name="title" /></title>
<!-- Bootstrap core CSS -->
<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/include/dist/css/sticky-footer-navbar.css" rel="stylesheet">

<script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
<style type="text/css">
.nav2_li {
	color: #CFD8DC;
}

</style>
</head>

<body>
	<!-- Fixed navbar -->
	<header>
		<tiles:insertAttribute name="header" />
	</header>

	<tiles:insertAttribute name="body" />

	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>

	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
