<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">취소요청조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<button type="button" id="cancel" class="btn btn-primary">승인</button>
			</div>
			<!-- /.panel-heading -->
			<!-- 상세 페이지 이동을 위한 form -->
			<form name="noticeDetail" id="noticeDetail">
				<input type="hidden" name="n_num" id="n_num">
			</form>
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
							<th>취소상태</th>
							<th>차량번호</th>
							<th>대여예상일시</th>
							<th>반납예상일시</th>
							<th>예약일</th>
							<th>이용요금</th>

						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty cancelList }">
								<c:forEach var="cancel" items="${cancelList }"
									varStatus="status">
									<tr class="odd gradeX" data-num="${cancel.r_num }">
										<td>
											<div class="checkbox">
												<label> <input type="checkbox" name="chk_cancel"
													id="chk_cancel" value="${cancel.r_num }">
												</label>
											</div>
										</td>
										<td class="goDetail">${cancel.r_num }</td>
										<td>${cancel.m_id}</td>
										<td>${cancel.adminMemberVO.m_name}</td>
										<td>${cancel.adminMemberVO.m_phone}</td>
										<td>${cancel.r_cancelstatus}</td>
										<td>${cancel.c_num}</td>
										<td>${cancel.r_prerentaldate}</td>
										<td>${cancel.r_prereturndate}</td>
										<td>${cancel.r_date}</td>
										<td>${cancel.r_price}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="12">취소요청 정보가 없습니다.</td>
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

			</div>
		</div>
	</div>
</div>
<!-- /.table-responsive -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<!-- /#page-wrapper -->
<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	//승인버튼 클릭 시 처리 이벤트
	$("#cancel").click(function() {
		alert("취소요청을 승인하시겠습니까?");
		console.log($("#chk_cancel").val());
		$.ajax({
			url : "/admin/reservation/cancelOk",
			type : "post",
			data : {
				"r_num" : $("#chk_cancel").val()
			},
			dataType : "text",
			error : function() {
				alert("시스템 오류");
			},
			success : function(data) {
				if (data == 'success') {
					alert("취소승인 성공");
					location.href = "/admin/reservation/cancelOkList";
				} else {
					alert("변경 실패");
					return;
				}
			}
		});
	});
</script>