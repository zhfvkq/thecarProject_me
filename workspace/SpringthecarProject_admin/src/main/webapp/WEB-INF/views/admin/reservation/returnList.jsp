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
			
			<!-- /.panel-heading -->
			<!-- 상세 페이지 이동을 위한 form -->
			<form name="returnBtn" id="returnBtn">
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
								<th>대여상태</th>
								<th>차량번호</th>
								<th>대여일시</th>
								<th>반납예상일시</th>
								<th>반납일시</th>
								<th>이용요금</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty selectReturnList }">
									<c:forEach var="returnchk" items="${selectReturnList }"
										varStatus="status">
										<tr class="odd gradeX" data-num="${returnchk.r_num }">
											<td>
												<div class="checkbox">
													<label> <input type="checkbox" name="chk_return"
														id="chk_return" value="${returnchk.r_num }" style="">
													</label>
												</div>
											</td>
											<td class="goDetail">${returnchk.r_num }</td>
											<td>${returnchk.m_id}</td>
											<td>${returnchk.adminMemberVO.m_name}</td>
											<td>${returnchk.adminMemberVO.m_phone}</td>
											<td>${returnchk.r_status}</td>
											<td>${returnchk.c_num}</td>
											<td>${returnchk.r_rentaldate}</td>
											<td>${returnchk.r_prereturndate}</td>
											<td>${returnchk.r_returndate}</td>
											<td>${returnchk.r_price}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="9">대여중인 차량이 없습니다.</td>
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
			</form>
		</div>
	</div>
</div>
<!-- /.table-responsive -->

<!-- /#page-wrapper -->
<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	
</script>