function sendSms() {
	$.ajax({
		url : "<%=request.getContextPath()%>/sendSms",
		data : {
			receiver : $("#phone").val()
		},
		type : "post",
		success : function(result) {
			if (result == "true") {
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
			} else {
				alert("번호 인증 실패");
			}
		}
	});
}
