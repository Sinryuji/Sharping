<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NoticeContent</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/woocommerce-layout.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/woocommerce-smallscreen.css'
	type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/woocommerce.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/font-awesome.min.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/easy-responsive-shortcodes.css'
	type='text/css' media='all' />

<style>

#container {
	position:absolute;
	top:0;
	left:0;
	width:100%;
	height:100%;
	text-align:center
}

#containerBox {
	display:inline-block;
	vertical-align:middle;
}

.blank {
	display:inline-block;
	width:0;
	height:100%;
	vertical-align:middle;
}

.notice_noticeSubject {
	font-weight: 700;
	font-size: 22pt;
	margin: 10pt;
}

.notice_info_box {
	color: #6B6B6B;
	margin: 10pt;
}

.notice_adminId {
	font-size: 10pt;
	margin-right: 10pt;
}

.notice_noticeDate {
	font-size: 10pt;
}

.notice_noticeText {
	font-size: 12pt;
	margin: 10pt;
}

#update, #delete, #cancel, #delPro, #upPro {
	width: 100px;
	height: 30px;
	font-family: 'Roboto', sans-serif;
	font-size: 14px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: white;
	background-color: #6B66FF;
	border: none;
	border-radius: 35px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
	opacity: 0.8;
}

#update:hover, #delete:hover, #cancel:hover, #delPro:hover, #upPro:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}
</style>

</head>
<body>

	<article>
		<section id="container">
			<div id="containerBox">
				<form>
					<h2>※공지사항※</h2>

					<div class="notice_noticeSubject">
						<c:out value="${notice.noticeSubject}" />
					</div>
					<div class="notice_info_box">
						<span class="notice_adminId">
							<c:out value="${notice.adminId}" />,</span>
						<span class="notice_noticeDate">
							<c:out value="${notice.noticeDate}" /></span>
					</div>
					<div class="notice_noticeText">${notice.noticeText}</div>
					
					<input type="button" value="삭제하기" id="delete"> 
					<input type="button" value="수정하기" id="update"> 
					<input type="button" value="닫기" id="cancel" onclick="window.close()">
					<input type="hidden" id="adp" value="" /> 
					<input type="hidden" value="${notice.noticeNum}" name="noticeNum">

				</form>
			</div>
			<span class="blank"></span>
		</section>
	</article>


	<script>
		$("#delete")
				.click(
						function() {
							$(this).attr("disabled", "disabled");
							window.name = "NoticeContent";
							var popup = window.open("adminPw", "관리자 비밀번호 확인",
									"width = 550, height = 150");

							var timer = setInterval(
									function() {

										if (popup.closed) {
											clearInterval(timer);
											if ($("#adp").val() == '') {
												$("#delete").attr("disabled",
														true);
											} else {
												$("#delete").attr("disabled",
														false);
												$("#delete")
														.after(
																'<input type="submit" value="삭제" id="delPro" formaction="deleteNotice">');
												$("#delete").remove();
											}
											$("#delPro")
													.click(
															function() {

																var delConf = confirm("공지사항을 삭제하겠습니다. 진행하시겠습니까?");
																if (delConf == true) {
																	window
																			.close();
																	return true;
																} else if (delConf == false) {
																	window
																			.close();
																	return false;
																}
															});
										}
									}, 300)

						});

		$("#update")
				.click(
						function() {
							$(this).attr("disabled", "disabled");
							window.name = "NoticeContent";
							var popup = window.open("adminPw", "관리자 비밀번호 확인",
									"width = 550, height = 150");

							var timer = setInterval(
									function() {

										if (popup.closed) {
											clearInterval(timer);
											if ($("#adp").val() == '') {
												$("#update").attr("disabled",
														true);
											} else {
												$("#update").attr("disabled",
														false);
												$("#update")
														.after(
																'<input type="submit" value="수정" id="upPro" formaction="updateNotice">');
												$("#update").remove();
											}

											$("#upPro")
													.click(
															function() {

																var formup = $("form[role='form']");
																formup
																		.attr(
																				"method",
																				"get");
																formup.submit();

															});
										}
									}, 300)

						});
	</script>


</body>
</html>