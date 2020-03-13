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

var phoneChk = false;
var idChk = false;

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
					
					phoneChk = true;
					if(phoneChk == true && idChk == true){
					$("#changePwPhone").removeAttr("disabled");
					}
					
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}
	
/* 아이디 확인 */
function idCheck(){
	 var query = {id : $("#id").val()};
	 
	 $.ajax({
	  url : "/Sharping/idCheck",
	  type : "post",
	  data : query,
	  dataType : "json",
	  success : function(data) {
	  
		if(data == 1){
		   alert("확인 되었습니다.");
		   idChk = true;
		   if(phoneChk == true && idChk == true){
		   $("#changePwPhone").removeAttr("disabled");
		   }
	   	} else if(data == 0){
		   alert("아이디가 존재하지 않습니다.");
		   $("#id").val('');
		   $("#id").focus();
	   	}
	  }
	 });  // ajax 끝
	};
</script>
</head>
<body>

<h1> 비밀번호 재설정 하고자 하는 아이디를 입력해주세요</h1>

<br>
아이디 : <input type="text" id="id" name="id"/>&nbsp&nbsp&nbsp<input type="button" onClick="idCheck();" value="확인">
<br>

<h1> 비밀번호 재설정 방법을 선택해주세요</h1>

<br>
<br>

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
	<input type="hidden" path="random" id="random" value="${random }"/>
	새 비밀번호:<input type="text" name="newPassword">
	<input type="submit" value="폰번호로 변경하기!" id="changePwPhone" name="changePwPhone" disabled="ture">
</form>
</body>
</html>