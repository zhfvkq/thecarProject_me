<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 쓰기 화면</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/customerCenter.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {
		// 등록 버튼 클릭 시 처리 이벤트
		$("#questionInsertBtn").click(function() {
			// 입력값 체크
			if (!chkSubmit($('#q_title'), "제목을"))
				return;
			else if (!chkSubmit($('#q_pwd'), "비밀번호를"))
				return;
			else if (!chkSubmit($('#q_content'), "내용을"))
				return;
			else {

				if (!confirm("문의글을 등록하시겠습니까?")) {

					return false;

				} else {

					if ($('#file').val() != "") {
						if (!chkFile($('#file')))
							return;
					}

					$("#f_writeForm").attr({
						"method" : "POST",
						"action" : "/question/questionInsert"
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

			<%-- =============== 문의글 작성 폼 시작 =============== --%>
			<form id="f_writeForm" name="f_writeForm"
				enctype="multipart/form-data">
				<table id="q_Write">
					<tbody>
						<tr>
							<td class="tab" width="10%">제목</td>
							<td width="90%"><label id="label_title"><input
									type="text" name="q_title" id="q_title" placeholder="제목"></label>
							</td>
						</tr>
						<tr>

							<td class="tab">비밀번호</td>
							<td><input type="password" name="q_pwd" id="q_pwd"
								placeholder="비밀번호"></td>

						</tr>

						<tr>
							<td class="tab">내용</td>
							<td colspan="7"><textarea name="q_content" id="q_content"
									rows="15"></textarea></td>
						</tr>
						<tr>
							<td class="tab">첨부파일</td>
							<td><input type="file" name="file" id="file"></td>
						</tr>
					</tbody>
				</table>

				<%-- =============== 회원 연동 시 삭제 =============== --%>
				<%-- <input type="hidden" name="m_id" id="m_id" value="${question.m_id }" /> --%>

				<%-- =============== 답변 구현 시 삭제 =============== --%>
				<!-- <input type="hidden" name="q_rpState" id="q_rpState" value="미답변" /> -->


			</form>
			<%-- =============== 문의글 작성 폼 종료 =============== --%>

			<hr>

			<%-- =============== 하단 버튼 출력 시작 =============== --%>
			<div class="center">
				<input type="button" class="btn1 big" id="questionInsertBtn"
					value="등록"> <input type="button" class="big"
					id="questionListBtn" value="목록">
			</div>
			<%-- =============== 하단 버튼 출력 종료 =============== --%>

		</div>
	</div>
</body>
</html>