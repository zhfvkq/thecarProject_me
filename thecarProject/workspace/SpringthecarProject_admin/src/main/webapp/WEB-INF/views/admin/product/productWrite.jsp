<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header">차량 등록</h4>
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

				<form role="form" id="productWrite" name="productWrite"
					enctype="multipart/form-data">
					<div class="form-group">
						<label>차량 이미지</label> <input type="file" name="file" id="file">
					</div>
					<div class="form-group">
						<label>차량명</label> <input class="form-control" name="c_name"
							id="c_name">
					</div>
					<div class="form-group">
						<label>차량번호</label> <input class="form-control" name="c_num"
							id="c_num">
					</div>
					<div class="form-group">
						<label>차량종류</label> <input class="form-control" name="c_type"
							id="c_type">
					</div>
					<div class="form-group">
						<label>탑승인원</label> <input class="form-control" name="c_seater"
							id="c_seater">
					</div>
					<div class="form-group">
						<label>연료</label> <input class="form-control" name="c_fuel"
							id="c_fuel">
					</div>
					<div class="form-group">
						<label>연식</label> <input class="form-control" name="c_year"
							id="c_year">
					</div>
					<div class="form-group">
						<label>색상</label> <input class="form-control" name="c_color"
							id="c_color">
					</div>
					<div class="form-group">
						<label>대여자격</label> <input class="form-control" name="c_crt"
							id="c_crt">
					</div>
					<div class="form-group">
						<label>특이사항</label> <input class="form-control" name="c_else"
							id="c_else">
					</div>
					<div class="form-group">
						<label>상세 정보</label>
						<textarea class="form-control" rows="3" name="c_det" id="c_det"></textarea>
					</div>
					<div class="form-group">
						<label>종합보험</label> <input class="form-control" name="c_ins"
							id="c_ins">
					</div>
					<div class="form-group">
						<label>기본 대여비</label> <input class="form-control"
							name="c_rentalrate" id="c_rentalrate">
					</div>
					<div class="form-group">
						<label>자차면책</label> <input class="form-control" name="c_sii"
							id="c_sii">
					</div>

					<button type="submit" class="btn btn-default" id="productInsertBtn">등록</button>
					<button type="reset" class="btn btn-danger" id="productListBtn">취소</button>
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
			item.focus();
			return false;
		} else {
			return true;
		}
	}

	function chkFile(item) {
		/*
			배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우-1반환)
			jQuery.inArray(찾을 값, 검색 대상의 배열)
		 */
		var ext = item.val().split('.').pop().toLowerCase();
		if (jQuery.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
			alert('gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.');
			return false;
		} else {
			return true;
		}
	}

	//취소버튼 클릭 시 처리 이벤트
	$("#productListBtn").click(function() {
		location.href = "/admin/product/productList";
	});

	//등록버튼 클릭 시 처리 이벤트
	$("#productInsertBtn").click(function() {
		//입력값 체크
		if (!chkSubmit($("#c_name"), "차랑명을"))
			return;
		else if (!chkSubmit($("#c_num"), "차량번호를"))
			return;
		else if (!chkSubmit($("#c_type"), "차량종류를"))
			return;
		else if (!chkSubmit($("#c_seater"), "탑승인원을"))
			return;
		else if (!chkSubmit($("#c_fuel"), "연료를"))
			return;
		else if (!chkSubmit($("#c_year"), "연식을"))
			return;
		else if (!chkSubmit($("#c_color"), "색상을"))
			return;
		else if (!chkSubmit($("#c_crt"), "대여자격을"))
			return;
		else if (!chkSubmit($("#c_else"), "특이사항을"))
			return;
		else if (!chkSubmit($("#c_det"), "상세정보를"))
			return;
		else if (!chkSubmit($("#c_ins"), "종합보험을"))
			return;
		else if (!chkSubmit($("#c_rentalrate"), "기본 대여비를"))
			return;
		else if (!chkSubmit($("#c_sii"), "자차면책을"))
			return;
		else {
			if ($('#file').val() != "") {
				if (!chkFile($('#file')))
					return;
			}
			alert("차량을 등록하시겠습니까?");
			$("#productWrite").attr({
				"method" : "POST",
				"action" : "/admin/product/productInsert"
			});
			$("#productWrite").submit();
		}
	});
</script>