<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Insert title here</title>
<script>
function sendSms() {
	$.ajax({
		url : "<%=request.getContextPath()%>/sendSms",
		data : {
			receiver : $("#newPhone").val()
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
					window.opener.document.getElementById("phone").value = document.getElementById("newPhone").value;
					self.close();

					
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}
</script>
</head>
<body>
	휴대폰번호:<input type="text" name="newPhone" id="newPhone"/>
	<button type="button" onclick="sendSms();">전송</button><br> 
	인증번호:<input type="text" name="confirmNumber" id="confirmNumber" />
	<button type="button" onclick="phoneCheck();">인증</button><br>
</body>
</html>