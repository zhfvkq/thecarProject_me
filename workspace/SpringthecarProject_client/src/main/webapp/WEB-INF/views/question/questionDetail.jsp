<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 상세 화면</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/customerCenter.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {

		$("#pwdChk").hide();

		/* 첨부파일 이미지 보여주기 위한 속성 추가 */
		var file = "<c:out value='${detail.q_file}' />";
		if (file != "") {
			$("#fileImage").attr({
				src : "/uploadStorage/question/${detail.q_file}",
				width : "50%",
				height : "auto"
			});
		}

		// 수정 버튼 클릭 시 처리 이벤트
		$("#questionModifyBtn").click(function() {
			if (!confirm("문의글 수정 페이지로 이동하시겠습니까?")) {

				return false;

			} else {
				var goUrl = "/question/questionModify";
				$("#f_data").attr("action", goUrl);
				$("#f_data").submit();
			}
		});

		// 삭제 버튼 클릭 시 처리 이벤트
		$("#questionDeleteBtn").click(function() {
			var reply = "${detail.q_rpState}";
			console.log(reply);

			if (reply == '미답변') {

				$("#pwdChk").show();

			} else {
				alert("답변 완료된 문의글은 삭제할 수 없습니다.");
			}

		});

		/* 비밀번호 확인 버튼 클릭 시 처리 이벤트 */
		$("#pwdBtn").click(function() {
			questionPwdConfirm();
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

	function questionPwdConfirm() {

		if (!chkSubmit($('#q_pwd'), "비밀번호를"))
			return;
		else {
			$.ajax({
				url : "/question/questionPwdConfirm", //전송 url
				type : "post", // 전송 시 method 방식
				data : $("#f_pwd").serialize(), //폼전체 데이터전송
				dataType : "text",

				//실행시 오류 발생시
				error : function() {
					alert('시스템 오류 입니다. 관리자에게 문의 하세요');
				},

				//정상적으로 실행이 되었을 경우
				success : function(resultData) {
					var goUrl = ""; //이동할 경로를 저장할 변수

					if (resultData == "실패") {
						$("#q_pwd").val("");
						$("#q_pwd").focus();
						// 일치하지 않는 경우
						alert("비밀번호가 일치하지 않습니다.");
						return false;

					} else if (resultData == "성공") {
						// 일치할 경우
						if (!confirm("문의글을 삭제하시겠습니까?")) {
							$("#q_pwd").val("");
							$("#pwdChk").hide();
							return false;

						} else {
							goUrl = "/question/questionDelete";
						}
					}
					$("#f_data").attr("action", goUrl);
					$("#f_data").submit();

				}
			});

		}
	}
</script>
</head>
<body>
	<div class="allBody">
		<%-- =============== 서브 상단 메뉴바 시작 =============== --%>

		<%@ include file="../template/client/cc_subtop_menu.jsp"%>
		<%-- =============== 서브 상단 메뉴바 종료 =============== --%>

		<div id="question" class="default_width">
			<form name="f_data" id="f_data" method="POST">
				<input type="hidden" name="q_num" id="q_num"
					value="${detail.q_num }" /> <input type="hidden" name="page"
					id="page" value="${param.page}" /> <input type="hidden"
					name="pageSize" id="pageSize" value="${param.pageSize}" /> <input
					type="hidden" name="q_file" id="q_file" value="${detail.q_file}" />

			</form>
			<table>
				<tbody>
					<tr>
						<td class="tab" width="10%">제목</td>
						<td width="90%">${detail.q_title }</td>
					</tr>
					<tr>
						<td class="tab">작성자 정보</td>
						<td>아이디 : ${detail.m_id } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일 :
							${detail.q_date}
					</tr>
					<tr>
						<td class="tab">내용</td>
						<td colspan="7">
							<div class="mtop30 mbottom30">${detail.q_content }</div>
						</td>
					</tr>
					<c:if test="${detail.q_file !=''}">
						<tr>
							<td class="tab">첨부파일</td>
							<td colspan="7"><img id="fileImage"></td>
						</tr>
					</c:if>
					<tr id="pwdChk">
						<td class="tab"><label for="q_pwd" id="l_pwd">비밀번호 </label></td>
						<td><form name="f_pwd" id="f_pwd">
								<input type="hidden" name="q_num" id="i_num"
									value="${detail.q_num}" /><input type="password" name="q_pwd"
									id="q_pwd" placeholder="작성시 입력한 비밀번호" /> <input type="button"
									id="pwdBtn" value="확인" />
							</form></td>
					</tr>
				</tbody>
			</table>



			<jsp:include page="reply.jsp"></jsp:include>

			<hr>

			<div class="center">
				<input type="button" class="btn1 big" id="questionModifyBtn"
					value="수정"> <input type="button" class="btn3 big"
					id="questionDeleteBtn" value="삭제"> <input type="button"
					class="big" id="questionListBtn" value="목록">
			</div>

		</div>
	</div>
</body>
</html>