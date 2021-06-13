<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>reservation</title>

<link rel="stylesheet" type="text/css" href="/resources/include/css/reservation.css" />

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/reservation.js"></script>

<script type="text/javascript">
	
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != '') {
			switch (parseInt(errCode)) {
			case 1:
				alert("예약 처리 중 오류가 발생하였습니다.");
				break;
			case 2:
				alert("예약이 완료 되었습니다.");
				location.href = "/";
				break;

			}
		}
	}
</script>
<style type="text/css">

</style>
</head>
<body>
	<div id="search">
		<form id="reservationForm"> 
			<input type="hidden" name="c_num" id="c_num" value="${reservation.c_num}">
			<input type="hidden" name="m_id" id="m_id" value="${member.m_id}">
			<input type="hidden" name="r_prerentalDate" id="r_prerentalDate" value="${r_prerentalDate}">
			<input type="hidden" name="r_prereturnDate" id="r_prereturnDate" value="${r_prereturnDate}">
			<input type="hidden" name="r_price" id="r_price" value="${calDateDays*reservation.c_rentalrate}">
			<div id="div1" class="form-group form-group-sm">
				<div id="dididi1">
					<input type="image" class="image"
						src="/resources/images/thecar/${reservation.c_name}.jpg">
				</div>
				<div class="div1" id="dididi2">
					<h1 class="namecar">${reservation.c_name}</h1>
					<p class="infocar">
						${reservation.c_det}<br> 연식 ${reservation.c_year}년
						${reservation.c_color}<br> 대여자격 ${reservation.c_crt}<br>
						특이사항: ${reservation.c_else}
					</p>
					<div class="add">
					<div class="h3Text">
						<div class="h3Text_1">
							인수일시 &nbsp;&nbsp;<label class="lebleText">
							<!-- string.substring(start, end)  특정 문자열을 잘라내여 반환 -->
							${r_prerentalDate.substring(0,4)}년 ${r_prerentalDate.substring(4,6)}월 ${r_prerentalDate.substring(6,8)}일 &nbsp; 
							${r_prerentalDate.substring(8,10)}시 ${r_prerentalDate.substring(10,12)}분 </label>
						</div>
						<div class="h3Text_1" style="margin-top: -5px;">
							반납일시 &nbsp;&nbsp;<label class="lebleText">
							${r_prereturnDate.substring(0,4)}년 ${r_prereturnDate.substring(4,6)}월 ${r_prereturnDate.substring(6,8)}일 &nbsp; 
							${r_prereturnDate.substring(8,10)}시 ${r_prereturnDate.substring(10,12)}분 </label>
						<label style="color: #2828CD;font-size: 40px;font-weight: 900; margin-top: -300px; font-weight: 500;">&nbsp;&nbsp;${calDateDays}일</label>
						</div>
					</div>
					</div>
				</div>
			</div>
			<br> <br>

			<div class="form-group form-group-sm" id="div2">
				<input type="image" src=/resources/images/thecar/car.png
					class="logo"><label class="logoText">차량보험</label><br>
				<br>
				<hr>
				<div id="div1">
					<div class="label1">
						<label class="label1_1">종합보험</label><label class="label1_2">대인,대물,자손
							가입완료</label>
					</div>
					<label style="font-weight: 900;">|</label>
					<div class="label2">
						<label class="label1_1">자차면책</label><label class="label1_2">자차면책
							미포함</label>
					</div>
					<br>
					<div class="label3">
						<label class="label1_1">면책내용</label><label class="label3_2">자차면책이
							포함되지 않았으며, 차량인수시 추가가능합니다</label>
					</div>
				</div>
			</div>

			<div class="form-group form-group-sm" id="div3">
				<input type="image" src=/resources/images/thecar/car.png
					class="logo"><label class="logoText">대여요금확인</label><br>
				<br>
				<hr>
				<div id="div1">
					<div class="label1">
						<label class="label1_1">차량대여료</label><label class="label1_2">
						<!-- Spring -> int 타입 변환 -->
						<fmt:formatNumber value="${reservation.c_rentalrate*calDateDays}" type="number"/>원</label>
					</div>
					<br> <br>
					<div class="label1" style="margin-left: -495px;">
						<label class="label1_1" >자차보험료</label><label class="label1_2">0
							원</label>
					</div>
					<br> <br>
					<div class="label1">
						<label class="label1_1">총이용요금</label><label class="label1_2">
						<fmt:formatNumber value="${reservation.c_rentalrate*calDateDays}" type="number"/>원</label>
					</div>
				</div>
			</div>

			<div class="form-group form-group-sm" id="div4">
				<input type="image" src=/resources/images/thecar/car.png
					class="logo"><label class="logoText">고객정보입력</label><br>
				<br>
				<hr>
				<div id="div1">
					<div class="div4_1">
						<label class="div4_label1_1">고객명</label>
						<div class="cusText">
							<input type="text" style="width: 200px;" value="${member.m_name}">
						</div>
					</div>
					<br> <br>
					<div class="div4_1">
						<label class="div4_label1_1">전화번호</label>
						<div class="cusText">
							<input type="text" id="m_phone" placeholder="'-'제외하고 입력"
								maxlength="11" style="width: 200px;" value="${member.m_phone}">
						</div>
					</div>
					<div class="div4_1">
						<label class="div4_label1_1">이메일</label>
						<div class="cusText">
							<input type="text" id="m_email" style="width: 200px;"
								value="${member.m_email}">
						</div>
					</div>
					<div class="div4_1">
						<label class="div4_label1_1">추가메모</label>
						<div class="cusText">
							<input type="text" style="width: 700px;">
						</div>
					</div>
				</div>
			</div>

			<div class="form-group form-group-sm" id="div5">
				<input type="image" src=/resources/images/thecar/car.png
					class="logo"><label class="logoText">면허정보입력</label><br>
				<br>
				<hr>
				<div id="div1">
					<div class="div4_1">
						<label class="div4_label1_1">운전면허증</label>
						<div class="cusText">
							<input type="text" style="width: 200px;"
								value="${member.m_dlnum}">
						</div>
					</div>
					<br> <br>
					<div class="div4_1">
						<label class="div4_label1_1">면허증 발급일자</label>
						<div class="cusText">
							<input type="text" style="width: 200px;"
								value="${member.m_stDate}">
						</div>
					</div>
					<div class="div4_1">
						<label class="div4_label1_1">면허증 만료일자</label>
						<div class="cusText">
							<input type="text" style="width: 200px;"
								value="${member.m_enDate}">
						</div>
					</div>
				</div>
			</div>

			<div class="form-group form-group-sm" id="div6">
				<input type="image" src=/resources/images/thecar/car.png
					class="logo"><label class="logoText">전체손해면책제도</label><br>
				<br>
				<hr>
				<div id="div1">
					<textarea>여러분을 환영합니다.
					네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 
					이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       					</textarea>
				</div>
				<div class="div5_1">
					<input type="checkbox" name="chk" class="chk" id="dong1"> 위 내용에 동의합니다.
				</div>
			</div>

			<div class="form-group form-group-sm" id="div6">
				<input type="image" src=/resources/images/thecar/car.png
					class="logo" ><label class="logoText">자동차표준대여약관동의</label><br>
				<br>
				<hr>
				<div id="div1">
					<textarea>여러분을 환영합니다.
					네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 
					이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       					</textarea>
				</div>
				<div class="div5_1">
					<input type="checkbox" name="chk" class="chk" id="dong2"> 위 내용에 동의합니다.
				</div>
			</div>

			<div class="form-group form-group-sm" id="div6">
				<input type="image" src=/resources/images/thecar/car.png
					class="logo" ><label class="logoText">취소및위약금규정동의</label><br>
				<br>
				<hr>
				<div id="div1">
					<textarea>여러분을 환영합니다.
					네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 
					이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       					</textarea>
				</div>
				<div class="div5_1">
					<input type="checkbox" name="chk" class="chk" id="dong3"> 위 내용에 동의합니다.
				</div>
			</div>

			<div class="form-group form-group-sm" id="div6">
				<input type="image" src=/resources/images/thecar/car.png
					class="logo" ><label class="logoText">대여자격확인동의</label><br>
				<br>
				<hr>
				<div id="div1">
					<textarea>여러분을 환영합니다.
					네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 
					이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       					</textarea>
				</div>
				<div class="div5_1">
					<input type="checkbox" name="chk" class="chk" id="dong4"> 위 내용에 동의합니다.
				</div>
				<br> <br> <br> <br> <input type="button"
					value="예약하기" id="reservaionBtn" class="btn btn-primary" /> <input
					type="button" value="목록으로" id="productListBtn"
					class="btn btn-default" />
			</div>
		</form>
	</div>
</body>
</html>
