<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/jquery.timepicker.min.js"></script>
<!-- jquery 중복 방지 -->
<script>
	var jb = jQuery.noConflict();
</script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/jquery.timepicker.css" />
<script type="text/javascript" src="/resources/include/js/product.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/product.css" />


<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>productList</title>


<script type="text/javascript">
function showGetDate() {
	
	var r_prerentalDate = '<c:out value="${r_prerentalDate}" />';
	var r_prereturnDate = '<c:out value="${r_prereturnDate}" />';
	var stTime = '<c:out value="${stTime}" />';

	console.log("stTime"+stTime);
	if(r_prerentalDate != ''){
		console.log("낫널");
		var rentalDate = new Date(r_prerentalDate);
		var returnlDate = new Date(r_prereturnDate);

		document.getElementById('stDate').value = rentalDate.toISOString().substring(0, 10);
		document.getElementById('enDate').value = returnlDate.toISOString().substring(0, 10);
		document.getElementById('stTime').value = stTime;
		document.getElementById('enTime').value = stTime;
		
	
		}else{
			console.log("널");
			var date = new Date(); // 현재 날짜
			var stDay = date.getDate(); // 오늘 날짜(일)
			var enDay = date.getDate()+1; // 내일 날짜(일)
			stDay = stDay >= 10 ? stDay : '0' + stDay;  
			document.getElementById('stDate').value = date.toISOString().substring(0, 8) + stDay;
			enDay = enDay >= 10 ? enDay : '0' + enDay;  
			document.getElementById('enDate').value = date.toISOString().substring(0, 8) + enDay;
		
		}
	
}
</script>

<style type="text/css">

</style>
</head>
<body>
	<form id="search" class="form-horizontal">
			<!-- 대여/반납 예정일시 -->
			<input type="hidden" name="r_prerentalDate" id="r_prerentalDate"/>
			<input type="hidden" name="r_prereturnDate" id="r_prereturnDate"/>
			<input type="hidden" name="c_num" id="c_num">
			<input type="hidden" name="search1" id="search1" value="${search1}">
			<input type="hidden" id="url" name="url" value="/product/smallproductSelectList">
			
<!-- ======대여/반납시간 검색====================================================================================== -->
		<div id="productSearch" class="date-form">
		<ul class="search-date">
				<li><h3 class="search-font">대여</h3></li>
					<li><input type="date" id="stDate" name="stDate" class="date"></li>
				<li><select name="stTime" id="stTime" class="time">
					<option value="0800" autofocus>08:00</option>
					<option value="0830">08:30</option>
					<option value="0900">09:00</option>
					<option value="0930">09:30</option>
					<option value="1000">10:00</option>
					<option value="1030">10:30</option>
					<option value="1100">11:00</option>
					<option value="1130">11:30</option>
					<option value="1200">12:00</option>
					<option value="1230">12:30</option>
					<option value="1300">13:00</option>
					<option value="1330">13:30</option>
					<option value="1400">14:00</option>
					<option value="1430">14:30</option>
					<option value="1500">15:00</option>
					<option value="1530">15:30</option>
					<option value="1600">16:00</option>
					<option value="1630">16:30</option>
					<option value="1700">17:00</option>
					<option value="1730">17:30</option>
					<option value="1800">18:00</option>
					<option value="1830">18:30</option>
					<option value="1900">19:00</option>
					<option value="1930">19:30</option>
					<option value="2000">20:00</option>
				</select></li>
				<!-- <div class="col-sm-1">
					대여시간은 08~19시까지 가능하며 30분 단위로 가능
					<input type="text" id="stTime" name="stTime" class="form-control"
						value="08:00">
				</div> -->
					<li><h3 class="search-font">반납</h3></li>
					<li><input type="date" id="enDate" name="enDate" class="date"></li>
					<!-- 반납시간은 08~19시까지 가능하며 30분 단위로 가능 -->
					<li><input type="text" id="enTime" name="enTime" class="time" value="08:00" readonly ></li>
<!-- 				<div class="col-sm-1">
				<select name="enTime" id="enTime" class="form-control">
					<option value="0800" autofocus>08:00</option>
					<option value="0830">08:30</option>
					<option value="0900">09:00</option>
					<option value="0930">09:30</option>
					<option value="1000">10:00</option>
					<option value="1030">10:30</option>
					<option value="1100">11:00</option>
					<option value="1130">11:30</option>
					<option value="1200">12:00</option>
					<option value="1230">12:30</option>
					<option value="1300">13:00</option>
					<option value="1330">13:30</option>
					<option value="1400">14:00</option>
					<option value="1430">14:30</option>
					<option value="1500">15:00</option>
					<option value="1530">15:30</option>
					<option value="1600">16:00</option>
					<option value="1630">16:30</option>
					<option value="1700">17:00</option>
					<option value="1730">17:30</option>
					<option value="1800">18:00</option>
					<option value="1830">18:30</option>
					<option value="1900">19:00</option>
					<option value="1930">19:30</option>
					<option value="2000">20:00</option>
				</select> 
				</div> -->
				<li><input type="button" value="검색" id="serchBtn"
					class="serch-btn  btn-default" /></li>
			</ul>
			</div>

	<!-- ================차종 선택=========================================================================== -->
		<div class="carkind-div">
			<ul class="car-kind">
				<li id="allProduct"><a href="/product/productList">전체차종</a></li>
				<li id="smallProduct"><a href="/product/smallProductList">경차</a></li>
				<li id="miniProduct"><a href="/product/miniProductList">소형</a></li>
				<li id="midProduct"><a href="/product/midProductList">중형</a></li>
				<li id="bigProduct"><a href="/product/bigProductList">대형</a></li>
			</ul>
		</div>
		
		
	<!-- ================차량 리스트=========================================================================== -->
		<div class="form-group">
			<section id="section1">
				<div class="row">
					<ul>
						<c:forEach var="list" items="${list}">
							<c:if test="${list.c_type eq '경차' }">
								<li class="n" data-num="${list.c_num}">
									<div class="border">
										<input type="image"
											src="/resources/images/thecar/${list.c_name}.jpg"
											class="image"> <br>
										<div class="box">
											<h3 class="carName">${list.c_name }${list.c_type}</h3>
											<h4>
												이용료
												<fmt:formatNumber value="${list.c_rentalrate}" type="number" />
												원
											</h4>
											<%-- <a
											href="${contextPath }/reservation/reservationView?c_name=${list.c_name}">
											<input type="button" value="상세보기" id="productBtn"
											class="btn btn-primary" />
										</a> --%>
											<div class="Btn1">
												<input type="button" value="상세보기" id="productBtn"
													class="productBtn btn btn-primary" />
											</div>
										</div>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</section>
		</div>
	</form>
</body>
</html>