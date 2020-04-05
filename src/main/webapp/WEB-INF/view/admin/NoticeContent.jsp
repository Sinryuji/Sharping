<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeContent</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<style>
body {

	padding-top: 70px;
	padding-bottom: 30px;

}

.notice_noticeSubject {

	font-weight : 700;
	font-size : 22pt;
	margin : 10pt;

}

.notice_info_box {

	color : #6B6B6B;
	margin : 10pt;

}

.notice_adminId {

	font-size : 10pt;
	margin-right : 10pt;

}

.notice_noticeDate {

	font-size : 10pt;

}

.notice_noticeText {

	color : #444343;
	font-size : 12pt;
	margin : 10pt;

}

</style>

</head>
<body>
		<form>
		<div class="container" role="main">
			<h2>공지사항</h2>

			<div class="bg-white rounded shadow-sm">
				<div class="notice_noticeSubject"><c:out value="${notice.noticeSubject}"/></div>
				<div class="notice_info_box">
					<span class="notice_adminId"><c:out value="${notice.adminId}"/>,</span><span class="notice_noticeDate"><c:out value="${notice.noticeDate}"/></span>
				</div>
				<div class="notice_noticeText">${notice.noticeText}</div>
			</div>
			</div>
			

			<input type="button" value="삭제하기" id="delete">
			<input type="button" value="수정하기" id="update">
			<input type="button" value="닫기" onclick="window.close()">
			<input type="hidden" id="adp" value=""/>
			<input type="hidden" value="${notice.noticeNum}" name="noticeNum">
			
		</form>
		
		<script>

	$("#delete").click(function(){
		$(this).attr("disabled", "disabled");
		window.name = "NoticeContent";
		var popup = window.open("adminPw","관리자 비밀번호 확인" ,"width = 520, height = 250");
		
		var timer = setInterval(function(){
			
			if(popup.closed) {
				clearInterval(timer);
				if($("#adp").val() == ''){
					$("#delete").attr("disabled", true);
				}	
				else {
					$("#delete").attr("disabled", false);
					$("#delete").after('<input type="submit" value="삭제" id="delPro" formaction="deleteNotice">');
			 		$("#delete").remove(); 
				}
				$("#delPro").click(function(){
		
					var delConf = confirm("공지사항을 삭제하겠습니다. 진행하시겠습니까?");	
					if(delConf == true){
							window.close();
							return true;
					}else if(delConf == false){		
							window.close();
							return false;
					}	
				});
			}
		}, 300)

	});
	
	$("#update").click(function(){
		$(this).attr("disabled", "disabled");
		window.name = "NoticeContent";
		var popup = window.open("adminPw","관리자 비밀번호 확인" ,"width = 520, height = 250");
		
		var timer = setInterval(function(){
			
			if(popup.closed) {
				clearInterval(timer);
				if($("#adp").val() == ''){
					$("#update").attr("disabled", true);
				}	
				else {
					$("#update").attr("disabled", false);
					$("#update").after('<input type="submit" value="수정" id="upPro" formaction="updateNotice">');
			 		$("#update").remove(); 
				}
				
				$("#upPro").click(function(){
					
							var formup = $("form[role='form']");
							formup.attr("method", "get");
							formup.submit(); 
							


				});
			}
		}, 300)

	});
		
		
</script>


</body>
</html>