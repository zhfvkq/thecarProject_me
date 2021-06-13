<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 화면</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/customerCenter.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {

		// 목록 버튼 클릭 시 처리 이벤트
		$("#noticeListBtn").click(function() {
			location.href = "/notice/noticeList"
		});

	});
</script>
</head>
<body>
	<div class="allBody">
		<%-- =============== 서브 상단 메뉴바 시작 =============== --%>

		<%@ include file="../template/client/cc_subtop_menu.jsp"%>

		<%-- =============== 서브 상단 메뉴바 종료 =============== --%>

		<div id="notice" class="default_width">
			<form name="f_data" id="f_data" method="POST">
				<input type="hidden" name="n_num" id="n_num"
					value="${detail.n_num }" /> <input type="hidden" name="page"
					id="page" value="${param.page}" /> <input type="hidden"
					name="pageSize" id="pageSize" value="${param.pageSize}" />
			</form>
			<table>
				<tbody>
					<tr>
						<td class="tab" width="10%">제목</td>
						<td width="90%">${detail.n_title }</td>
					</tr>
					<tr>
						<td class="tab">작성자 정보</td>
						<td>아이디 : ${detail.n_writer }
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일 : ${detail.n_date}
					</tr>
					<tr>
						<td class="tab">내용</td>
						<td colspan="7">
							<div class="mtop30 mbottom30">${detail.n_content }</div>
						</td>
					</tr>
				</tbody>
			</table>


			<hr>

			<div class="center">
				<input type="button" class="big" id="noticeListBtn" value="목록">
			</div>

		</div>
	</div>
</body>
</html>