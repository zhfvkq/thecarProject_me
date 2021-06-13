<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 목록</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/customerCenter.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {

		console.log("Path-Name : " + window.location.pathname);

		// 검색 후 검색 대상과 검색 단어 출력
		var word = "<c:out value='${data.keyword}' />";
		var value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");

			$("#search").val("<c:out value='${data.search}' />");

			//:contains()는 특정 텍스트를 포함한 요소반환
			if ($("#search").val() == 'm_id')
				value = "#list tr td.writer";
			$(value + ":contains('" + word + "')").each(
					function() {
						var regex = new RegExp(word, 'gi');
						$(this).html(
								$(this).text().replace(
										regex,
										"<span class='required'>" + word
												+ "</span>"));
					});

		}

		/* 한페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하기 위한 설정*/
		if ("<c:out value='${data.pageSize}' />" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}' />");
		}

		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});

		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function() {
			if ($("#search").val() != "all") {
				if (!chkSubmit($('#keyword'), "검색할 아이디를 "))
					return;
			}
			goPage(1);
		});

		/* 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});

		/* 글쓰기 버튼 클릭 시 처리 이벤트 */
		$("#questionWriteBtn").click(function() {
			var session = '${sessionScope.login}';
			if (session == '') {
				alert("로그인 후 글쓰기가 가능합니다.");
				if (!confirm("로그인 창으로 이동하시겠습니까?")) {

					return false;

				} else {

					location.href = "/member/login";
				}

			} else {
				if (!confirm("문의글 작성 페이지로 이동하시겠습니까?")) {

					return false;

				} else {

					location.href = "/question/questionWrite";
				}
			}
		});

		/* 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function() {

			var q_num = $(this).parents("tr").attr("data-num");
			$("#q_num").val(q_num);
			console.log("문의글 번호 : " + q_num);

			var m_id = $(this).parents("tr").attr("data-writer");
			$("#writer").val(m_id);
			console.log("작성자 : " + m_id);

			var session = '${sessionScope.login.m_id}';

			if (session == m_id) {

				//상세 페이지로 이동하기 위해 form추가 (id : detailForm)
				$("#detailForm").attr({
					"method" : "get",
					"action" : "/question/questionDetail"
				});

				$("#detailForm").submit();

			} else {
				alert("문의글 상세보기는 작성자만 가능합니다.");

				return false;

			}

		});

	});

	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수 */
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/question/questionList"
		});
		$("#f_search").submit();

	}
</script>

</head>
<body>
	<div class="allBody">
		<%-- =============== 상세 페이지 이동을 위한 FORM=============== --%>
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="q_num" id="q_num"><input
				type="hidden" name="writer" id="writer"> <input
				type="hidden" name="page" value="${data.page}"> <input
				type="hidden" name="pageSize" value="${data.pageSize}">
		</form>

		<%-- =============== 서브 상단 메뉴바 시작 =============== --%>
		<%@ include file="../template/client/cc_subtop_menu.jsp"%>
		<%-- =============== 서브 상단 메뉴바 종료 =============== --%>

		<%-- =============== 문의글 리스트 시작 =============== --%>
		<div id="question" class="default_width">
			<%-- ================ 검색기능 시작 =============== --%>
			<div id="questionSearch">
				<form id="f_search" name="f_search">
					<input type="hidden" id="page" name="page" value="${data.page}">

					<table summary="검색">
						<colgroup>
							<col width="70%"></col>
							<col width="30%"></col>
						</colgroup>
						<tr>
							<td id="btd1"><select id="search" name="search">
									<option value="all">전체</option>
									<option value="m_id">아이디</option>
							</select> <input type="text" name="keyword" id="keyword"
								placeholder="검색어를 입력하세요." /> <input type="button" value="검색"
								id="searchData" /></td>
							<td></td>
							<td id="btd2"><select class="right" id="pageSize"
								name="pageSize">
									<option value="1">1줄</option>
									<option value="2">2줄</option>
									<option value="3">3줄</option>
									<option value="5">5줄</option>
									<option value="7">7줄</option>
									<option value="10">10줄</option>
							</select></td>
						</tr>
					</table>
				</form>
			</div>
			<%-- ================ 검색기능 종료 =============== --%>

			<table id="list">
				<tbody>
					<tr>
						<td class="tab" width="10%">글번호</td>
						<td class="tab" width="60%">제목</td>
						<td class="tab" width="10%">답변</td>
						<td class="tab" width="10%">작성자</td>
						<td class="tab" width="10%">작성일</td>
					</tr>

					<c:choose>
						<c:when test="${not empty questionList }">
							<c:forEach var="question" items="${questionList }"
								varStatus="status">
								<tr class="center" data-num="${question.q_num }"
									data-writer="${question.m_id }">
									<td class="center" id="q_number">${question.q_num }</td>
									<td class="goDetail left">${question.q_title }</td>
									<td>${question.q_rpState }</td>
									<td class="writer center">${question.m_id }</td>
									<td class="center">${question.q_date }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="center">등록된 문의글이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
			<hr>

			<%-- ============ 페이지 네비게이션 시작 ============ --%>
			<div class="paging">
				<tag:paging page="${param.page}" total="${total}"
					list_size="${data.pageSize}" />
			</div>
			<%-- =========== 페이지 네비게이션 종료 ============= --%>


			<%-- =============== 글쓰기 버튼 출력 시작 =============== --%>
			<input type="button" value="글쓰기" id="questionWriteBtn">
			<%-- =============== 글쓰기 버튼 출력 종료 =============== --%>

		</div>
		<%-- =============== 문의글 리스트 종료 =============== --%>
	</div>
</body>
</html>