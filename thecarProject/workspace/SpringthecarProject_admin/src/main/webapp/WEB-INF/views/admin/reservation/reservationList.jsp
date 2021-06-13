<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<%@include file="../includes/header.jsp"%>
<script type="text/javascript" src="/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">예약조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<button type="button" id="rental" class="btn btn-primary">대여</button>
			</div>
			<!-- /.panel-heading -->
			<!-- 상세 페이지 이동을 위한 form -->
			<form name="rentalBtn" id="rentalBtn">
				<input type="hidden" name="r_num" id="r_num">

				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example-">
						<thead>
							<tr>
								<th>선택</th>
								<th>예약번호</th>
								<th>아이디</th>
								<th>예약자명</th>
								<th>연락처</th>
								<th>예약상태</th>
								<th>차량번호</th>
								<th>대여예상일시</th>
								<th>반납예상일시</th>
								<th>예약일</th>
								<th>이용요금</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty selectReservationList }">
									<c:forEach var="reservation" items="${selectReservationList }"
										varStatus="status">
										<tr class="odd gradeX" data-num="${reservation.r_num }">
											<td>
												<div class="checkbox">
													<label> <input type="checkbox" name="chk_rental"
														id="chk_rental" value="${reservation.r_num }">
													</label>
												</div>
											</td>
											<td class="goDetail">${reservation.r_num }</td>

											<td>${reservation.m_id}</td>
											<td>${reservation.adminMemberVO.m_name}</td>
											<td>${reservation.adminMemberVO.m_phone}</td>
											<td>${reservation.r_status}</td>
											<td>${reservation.c_num}</td>
											<td>${reservation.r_prerentaldate}</td>
											<td>${reservation.r_prereturndate}</td>
											<td>${reservation.r_date}</td>
											<td>${reservation.r_price}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="9">예약된 정보가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>

					<div style="text-align: center">
						<nav aria-label="Page navigation">
							<c:if test="${pagingVO.totalCnt != null }">
								<ul class="pagination">
									<c:forEach var="pageNum" begin="${pagingVO.section*10-9 }"
										end="${pagingVO.section*10 }" step="1">
										<c:if
											test="${pagingVO.section >= 2 && pageNum == (pagingVO.section*10-9 )}">
											<li><a
												href="/admin/reservation/reservationList?page=${(pagingVO.section-1)*10 }">&lt;</a></li>
										</c:if>
										<c:choose>
											<c:when test="${pageNum == pagingVO.page}">
												<li><a
													href="/admin/reservation/reservationList?page=${pageNum }">${pageNum }</a></li>
											</c:when>

											<c:when test="${pagingVO.maxPage >= pageNum}">
												<li><a
													href="/admin/reservation/reservationList?page=${pageNum }">${pageNum }</a></li>
											</c:when>
										</c:choose>
										<c:if
											test="${pagingVO.maxSection > pagingVO.section && pageNum == pagingVO.section*10 }">
											<li><a
												href="/admin/reservation/reservationList?page=${pagingVO.section*10 + 1 }">&gt;</a></li>
										</c:if>
									</c:forEach>
								</ul>
							</c:if>
						</nav>
					</div>

					</table>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- /.table-responsive -->


<!-- /#page-wrapper -->
<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	//대여버튼 클릭 시 처리 이벤트
	$("#rental").click(function() {
		alert("대여로 변경하시겠습니까?");
		console.log($("#chk_rental").val());
		$.ajax({
			url : "/admin/reservation/rental",
			type : "post",
			data : {
				"r_num" : $("#chk_rental").val()
			},
			dataType : "text",
			error : function() {
				alert("시스템 오류");
			},
			success : function(data) {
				if (data == 'success') {
					alert("대여 성공");
					location.href = "/admin/reservation/reservationList";
				} else {
					alert("변경 실패");
					return;
				}
			}
		});
	});

	/* 한페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로
	유지하기 위한 설정*/
	if ("<c:out value='${data.pageSize}' />" != "") {
		$("#pageSize").val("<c:out value='${data.pageSize}' />");
	}

	/* 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트 */
	$("#pageSize").change(function() {
		goPage(1);
	});
</script>