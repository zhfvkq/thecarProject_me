<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>답글</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/customerCenter.css" />

<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {
		/** 기본 답글 목록 불러오기 */
		var q_num = "<c:out value='${detail.q_num}' />";
		listAll(q_num)

	});

	// 리스트 요청 함수
	function listAll(q_num) {
		$("#comment_list").html("");
		var url = "/replies/all/" + q_num;
		$.getJSON(url, function(data) {
			console.log(data.length);

			$(data).each(function() {
				var rp_num = this.rp_num;
				var rp_name = this.rp_name;
				var rp_title = this.rp_title;
				var rp_content = this.rp_content;
				var rp_date = this.rp_date;
				addNewItem(rp_num, rp_name, rp_title, rp_content, rp_date);
			});
		}).fail(function() {
			alert("답변 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});
	}
	/** 새로운 글을 화면에 추가하기 위한 함수*/
	function addNewItem(rp_num, rp_name, rp_title, rp_content, rp_date) {

		// 새로운 글이 추가될 td태그 객체
		var new_tr = $("<tbody><tr>");
		new_tr.attr("data-num", rp_num);
		new_tr.addClass("comment_item");

		//답변 <td>태그
		var tab_td = $("<td class='tab' width='10%'>답변</td>");
		tab_td.addClass("tab");

		// 답변 본문 <td>태그
		var reply_td = $("<td colspan='7'>");
		reply_td.addClass("reply");

		// 제목
		var title_span = $("<span>");
		title_span.html("<b>" + rp_title + "</b>");

		// 작성자 정보의 이름
		var name_span = $("<span>");
		name_span.addClass("name");
		name_span.html(" [" + rp_name + "");

		// 작성일시
		var date_span = $("<span>");
		date_span.html(" / " + rp_date + " ] <br><br>");

		// 내용
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(rp_content);

		// 조립하기

		reply_td.append(title_span).append(name_span).append(date_span).append(
				content_p)
		new_tr.append(tab_td).append(reply_td);
		$("#comment_list").append(new_tr);
	}
</script>
</head>
<body>
	<table id="comment_list">
	</table>
</body>
</html>
