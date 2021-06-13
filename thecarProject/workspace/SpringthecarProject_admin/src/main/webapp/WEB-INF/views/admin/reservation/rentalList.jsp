<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">대여/반납</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<button type="button" id="return" class="btn btn-primary">반납</button>
			</div>
			<!-- /.panel-heading -->
			<!-- 상세 페이지 이동을 위한 form -->
			<form name="returnBtn" id="returnBtn">
				<input type="hidden" name="r_num" id="r_num">
				<div class="panel-body">

					<div id="outter">
						<div style="float: right;">
							<select id="cntPerPage" name="sel" onchange="selChange()">
								<option value="5"
									<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
									보기</option>
								<option value="10"
									<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
									보기</option>
								<option value="15"
									<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
									보기</option>
								<option value="20"
									<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
									보기</option>
							</select>
						</div>
						<!-- 옵션선택 끝 -->

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
									<th>대여상태</th>
									<th>차량번호</th>
									<th>대여일시</th>
									<th>반납예상일시</th>
									<th>이용요금</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty selectRentalList }">
										<c:forEach var="rental" items="${selectRentalList }"
											varStatus="status">
											<tr class="odd gradeX" data-num="${rental.r_num }">
												<td>
													<div class="checkbox">
														<label> <input type="checkbox" name="chk_return"
															id="chk_return" value="${rental.r_num }" style="">
														</label>
													</div>
												</td>
												<td class="goDetail">${rental.r_num }</td>
												<td>${rental.m_id}</td>
												<td>${rental.adminMemberVO.m_name}</td>
												<td>${rental.adminMemberVO.m_phone}</td>
												<td>${rental.r_status}</td>
												<td>${rental.c_num}</td>
												<td>${rental.r_rentaldate}</td>
												<td>${rental.r_prereturndate}</td>
												<td>${rental.r_price}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="8">대여중인 차량이 없습니다.</td>
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
													href="/admin/reservation/rentalList?page=${(pagingVO.section-1)*10 }">&lt;</a></li>
											</c:if>
											<c:choose>
												<c:when test="${pageNum == pagingVO.page}">
													<li><a
														href="/admin/reservation/rentalList?page=${pageNum }">${pageNum }</a></li>
												</c:when>

												<c:when test="${pagingVO.maxPage >= pageNum}">
													<li><a
														href="/admin/reservation/rentalList?page=${pageNum }">${pageNum }</a></li>
												</c:when>
											</c:choose>
											<c:if
												test="${pagingVO.maxSection > pagingVO.section && pageNum == pagingVO.section*10 }">
												<li><a
													href="/admin/reservation/rentalList?page=${pagingVO.section*10 + 1 }">&gt;</a></li>
											</c:if>
										</c:forEach>
									</ul>
								</c:if>
							</nav>
						</div>

					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- /.table-responsive -->

<!-- /#page-wrapper -->
<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	//페이징처리
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "rentalList?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}

	//반납버튼 클릭 시 처리 이벤트
	$("#return").click(function() {
		alert("반납완료로 변경하시겠습니까?");
		console.log($("#chk_return").val());
		$.ajax({
			url : "/admin/reservation/return",
			type : "post",
			data : {
				"r_num" : $("#chk_return").val()
			},
			dataType : "text",
			error : function() {
				alert("시스템 오류");
			},
			success : function(data) {
				if (data == 'success') {
					alert("반납완료 성공");
					location.href = "/admin/reservation/rentalList";
				} else {
					alert("변경 실패");
					return;
				}
			}
		});
	});
</script>