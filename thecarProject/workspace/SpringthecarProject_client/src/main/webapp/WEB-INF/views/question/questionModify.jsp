<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 수정 화면</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/customerCenter.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/resources/include/js/common.js"></script>


<script type="text/javascript">
	$(function() {

		var value = "${updateData.q_file}";
		if (value != "") {
			var img = $("<img>");
			$('#imgView').hover(function() {
				img.attr({
					src : "/uploadStorage/question/${updateData.q_file}",
					width : "450px",
					height : "200px"
				});
				img.addClass("imgViewData");
				$('#imgArea').append(img);
			}, function() {
				img.remove();
			});
		} else {
			$('#imgView').hide();
		}

		// 수정 버튼 클릭 시 처리 이벤트
		$("#qustionUpdateBtn").click(function() {
			// 입력값 체크
			if (!chkSubmit($('#q_title'), "제목을"))
				return;
			else if (!chkSubmit($('#q_content'), "내용을"))
				return;
			else {
				if (!confirm("문의글을 수정하시겠습니까?")) {

					return false;

				} else {

					$("#f_writeForm").attr({
						"method" : "POST",
						"action" : "/question/questionUpdate"
					});
					$("#f_writeForm").submit();
				}
			}

		});

		// 목록 버튼 클릭 시 처리 이벤트
		$("#questionListBtn").click(function() {
			if (!confirm("문의글 목록으로 이동하시겠습니까?")) {

				return false;

			} else {

				location.href = "/question/questionList"
			}
		});

	});
</script>

</head>
<body>
	<div class="allBody">
		<%-- =============== 서브 상단 메뉴바 시작 =============== --%>

		<%@ include file="../template/client/cc_subtop_menu.jsp"%>
		<%-- =============== 서브 상단 메뉴바 종료 =============== --%>

		<div id="question" class="default_width">

			<%-- =============== 문의글 수정 폼 시작 =============== --%>
			<form id="f_writeForm" name="f_writeForm"
				enctype="multipart/form-data">
				<input type="hidden" id="q_num" name="q_num"
					value="${updateData.q_num }" /><input type="hidden" name="q_file"
					id="q_file" value="${updateData.q_file}" /> <input type="hidden"
					name="page" id="page" value="${param.page}" /> <input
					type="hidden" name="pageSize" id="pageSize"
					value="${param.pageSize}" /> <input type="hidden" name="q_rpState"
					id="q_rpState" value="${updateData.q_rpState}" />

				<table id="q_Modify">
					<tbody>
						<tr>
							<td class="tab" width="10%">제목</td>
							<td width="90%"><label id="label_title"><input
									type="text" name="q_title" id="q_title"
									value="${updateData.q_title }"></label></td>
						</tr>
						<tr>

							<td class="tab">비밀번호</td>
							<td><input type="password" name="q_pwd" id="q_pwd"
								value="${updateData.q_pwd }"></td>

						</tr>

						<tr>
							<td class="tab">내용</td>
							<td colspan="7"><textarea name="q_content" id="q_content"
									rows="15">${updateData.q_content}</textarea></td>
						</tr>
						<tr>
							<td class="tab">첨부파일</td>
							<td colspan="7"><input type="file" name="file" id="file">
								<span id="imgView">기존 이미지파일명: ${updateData.q_file}<span
									id="imgArea"> </span></span></td>
						</tr>
					</tbody>
				</table>
			</form>
			<%-- =============== 문의글 작성 폼 종료 =============== --%>

			<hr>

			<%-- =============== 하단 버튼 출력 시작 =============== --%>
			<div class="center">
				<input type="button" class="btn1 big" id="qustionUpdateBtn"
					value="수정"> <input type="button" class="big"
					id="questionListBtn" value="목록">
			</div>
			<%-- =============== 하단 버튼 출력 종료 =============== --%>

		</div>
	</div>
</body>
</html>