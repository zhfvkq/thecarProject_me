<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>


<%@include file="../includes/header.jsp"%>
<script type="text/javascript" src="/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">1:1 문의</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- <div class="panel-heading">
				<button type="button" id="insertFormBtn" class="btn btn-primary">글쓰기</button>
			</div> -->
			<!-- /.panel-heading -->
			<!-- 상세 페이지 이동을 위한 form -->
			<form name="questionDetail" id="questionDetail">
				<input type="hidden" name="q_num" id="q_num"> <input
					type="hidden" name="page" value="${data.page}"> <input
					type="hidden" name="pageSize" value="${data.pageSize}">
			</form>
			<%-- ================ 검색기능 시작 =============== --%>
			<div id="questionSearch">
				<form id="f_search" name="f_search">
					<input type="hidden" id="page" name="page" value="${data.page}" />
					<input type="hidden" id="order_by" name="order_by"
						value="${data.order_by}" /> <input type="hidden" id="order_sc"
						name="order_sc" value="${data.order_sc}" />
					<table summary="검색">
						<colgroup>
							<col width="70%"></col>
							<col width="30%"></col>
						</colgroup>
						<tr>
							<td id="btd1"><label>검색조건</label> <select id="search"
								name="search">
									<option value="all">전체</option>
									<option value="q_title">제목</option>
									<option value="m_id">아이디</option>
							</select> <input type="text" name="keyword" id="keyword" value="검색어를입력하세요" />
								<input type="button" value="검색" id="searchData" /></td>
							<td id="btd2">&nbsp;한페이지에 <select id="pageSize"
								name="pageSize">
									<option value="1">1줄</option>
									<option value="2">2줄</option>
									<option value="3">3줄</option>
									<option value="5">5줄</option>
									<option value="7">7줄</option>
									<option value="10">10줄</option>
							</select>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<%-- ================ 검색기능 종료 =============== --%>

			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example-">
					<thead>
						<tr>
							<th data-value="q_num" class="order">글번호 <c:choose>
									<c:when
										test="${data.order_by=='q_num'and data.order_sc=='ASC'}">▲</c:when>
									<c:when
										test="${data.order_by=='q_num'and data.order_sc=='DESC'}">▼</c:when>
									<c:otherwise>▲</c:otherwise>
								</c:choose>
							</th>
							<th>제목</th>
							<th>답변</th>
							<th class="borcle">작성자</th>
							<th data-value="q_date" class="order">작성일 <c:choose>
									<c:when
										test="${data.order_by=='q_date'and data.order_sc=='ASC'}">▲</c:when>
									<c:when
										test="${data.order_by=='q_date'and data.order_sc=='DESC'}">▼</c:when>
									<c:otherwise>▲</c:otherwise>
								</c:choose>
							</th>

						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty questionList }">
								<c:forEach var="question" items="${questionList }"
									varStatus="status">
									<tr class="odd gradeX" data-num="${question.q_num }">
										<td>${count - status.index}</td>
										<td class="goDetail">${question.q_title }</td>
										<td>${question.q_rpState }</td>
										<td class="name">${question.m_id }</td>
										<td>${question.q_date }</td>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<%-- ============ 페이지 네비게이션 시작 ============ --%>
				<div id="boardPage" style="text-align: center">
					<tag:paging page="${param.page}" total="${total}"
						list_size="${data.pageSize}" />
				</div>
				<%-- =========== 페이지 네비게이션 종료 ============= --%>
			</div>
		</div>
	</div>
</div>
<!-- /.table-responsive -->

<!-- /#page-wrapper -->
<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	$(function() {

		/* //글쓰기 버튼 시 처리 이벤트
			$("#insertFormBtn").click(function() {
				alert("공지사항을 작성하시겠습니까?");
				location.href = "/admin/question/questionWrite";
			}); */

		//제목 클릭시 상세페이지 이동을 위한 처리 이벤트
		$(".goDetail").click(function() {
			var q_num = $(this).parents("tr").attr("data-num");
			$("#q_num").val(q_num);
			console.log("글번호 : " + q_num);

			//상세 페이지로 이동하기 위해 form추가 (id : "questionDetail")
			$("#questionDetail").attr({
				"method" : "get",
				"action" : "questionDetail"
			});
			$("#questionDetail").submit();
		});
	});

	$(function() {
		/* 검색 후 검색 대상과 검색 단어 출력 */
		var word = "<c:out value='${data.keyword}' />";
		var value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");
			if ($("#search").val() != 'q_content') {
				//:contains()는 특정 텍스트를 포함한 요소반환
				if ($("#search").val() == 'q_title')
					value = "#list tr td.goDetail";
				else if ($("#search").val() == 'm_id')
					value = "#list tr td.name";
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
		}
		/* 한페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로
		유지하기 위한 설정*/
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
		$(".order").click(function() {
			var order_by = $(this).attr("data-value");
			console.log("선택값 : " + order_by);
			$("#order_by").val(order_by);
			if ($("#order_sc").val() == 'DESC') {
				$("#order_sc").val('ASC');
			} else {
				$("#order_sc").val('DESC');
			}
			goPage(1);
		});

		/* 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
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
			"action" : "/admin/question/questionList"
		});
		$("#f_search").submit();
	}
</script>