<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header">1:1문의 상세보기</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<form name="f_data" id="f_data" method="POST">
	<input type="hidden" name="q_num" value="${detail.q_num }" />
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p></p>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label>글번호</label><input class="form-control" name="q_num"
							value=${detail.q_num } readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name="q_title"
							value=${detail.q_title } readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name="q_content"
							readonly="readonly">${detail.q_content }</textarea>
					</div>

					<div class="form-group">
						<label>작성자</label><input class="form-control" name="m_id"
							value=${detail.m_id } readonly="readonly">
					</div>

					<div class="form-group">
						<label>작성일</label><input class="form-control" name="q_date"
							value=${detail.q_date } readonly="readonly">
					</div>

					<div class="form-group">
						<label>답변상태</label> <input class="form-control" id="q_rpState"
							name="q_rpState" value=${detail.q_rpState } readonly="readonly">

					</div>

					<div>
						<jsp:include page="reply.jsp"></jsp:include>
					</div>


					<!-- 					<button type="button" class="btn btn-default" id="questionUpdateBtn">수정</button>
 -->
					<button type="button" class="btn btn-default" id="replyUpdate">답변완료</button>
					<button type="button" class="btn btn-info" id="questionListBtn">목록</button>
					<!-- 					<button type="button" class="btn btn-danger" id="questionDeleteBtn">삭제</button>
 -->
				</div>
			</div>
		</div>
	</div>
</form>
<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	//답변완료 버튼 클릭 시 처리 이벤트
	$("#replyUpdate").click(function() {

		if (!confirm("답변 완료하시겠습니까?")) {

			return false;

		} else {

			$("#q_rpState").val("답변완료");

			$("#f_data").attr({
				"method" : "POST",
				"action" : "/admin/question/rpStateUpdate"
			});
			$("#f_data").submit();
		}
	});

	//목록 버튼 클릭 시 처리 이벤트
	$("#questionListBtn").click(function() {

		if (!confirm("목록으로 이동하시겠습니까?")) {

			return false;

		} else {

			location.href = "/admin/question/questionList";
		}
	});

	/* //삭제버튼 클릭 시 처리 이벤트
	$("#questionDeleteBtn").click(function() {
		alert("정말로 삭제하시겠습니까?");
		$("#f_data").attr({
			"method" : "POST",
			"action" : "questionDelete"
		});
		$("#f_data").submit();
	});

	//수정버튼 클릭 시 처리 이벤트
	$("#questionUpdateBtn").click(function() {
		alert("
	1:1문의을 수정하시겠습니까?");
		$("#f_data").attr({
			"method" : "POST",
			"action" : "questionUpdate"
		});
		$("#f_data").submit();
	}); */
</script>