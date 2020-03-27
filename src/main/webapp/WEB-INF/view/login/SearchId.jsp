<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SearchId</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script>
/* 인증번호 발송 */
function sendSms() {
	
	
	
	$.ajax({
		url : "<%=request.getContextPath()%>/sendSms",
		data : {
			receiver : $("#phone").val(),
			random : $("#random").val()
		},
		type : "post",
		success : function(result) {
			if (result == "true") {
				alert("인증번호 전송!")
				console.log(result);
			} else {
				alert("인증번호 전송 실패");
			}
		}
	});
}

/* 인증번호 체크 */
function phoneCheck() {
	$.ajax({
		url : "<%=request.getContextPath()%>/smsCheck",
			type : "post",
			data : {
				authCode : $("#confirmNumber").val(),
				random : $("#random").val()
				
			},
			success : function(result) {
				if (result == "ok") {
					alert("번호 인증 성공");
				
					$("#searchIdPhone").removeAttr("disabled");
					
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}
	
//이메일인증	

$(function(){
	$(document).on("click","#emailBtn",function(){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/sendEmail",
			data:"email="+ $("#email").val() + "&random=" + $("#random").val(),
			success : function(data){
				if(data == false){
					alert("존재하지 않는 이메일입니다.")
				} else {
				alert("사용가능한 이메일입니다. 인증번호를 입력하세요");
				}
			},
		error: function(data){
			alert("에러발생");
			return false;
		}
	})
	})
	
	$(document).on("click","#emailCheckBtn",function(){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/emailCheck",
						data : "authCode=" + $('#emailCheck').val()
								+ "&random=" + $("#random").val(),
						success : function(data) {
							alert(data);
							if (data == "complete") {
								alert("인증되었습니다.");
							$("#searchIdEmail").removeAttr("disabled");
							} else if (data == "false") {
								alert("인증번호를 잘못 입력하였습니다.")
							}
						},
						error : function(data) {
							alert("에러가 발생했어요");
						}
					});
	});
	});
</script>
</head>
<body>

<h1>아이디 찾기 방법을 선택해주세요</h1>

<br>
<br>

<h1>가입시 입력한 이메일로 찾기</h1>
	<form action="searchIdEmail" method="get">
	<input type="text" id="email" name="email" placeholder="이메일을 입력하세요"/>
	<button type="button" id="emailBtn">이메일발송</button>
	<input type="text" id="emailCheck" placeholder="인증번호입력">
	<button type="button" id="emailCheckBtn">이메일인증</button>
	<input type="hidden" path="random" id="random" value="${random}"/>
	
	<input type="submit" id="searchIdEmail" name="searchIdEmail"
			value="찾기" disabled="true">
	</form>
<br>
<br>
<h1>문자 인증으로 찾기</h1>
<form action="searchIdPhone" method="get">

		휴대폰번호:<input type="text" name="phone" id="phone" />
		<button type="button" onclick="sendSms();">전송</button><br> 
		인증번호:<input type="text" name="confirmNumber" id="confirmNumber" />
		<button type="button" onclick="phoneCheck();">인증</button><br>
		<input type="hidden" path="random" id="random" value="${random }"/>

<input type="submit" id="searchIdPhone" name="searchIdPhone" value="찾기" disabled="true">



	</form>
</body>
</html>