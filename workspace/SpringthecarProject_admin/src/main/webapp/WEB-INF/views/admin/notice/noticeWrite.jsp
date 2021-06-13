<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header">공지사항 작성</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<p></p>
			</div>
			<div class="panel-body">

				<form role="form" id="noticeWrite" name="noticeWrite">

					<div class="form-group">
						<label>제목</label> <input class="form-control" name="n_title"
							id="n_title">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name="n_content"
							id="n_content"></textarea>
					</div>
					<button type="submit" class="btn btn-default" id="noticeInsertBtn">등록</button>
					<button type="reset" class="btn btn-default" id="noticeListBtn">취소</button>
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>


<script type="text/javascript">
	/* 함수명: chkSubmit(유효성 체크 대상, 메시지 내용)
	 * 출력영역: alert으로.
	 * 예시 : if(!chkSubmit($('#keyword'),"검색어를")) return;
	 * */
	function chkSubmit(item, msg) {
		if (item.val().replace(/\s/g, "") == "") {
			alert(msg + " 입력해 주세요.");
			item.val("");
			item.focus();
			return false;
		} else {
			return true;
		}
	}
	//취소버튼 클릭 시 처리 이벤트
	$("#noticeListBtn").click(function() {
		location.href = "/admin/notice/noticeList";
	});

	//등록버튼 클릭 시 처리 이벤트
	$("#noticeInsertBtn").click(function() {
		//입력값 체크
		if (!chkSubmit($("#n_title"), "제목을"))
			return;
		else if (!chkSubmit($("#n_content"), "내용을"))
			return;
		else {
			alert("공지사항을 등록하시겠습니까?");
			$("#noticeWrite").attr({
				"method" : "POST",
				"action" : "noticeInsert"
			});
			$("#noticeWrite").submit();
		}
	});
</script>