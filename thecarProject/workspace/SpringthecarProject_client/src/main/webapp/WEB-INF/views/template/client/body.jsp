<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	background-color: #343a40;
}

.carousel.slide {
	width: 100%;
	height: 580px !important;
}

.carousel-caption.d-none.d-md-block {
	margin-bottom: 30px;
}

.carousel-inner {
	width: 100%;
	height: 650px !important;
	margin-top: -20px;
}

#slide1_img {
	width: 100%;
	height: 650px !important;
}

#slide2_img {
	width: 100%;
	height: 650px !important;
}

#slide3_img {
	width: 100%;
	height: 650px !important;
}
</style>
</head>
<body>


	<!-- Page header-->
	<header>
		<div class="carousel slide" id="carouselExampleIndicators"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li class="active" data-target="#carouselExampleIndicators"
					data-slide-to="0"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img id="slide1_img" src="../resources/images/slide/slide1.png" />
					<div class="carousel-caption d-none d-md-block">
						<h3>GENESIS 2019 G80</h3>
						<p>&nbsp;</p>
					</div>
				</div>
				<div class="carousel-item">
					<img id="slide2_img" src="../resources/images/slide/slide2.png" />
					<div class="carousel-caption d-none d-md-block">
						<h3>싼타페 TM</h3>
						<p>&nbsp;</p>
					</div>
				</div>
				<div class="carousel-item">
					<img id="slide3_img" src="../resources/images/slide/slide3.png" />
					<div class="carousel-caption d-none d-md-block">
						<h3>GRANDEUR Hybrid</h3>
						<p>&nbsp;</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>


</body>
</html>