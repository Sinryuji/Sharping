<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangePw</title>
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
					$("#changePwPhone").removeAttr("disabled");
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}
</script>
</head>
<body>

<h1>가입시 입력한 이메일로 비밀번호 재설정</h1>
<form action="changePwEmail" method="post">
이메일:<input type="text" name="email">
새 비밀번호:<input type="text" name="newPassword">
<input type="submit" value="이메일로 변경하기!">
</form>
<br>
<br>
<h1>문자 인증으로 비밀번호 재설정</h1>
<form action="changePwPhone" method="post">
	휴대폰번호:<input type="text" name="phone" id="phone" />
	<button type="button" onclick="sendSms();">전송</button><br> 
	인증번호:<input type="text" name="confirmNumber" id="confirmNumber" />
	<button type="button" onclick="phoneCheck();">인증</button><br>
	새 비밀번호:<input type="text" name="newPassword">
	<input type="submit" value="폰번호로 변경하기!" id="changePwPhone" name="changePwPhone" disabled="ture">
</form>
</body>
</html>