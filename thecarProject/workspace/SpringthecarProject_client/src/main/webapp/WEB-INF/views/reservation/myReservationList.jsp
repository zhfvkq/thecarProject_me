<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>내 예약목록</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/customerCenter.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$("#cancel_btn").click(function(e) {

			if (!confirm("예약을 취소하시겠습니까?"))
				return false; //취소 누르면 아래 로직 안탐

			console.log($(".cancel:checked").val());

			$.ajax({
				url : "/reservation/myReservationCancel",
				type : "post",
				data : {
					"r_num" : $(".cancel:checked").val()
				},
				dataType : "text",
				error : function() {
					alert("시스템 오류");
				},
				success : function(data) {
					if (data == 'success') {
						alert("예약취소 성공");
						location.href = "/reservation/myReservationList";
					} else {
						alert("관리자에게 문의하세요");
						return;
					}
				}
			});
		});

		$(".cancel").on("click", function() {
			var $this = $(this);

			$(".cancel").each(function() {
				$(this).prop("checked", false);
			})

			$this.prop("checked", true);
		})

	})

	function fn_paging(pageNum) {
		if (!pageNum)
			return false;

		var form = document.searchForm;

		form.curPage.value = pageNum;
		form.action = "/reservation/myReservationList";
		form.method = "GET";
		form.submit();
	}
</script>
</head>
<body>

	<%-- =============== 해더 시작 =============== --%>
	<%@ include file="../template/client/header.jsp"%>
	<%-- =============== 해더 종료 =============== --%>

	<div class="allBody">

		<%-- =============== 서브 상단 메뉴바 시작 =============== --%>
		<%@ include file="../template/client/mypage_subtop_menu.jsp"%>
		<%-- =============== 서브 상단 메뉴바 종료 =============== --%>

		<div id="MyReservation" class="default_width">
			<form name="cancelBtn" id="cancelBtn">
				<input type="hidden" name="r_num" id="r_num">
				<!-- 	<form name="searchForm" id="searchForm"> -->
				<input type="hidden" name="curPage">
			</form>

			<%-- =============== 예약 취소 버튼 출력 시작 =============== --%>
			<input type="button" class="cancel_btn" id="cancel_btn" value="예약취소">
			<%-- =============== 예약 취소 버튼 출력 종료 =============== --%>

			<table id="list">
				<tbody>
					<tr>
						<td class="tab" width="4%">선택</td>
						<td class="tab" width="10%">예약번호</td>
						<td class="tab" width="8%">차량명</td>
						<td class="tab" width="10%">자차면책</td>
						<td class="tab" width="10%">대여예정일시</td>
						<td class="tab" width="10%">반납예정일시</td>
						<td class="tab" width="10%">실 대여일시</td>
						<td class="tab" width="10%">실 반납일시</td>
						<td class="tab" width="8%">이용금액</td>
						<td class="tab" width="10%">예약상태</td>
						<td class="tab" width="10%">대여상태</td>
					</tr>

					<c:choose>
						<c:when test="${not empty  myReservationList}">
							<c:forEach var="reservation" items="${myReservationList}"
								varStatus="status">
								<tr class="center">
									<td style="text-align: center;"><input type="checkbox"
										name="cancel" class="cancel" value="${reservation.r_num}">
									</td>
									<td class="center">${reservation.r_num}</td>
									<td class="center">${reservation.c_name}</td>
									<td class="center">${reservation.r_exsystem}</td>
									<td class="center">${reservation.r_prerentalDate}</td>
									<td class="center">${reservation.r_prereturnDate}</td>
									<td class="center">${reservation.r_rentalDate}</td>
									<td class="center">${reservation.r_returnDate}</td>
									<td class="center">${reservation.r_price}</td>
									<td class="center">${reservation.r_status}</td>
									<td class="center">${reservation.r_cancelStatus}</td>
									<!-- 
									r_num; // 예약번호
									c_name; // 차량명
									r_exsystem; // 자차면책
									r_prerentalDate; // 대여예정일
									r_prereturnDate; // 반납예정일
									r_rentalDate; // 실대여일시
									r_returnDate; // 실반납일시
									r_price; // 이용금액
									r_status; // 예약상태
									r_cancelStatus; // 취소상태(대여상태)
									r_cancel; // 취소 (요청처리시) -->
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10" class="center">현재 예약중인 차량이 없습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>


			<div>
				<c:if test="${pagination.currentPage > 1 }">
					<a href="#" onClick="fn_paging(1)">[처음]</a>
				</c:if>

				<c:if test="${pagination.hasPreviousPage eq true}">
					<a href="#" onClick="fn_paging('${pagination.currentPage -1 }')">[이전]</a>
				</c:if>

				<c:forEach var="pageNum" begin="${pagination.firstPage }"
					end="${pagination.lastPage }">
					<c:choose>
						<c:when test="${pageNum eq  pagination.currentPage}">
							<span style="font-weight: bold;"><a href="#"
								onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
						</c:when>
						<c:otherwise>
							<a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pagination.hasNextPage eq true}">
					<a href="#" onClick="fn_paging('${pagination.currentPage +1 }')">[다음]</a>
				</c:if>
				<c:if test="${pagination.totalPageCount != pagination.currentPage}">
					<a href="#" onClick="fn_paging('${pagination.totalPageCount }')">[끝]</a>
				</c:if>
			</div>




		</div>
	</div>
	<%-- =============== 푸터 시작 =============== --%>
	<%@ include file="../template/client/footer.jsp"%>
	<%-- =============== 푸터 종료 =============== --%>
</body>
</html>

