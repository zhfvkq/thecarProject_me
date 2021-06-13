<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/customerCenter.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {

		// 검색 후 검색 대상과 검색 단어 출력
		var word = "<c:out value='${data.keyword}' />";
		var value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");

			$("#search").val("<c:out value='${data.search}' />");

			//:contains()는 특정 텍스트를 포함한 요소반환
			if ($("#search").val() == 'n_title')
				value = "#list tr td.goDetail";
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
				if (!chkSubmit($('#keyword'), "검색어를"))
					return;
			}
			goPage(1);
		});

		/* 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});

		/* 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function() {

			var n_num = $(this).parents("tr").attr("data-num");
			$("#n_num").val(n_num);
			console.log("공지사항 번호 : " + n_num);

			//상세 페이지로 이동하기 위해 form추가 (id : detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/notice/noticeDetail"
			});

			$("#detailForm").submit();

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
			"action" : "/notice/noticeList"
		});
		$("#f_search").submit();

	}
</script>

</head>


<body>

	<div class="allBody">
		<%-- =============== 상세 페이지 이동을 위한 FORM=============== --%>
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="n_num" id="n_num"> <input
				type="hidden" name="page" value="${data.page}"> <input
				type="hidden" name="pageSize" value="${data.pageSize}">
		</form>

		<%-- =============== 서브 상단 메뉴바 시작 =============== --%>

		<%@ include file="../template/client/cc_subtop_menu.jsp"%>
		<%-- =============== 서브 상단 메뉴바 종료 =============== --%>

		<%-- =============== 공지사항 리스트 시작 =============== --%>
		<div id="notice" class="default_width">
			<%-- ================ 검색기능 시작 =============== --%>
			<div id="noticeSearch">
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
									<option value="n_title">제목</option>
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
						<td class="tab" width="10%">작성자</td>
						<td class="tab" width="10%">작성일</td>
					</tr>

					<c:choose>
						<c:when test="${not empty noticeList }">
							<c:forEach var="notice" items="${noticeList }" varStatus="status">
								<tr class="center" data-num="${notice.n_num }">
									<td class="center" id="n_number">${notice.n_num }</td>
									<td class="goDetail left">${notice.n_title }</td>
									<td class="writer center">${notice.n_writer }</td>
									<td class="center">${notice.n_date }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="center">등록된 공지사항이 존재하지 않습니다.</td>
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

		</div>
		<%-- =============== 공지사항 리스트 종료 =============== --%>
	</div>
</body>
</html>