<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header">등록 차량 수정</h4>
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

				<form role="form" id="productUpdate" name="productUpdate"
					enctype="multipart/form-data">
					<input type="hidden" id="c_no" name="c_no"
						value="${updateData.c_no }" /><input type="hidden" name="c_image"
						id="c_image" value="${updateData.c_image}" /> <input
						type="hidden" name="page" id="page" value="${param.page}" /> <input
						type="hidden" name="pageSize" id="pageSize"
						value="${param.pageSize}" />


					<div class="form-group">
						<label>상품번호</label><input class="form-control" name="c_no"
							value=${updateData.c_no } readonly="readonly">
					</div>
					<div class="form-group">
						<label>차량 이미지</label><input type="file" name="file" id="file">
						<input class="form-control" name="c_image"
							value=" ${updateData.c_image}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>차량명</label> <input class="form-control" name="c_name"
							id="c_name" value="${updateData.c_name }">
					</div>
					<div class="form-group">
						<label>차량번호</label> <input class="form-control" name="c_num"
							id="c_num" value="${updateData.c_num }">
					</div>
					<div class="form-group">
						<label>차량종류</label> <input class="form-control" name="c_type"
							id="c_type" value="${updateData.c_type }">
					</div>
					<div class="form-group">
						<label>탑승인원</label> <input class="form-control" name="c_seater"
							id="c_seater" value="${updateData.c_seater }">
					</div>
					<div class="form-group">
						<label>연료</label> <input class="form-control" name="c_fuel"
							id="c_fuel" value="${updateData.c_fuel }">
					</div>
					<div class="form-group">
						<label>연식</label> <input class="form-control" name="c_year"
							id="c_year" value="${updateData.c_year }">
					</div>
					<div class="form-group">
						<label>색상</label> <input class="form-control" name="c_color"
							id="c_color" value="${updateData.c_color }">
					</div>
					<div class="form-group">
						<label>대여자격</label> <input class="form-control" name="c_crt"
							id="c_crt" value="${updateData.c_crt }">
					</div>
					<div class="form-group">
						<label>특이사항</label> <input class="form-control" name="c_else"
							id="c_else" value="${updateData.c_else }">
					</div>
					<div class="form-group">
						<label>상세정보</label>
						<textarea class="form-control" rows="3" name="c_det" id="c_det">${updateData.c_det }</textarea>
					</div>
					<div class="form-group">
						<label>종합보험</label> <input class="form-control" name="c_ins"
							id="c_ins" value="${updateData.c_ins }">
					</div>
					<div class="form-group">
						<label>기본 대여비</label> <input class="form-control"
							name="c_rentalrate" id="c_rentalrate"
							value="${updateData.c_rentalrate }">
					</div>
					<div class="form-group">
						<label>자차면책</label> <input class="form-control" name="c_sii"
							id="c_sii" value="${updateData.c_sii }">
					</div>
					<div class="form-group">
						<label>등록일</label><input class="form-control" name="c_date"
							value=${updateData.c_date } readonly="readonly">
					</div>
					<button type="submit" class="btn btn-default" id="productUpdateBtn">등록</button>
					<button type="reset" class="btn btn-info" id="productListBtn">목록</button>
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	// submit 전 입력값 체크
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

	//목록버튼 클릭 시 처리 이벤트
	$("#productListBtn").click(function() {
		alert("차량 수정을 취소하시겠습니까?");
		location.href = "/admin/product/productList";
	});

	//등록버튼 클릭 시 처리 이벤트
	$(function() {

		$("#productUpdateBtn").click(function() {
			//입력값 체크
			if (!chkSubmit($("#c_name"), "차량명을"))
				return false;
			else if (!chkSubmit($("#c_num"), "차량번호를"))
				return false;
			else if (!chkSubmit($("#c_type"), "차량종류를"))
				return false;
			else if (!chkSubmit($("#c_seater"), "탑승인원을"))
				return false;
			else if (!chkSubmit($("#c_fuel"), "연료를"))
				return false;
			else if (!chkSubmit($("#c_year"), "연식을"))
				return false;
			else if (!chkSubmit($("#c_color"), "색상을"))
				return false;
			else if (!chkSubmit($("#c_crt"), "대여자격을"))
				return false;
			else if (!chkSubmit($("#c_else"), "특이사항을"))
				return false;
			else if (!chkSubmit($("#c_det"), "상세정보를"))
				return false;
			else if (!chkSubmit($("#c_ins"), "종합보험을"))
				return false;
			else if (!chkSubmit($("#c_rentalrate"), "기본 대여비를"))
				return false;
			else if (!chkSubmit($("#c_sii"), "자차면책을"))
				return false;
			else {
				alert("차량 정보를 수정하시겠습니까?");
				$("#productUpdate").attr({
					"method" : "POST",
					"action" : "/admin/product/productUpdate"
				});
				$("#productUpdate").submit();
			}
		});
	});
</script>