<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원정보</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
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
							<th>회원번호</th>
							<th>회원아이디</th>
							<th>회원명</th>
							<th>생년월일</th>
							<th>성별</th>
							<th>이메일</th>
							<th>연락처</th>
							<th>등록일</th>
							<th>탈퇴유무</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty memberList }">
								<c:forEach var="member" items="${memberList }"
									varStatus="status">
									<tr class="odd gradeX" data-num="${member.m_no }">
										<td>${member.m_no}</td>
										<td class="goDetail">${member.m_id }</td>
										<td>${member.m_name }</td>
										<td>${member.m_brd }</td>
										<td>${member.m_gender }</td>
										<td>${member.m_email }</td>
										<td>${member.m_phone }</td>
										<td>${member.m_joinDate }</td>
										<td>${member.m_exit }</td>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="9">현재 회원이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>

				<div style="text-align: center">
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
	function fn_paging(pageNum) {
		if (!pageNum)
			return false;

		var form = document.searchForm;

		form.curPage.value = pageNum;
		form.action = "/admin/member/memberList";
		form.method = "GET";
		form.submit();
	}
</script>