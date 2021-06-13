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
<title>답변</title>

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/reply.css" />

<!-- jQuery Framework 참조하기 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<!-- common.js -->
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	var replyNum, message = "작성시 입력한 비밀번호를 입력해 주세요.", pwdConfirm = 0, btnKind = "";
	$(function() {
		/** 기본 답변 목록 불러오기 */
		var q_num = "<c:out value='${detail.q_num}' />";

		listAll(q_num)

		/** 답변 내용 저장 이벤트 */
		$("#replyInsert").click(function() {
			// 작성자 이름에 대한 입력여부 검사
			if (!chkData("#rp_name", "이름을"))
				return;
			else if (!chkData("#rp_pwd", "비밀번호를"))
				return;
			else if (!chkData("#rp_title", "제목을"))
				return;
			else if (!chkData("#rp_content", "내용을"))
				return;
			else {

				var insertUrl = "/admin/replies/replyInsert";
				/** 글 저장을 위한 Post 방식의 Ajax 연동 처리 */
				$.ajax({
					url : insertUrl, //전송 url
					type : "post", // 전송 시 method 방식
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						q_num : q_num,
						rp_name : $("#rp_name").val(),
						rp_pwd : $("#rp_pwd").val(),
						rp_title : $("#rp_title").val(),
						rp_content : $("#rp_content").val()
					}),
					error : function() {
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},
					success : function(resultData) {
						if (resultData == "SUCCESS") {
							alert("답변 등록이 완료되었습니다.");
							dataReset();
							listAll(q_num);
						}
					}
				});

			}
		});

		/** 수정버튼 클릭시 수정폼 출력 */
		$(document)
				.on(
						"click",
						"#update_form",
						function() {
							$("#reset_btn").click();
							var currLi = $(this).parents("li");
							if (pwdConfirm == 0) {
								replyNum = currLi.attr("data-num");
								btnKind = "upBtn";
								pwdView(currLi);
							} else if (pwdConfirm == 1) {
								var conText = currLi.children().eq(1).html();
								//console.log("conText: " + conText);

								currLi.find("input[type='button']").hide();
								var conArea = currLi.children().eq(1);

								conArea.html("");
								var data = "<textarea name='content' id='content'>"
										+ conText + "</textarea>";
								data += "<input type='button' class='btn btn-default' id = 'update_btn' value='수정완료'>";
								data += "<input type='button' class='btn btn-danger' id = 'reset_btn' value='수정취소'>";
								conArea.html(data);
							}
						});

		/** 초기화 버튼 */
		$(document).on("click", "#reset_btn", function() {
			pwdConfirm = 0;
			btnKind = "";
			var conText = $(this).parents("li").find("textarea").html();
			$(this).parents("li").find("input[type='button']").show();
			var conArea = $(this).parents("li").children().eq(1);
			conArea.html(conText);
		});

		/** 글 수정을 위한  Ajax 연동 처리 */
		$(document).on("click", "#update_btn", function() {
			var rp_num = $(this).parents("li").attr("data-num");
			var rp_content = $("#content").val();
			if (!chkData("#content", "답변 내용을"))
				return;
			else {
				$.ajax({
					url : '/admin/replies/' + rp_num,
					type : 'put',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					data : JSON.stringify({
						rp_content : rp_content
					}),
					dataType : 'text',
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("수정 되었습니다.");
							listAll(q_num);
							pwdConfirm = 0;
						}
					}
				});
			}
		});

		/** 글 삭제를 위한  Ajax 연동 처리 */
		$(document).on("click", "#delete_btn", function() {
			$("#reset_btn").click();
			var currLi = $(this).parents("li")
			replyNum = currLi.attr("data-num");

			if (pwdConfirm == 0) {
				pwdView(currLi);
				btnKind = "delBtn";
			} else if (pwdConfirm == 1) {
				if (confirm("선택하신 답변을 삭제하시겠습니까?")) {
					$.ajax({
						type : 'delete',
						url : '/admin/replies/' + replyNum,
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "DELETE"
						},
						dataType : 'text',
						success : function(result) {
							console.log("result: " + result);
							if (result == 'SUCCESS') {
								alert("삭제 되었습니다.");
								listAll(q_num);
							}
						}
					});
				} else {
					pwdConfirm = 0;
				}
			}
		});

		/* 비밀번호 취소 버튼 클릭 시 처리 이벤트 */
		$(document).on("click", "#pwdResetBut", function() {
			//$(this).parents("li").removeClass("glayLayer");
			//$(this).parent().parent().removeClass("overLayer");
			$(this).parent().parent().html("");
		});

		$(document).on("focus", "passwd", function() {
			$(this).val("");
			var span = $(this).parents("form").find("span");
			span.removeClass("msg_error");
			span.addClass("msg_default");
			span.html(message);
		});

		/* 비밀번호 확인 버튼 클릭 시 처리 이벤트 */
		$(document).on("click", "#pwdCheckBut", function() {
			var form = $(this).parents("form");
			var pwd = form.find(".passwd");
			var rp_msg = form.find(".rp_msg");

			var up = $(this).parents("li").find("#update_form");
			var del = $(this).parents("li").find("#delete_btn");

			if (!formCheck(pwd, rp_msg, "비밀번호를"))
				return;
			else {
				$.ajax({
					url : "/admin/replies/pwdConfirm",
					type : "POST",
					data : "rp_num=" + replyNum + "&rp_pwd=" + pwd.val(),
					dataType : "text",
					error : function() {
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},
					success : function(resultData) {
						if (resultData == 0) { // 일치하지 않는 경우
							rp_msg.addClass("msg_error");
							rp_msg.text("입력한 비밀번호가 일치하지 않습니다.");
						} else if (resultData == 1) { // 일치할 경우
							pwdConfirm = resultData;
							$("#pwdResetBut").click();

							if (btnKind == "upBtn") {
								up.click();
							} else if (btnKind == "delBtn") {
								del.click();
							}
							btnKind = "";
							pwdConfirm = 0;
						}
					}
				});
			}
		});
	});

	function pwdView(area) {
		$("#pwdResetBut").click();
		var pwd_div = $("<div>");

		var data = "<form name='f_pwd'>"
		data += "<label for='passwd'>비밀번호 : </label>";
		data += "<input type='password' name='passwd' class='passwd'/> ";
		data += "<input type='button' class='btn btn-default' id = 'pwdCheckBut' value='확인' />";
		data += "<input type='button' class='btn btn-danger' id='pwdResetBut' value='취소' />";
		data += "<span class='rp_msg msg_default'>" + message
				+ "</span></form>";
		pwd_div.html(data);

		area.append(pwd_div);
	}

	// 리스트 요청 함수
	function listAll(q_num) {
		$("#comment_list").html("");
		var url = "/admin/replies/all/" + q_num;
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
		// 새로운 글이 추가될 li태그 객체
		var new_li = $("<li>");
		new_li.attr("data-num", rp_num);
		new_li.addClass("comment_item");

		// 작성자 정보가 지정될 <p>태그
		var writerp_p = $("<p>");
		writerp_p.addClass("writer");

		// 제목
		var title_span = $("<span>");
		title_span.addClass("title");
		title_span.html(rp_title);

		// 작성자 이름
		var writer_span = $("<span>");
		writer_span.html(" [ " + rp_name);

		// 작성일시
		var date_span = $("<span>");
		date_span.html(" / " + rp_date + " ] ");

		//띄어쓰기
		var space_span = $("<span>");
		space_span.html("  ");

		// 수정하기 버튼
		var up_input = $("<input>");
		up_input.attr({
			"type" : "button",
			"id" : "update_form",
			"value" : "수정"
		});
		up_input.addClass("btn btn-default");

		// 삭제하기 버튼
		var del_input = $("<input>");
		del_input.attr({
			"type" : "button",
			"id" : "delete_btn",
			"value" : "삭제"
		});
		del_input.addClass("btn btn-danger");

		// 내용
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(rp_content);

		// 조립하기
		writerp_p.append(title_span).append(writer_span).append(date_span)
				.append(up_input).append(space_span).append(del_input)
		new_li.append(writerp_p).append(content_p);
		$("#comment_list").append(new_li);
	}

	function dataReset() {
		$("#rp_name").val("");
		$("#rp_pwd").val("");
		$("#rp_content").val("");
	}
</script>
</head>
<body>
	<div id="replyContainer">
		<h1></h1>
		<div id="comment_write">
			<form id="comment_form">
				<div>
					<label for="rp_name">작성자</label> <input type="text" name="rp_name"
						id="rp_name" value="관리자" /> <label for="rp_pwd">비밀번호</label> <input
						type="password" name="rp_pwd" id="rp_pwd" /> <input type="button"
						class="btn btn-default" id="replyInsert" value="저장" />
				</div>
				<div>
					<label for="rp_title">답변 제목</label> <input type="text"
						id="rp_title" name="rp_title">
				</div>
				<div>
					<label for="rp_content">답변 내용</label>
					<textarea name="rp_content" id="rp_content"></textarea>
				</div>
			</form>
		</div>
		<ul id="comment_list">
			<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
		</ul>
	</div>
</body>
</html>
