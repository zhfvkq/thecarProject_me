<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header">등록 차량 상세보기</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<form name="f_data" id="f_data" method="POST">
	<input type="hidden" name="c_no" value="${detail.c_no }" /> <input
		type="hidden" name="page" id="page" value="${param.page}" /> <input
		type="hidden" name="pageSize" id="pageSize" value="${param.pageSize}" />
	<input type="hidden" name="c_image" id="c_image"
		value="${detail.c_image}" />
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p></p>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label>상품번호</label><input class="form-control" name="c_no"
							value=${detail.c_no } readonly="readonly">
					</div>
					<div class="form-group">
						<label>차량명</label> <input class="form-control" name="c_name"
							value=${detail.c_name } readonly="readonly">
					</div>
					<div class="form-group">
						<label>차량번호</label> <input class="form-control" name="c_num"
							value=${detail.c_num } readonly="readonly">
					</div>
					<div class="form-group">
						<label>차량종류</label> <input class="form-control" name="c_type"
							value=${detail.c_type } readonly="readonly">
					</div>
					<div class="form-group">
						<label>탑승인원</label> <input class="form-control" name="c_seater"
							value=${detail.c_seater } readonly="readonly">
					</div>
					<div class="form-group">
						<label>연료</label> <input class="form-control" name="c_fuel"
							value=${detail.c_fuel } readonly="readonly">
					</div>
					<div class="form-group">
						<label>연식</label> <input class="form-control" name="c_year"
							value=${detail.c_year } readonly="readonly">
					</div>
					<div class="form-group">
						<label>색상</label> <input class="form-control" name="c_color"
							value=${detail.c_color } readonly="readonly">
					</div>
					<div class="form-group">
						<label>대여자격</label> <input class="form-control" name="c_crt"
							value=${detail.c_crt } readonly="readonly">
					</div>
					<div class="form-group">
						<label>특이사항</label> <input class="form-control" name="c_else"
							value=${detail.c_else } readonly="readonly">
					</div>
					<div class="form-group">
						<label>상세 정보</label>
						<textarea class="form-control" rows="3" name="c_det"
							readonly="readonly">${detail.c_det }</textarea>
					</div>
					<div class="form-group">
						<label>종합보험</label> <input class="form-control" name="c_ins"
							value=${detail.c_ins } readonly="readonly">
					</div>
					<div class="form-group">
						<label>기본 대여비</label> <input class="form-control"
							name="c_rentalrate" value=${detail.c_rentalrate }
							readonly="readonly">
					</div>
					<div class="form-group">
						<label>자차면책</label> <input class="form-control" name="c_sii"
							value=${detail.c_sii } readonly="readonly">
					</div>
					<c:if test="${detail.c_image !=''}">
						<div class="form-group">
							<label>차량 이미지</label> <img id="fileImage">
						</div>
					</c:if>




					<button type="button" class="btn btn-default" id="productUpdateBtn">수정</button>
					<button type="button" class="btn btn-info" id="productListBtn">목록</button>
					<button type="button" class="btn btn-danger" id="productDeleteBtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
</form>
<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	$(function() {
		/* 첨부파일 이미지 보여주기 위한 속성 추가 */
		var file = "<c:out value='${detail.c_image}' />";
		if (file != "") {
			$("#fileImage").attr({
				src : "/uploadStorage/product/${detail.c_image}",
				width : "50%",
				height : "auto"
			});
		}

	});

	//목록버튼 클릭 시 처리 이벤트
	$("#productListBtn").click(function() {
		location.href = "/admin/product/productList";
	});

	//삭제버튼 클릭 시 처리 이벤트
	$("#productDeleteBtn").click(function() {
		alert("정말로 삭제하시겠습니까?");
		$("#f_data").attr({
			"method" : "POST",
			"action" : "/admin/product/productDelete"
		});
		$("#f_data").submit();
	});

	//수정버튼 클릭 시 처리 이벤트
	$("#productUpdateBtn").click(function() {
		alert("차량을 수정하시겠습니까?");
		$("#f_data").attr({
			"method" : "POST",
			"action" : "/admin/product/productModify"
		});
		$("#f_data").submit();
	});
</script>