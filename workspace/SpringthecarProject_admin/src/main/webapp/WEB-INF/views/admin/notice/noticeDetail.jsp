<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header">공지사항 상세보기</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<form name="f_data" id="f_data" method="POST">
	<input type="hidden" name="n_num" value="${detail.n_num }" />
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p></p>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label>글번호</label><input class="form-control" name="n_num"
							value=${detail.n_num } readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name="n_title"
							value=${detail.n_title } readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name="n_content"
							readonly="readonly">${detail.n_content }</textarea>
					</div>

					<div class="form-group">
						<label>작성자</label><input class="form-control" name="n_writer"
							value=${detail.n_writer } readonly="readonly">
					</div>

					<div class="form-group">
						<label>작성일</label><input class="form-control" name="n_date"
							value=${detail.n_date } readonly="readonly">
					</div>

					<button type="button" class="btn btn-default" id="noticeUpdateBtn">수정</button>
					<button type="button" class="btn btn-info" id="noticeListBtn">목록</button>
					<button type="button" class="btn btn-danger" id="noticeDeleteBtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
</form>
<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	//목록버튼 클릭 시 처리 이벤트
	$("#noticeListBtn").click(function() {
		location.href = "/admin/notice/noticeList";
	});

	//삭제버튼 클릭 시 처리 이벤트
	$("#noticeDeleteBtn").click(function() {
		alert("정말로 삭제하시겠습니까?");
		$("#f_data").attr({
			"method" : "POST",
			"action" : "noticeDelete"
		});
		$("#f_data").submit();
	});

	//수정버튼 클릭 시 처리 이벤트
	$("#noticeUpdateBtn").click(function() {
		alert("공지사항을 수정하시겠습니까?");
		$("#f_data").attr({
			"method" : "POST",
			"action" : "noticeUpdate"
		});
		$("#f_data").submit();
	});
</script>