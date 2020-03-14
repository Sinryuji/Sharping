<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangeSeller</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous">
</script>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<!-- 문자 인증 -->
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
					$("#changeSeller").removeAttr("disabled");
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}
</script>

<!-- 카카오 주소 찾기 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					$("#post").val(data.zonecode);
					$("#address").val(data.address);
					$("#addressEtc").focus();
					console.log(data);
				}
			}).open();
		}
	</script>
</head>
<body>
<form action="changeSellerComplete">
아이디:<input type="text" name="id" value="${authInfo.id}" readonly>
<h4>휴대폰 인증</h4>
휴대폰번호:<input type="text" name="phone" id="phone" />
<button type="button" onclick="sendSms();">전송</button><br> 
인증번호:<input type="text" name="confirmNumber" id="confirmNumber" />
<button type="button" onclick="phoneCheck();">인증</button><br>
<input type="hidden" path="random" id="random" value="${random }"/>
스토어이름:<input type="text" name="storeName" /><br> 
스토어주소:<input type="text" name="storeAddress" /><br>
스토어소개글:<input type="text" name="storeText" /><br>
우편번호:<input type="text" name="post" id="post" readonly /> &nbsp;
주소:<input type="text" name="address" id="address" readonly /> &nbsp;
상세주소:<input type="text" name="addressEtc" id="adressEtc"> &nbsp; <input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /> <br> 
계좌번호:<input type="text" name="bankAccount" /><br> 
은행코드:<input type="number" name="bankCode" /><br> 
<input type="submit" id="changeSeller" value="전환하기" disabled="true">
</form>
</body>
</html>