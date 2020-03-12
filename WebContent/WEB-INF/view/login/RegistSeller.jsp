<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>RegistSeller</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script>
function sendSms() {
	$.ajax({
		url : "<%=request.getContextPath()%>/sendSms",
		data : {
			receiver : $("#phone").val()
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
function phoneCheck() {
	$.ajax({
		url : "<%=request.getContextPath()%>/smsCheck",
			type : "post",
			data : {
				code : $("#confirmNumber").val()
			},
			success : function(result) {
				if (result == "ok") {
					alert("번호 인증 성공");
					$("#regist").removeAttr("disabled");
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}
</script>
</head>
<body>
	<form action="registCompleteSeller" method="post">
		이름:<input type="text" name="name"><br> 
		아이디:<input type="text" name="id" /><br> 
		비밀번호:<input type="text" name="password" /><br> 
		비밀번호 재입력:<input type="text" name="passwordCheck" /><br> 
		휴대폰번호:<input type="text" name="phone" id="phone" />
		<button type="button" onclick="sendSms();">전송</button><br> 
		인증번호:<input type="text" name="confirmNumber" id="confirmNumber" />
		<button type="button" onclick="phoneCheck();">인증</button><br>
		이메일:<input type="text" name="email" /><br> 
		스토어이름:<input type="text" name="storeName" /><br> 
		스토어주소:<input type="text" name="storeAddress" /><br>
		스토어소개글:<input type="text" name="storeText" /><br>
		우편번호:<input type="text" name="post" /><br>
		주소:<input type="text" name="address" /><br> 
		계좌번호:<input type="text" name="bankAccount" /><br> 
		은행코드:<input type="number" name="bankCode" /><br> 
		<input type="submit" name="regist" id="regist" value="회원가입하기" disabled="true">
	</form>
</body>
</html>