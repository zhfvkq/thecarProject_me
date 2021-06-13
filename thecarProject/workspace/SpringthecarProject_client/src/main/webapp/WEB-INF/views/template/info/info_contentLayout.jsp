<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/resources/images/common/icon.jpg">

<title>rentalInfo_contentLayout</title>

<!-- Bootstrap core CSS -->
<link href="/resources/css/styles.css" rel="stylesheet" />

<style type="text/css">
.infoimage {
	width: 100%;
	height: auto;
	text-align: center;
	margin-top: 10px;
	margin-bottom: 210px;
}

#subtop_menu {
	margin-top: 186px;
	width: 100%;
	height: auto;
	display: block;
}

#subtop_menu_roundbox {
	text-align: center;
	font-size: 0;
	display: block;
}

.default_width {
	width: 1100px;
	margin: 0 auto;
}

div#subtop_menu_roundbox a {
	width: 150px;
	display: inline-block;
	line-height: 50px;
	margin: 2px;
	border: 1.5px solid #343a40;
	font-size: 16px;
	color: #343a40;
	font-weight: bold;
}

div#subtop_menu_roundbox a:hover {
	background-color: #CFD8DC;
}
</style>

</head>
<body>
	<div id="subtop_menu">
		<div id="subtop_menu_roundbox" class="default_width">
			<a id="icss1" href="/template/infoPage/infoPage1">회사소개</a> <a
				id="icss2" href="/template/infoPage/infoPage2">대여표준약관</a> <a
				id="icss3" href="/template/infoPage/infoPage3">전자상거래표준약관</a> <a
				id="icss4" href="/template/infoPage/infoPage4">개인정보처리방침</a>
		</div>
	</div>
</body>
</html>