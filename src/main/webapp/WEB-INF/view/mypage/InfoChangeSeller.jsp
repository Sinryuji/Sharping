<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>RegistSeller</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script>

function popObj(){
    
    var pop_title = "popObj" ;
    var option = "width = 500, height = 500, top = 100, left = 200"; 
    var popObj = window.open("phoneCheck", pop_title , option) ;
     
   
}

/* var popObj = window.open('phoneCheck', 'PhoneCheck' ); */
	
/* function runTimer() {

var timer = setInterval(function(){
	
		if($("#fromInput").val() == 'true'){
			$("#submit").removeAttr("disabled");
			clearInterval(timer);
	}
}, 500);
} */

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
					
					$("#submit").removeAttr("disabled");
					
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}
</script>
<script>

function openPop(){
    
    var pop_title = "팝~" ;
    var option = "width = 500, height = 500, top = 100, left = 200"; 
    var win = window.open("", pop_title , option) ;
     
    var changePw = document.changePw ;
    changePw.target = pop_title ;
    changePw.action = "infoChangePw" ;
     
    changePw.submit() ;
}


</script>
<!-- 카카오 주소 찾기 api -->
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					$("#newPost").val(data.zonecode);
					$("#newAddress").val(data.address);
					$("#newAddressEtc").focus();
					console.log(data);
				}
			}).open();
		}
	</script>
</head>
<body>
		이름 : <input type="text" name="name" id="name" value="${authInfo.name}" readonly ><br><br>
	<form name="changePw" id="changePw" method="post">
		<!-- 아이디 : <input type="text" name="id"  id="id" value="${authInfo.id}"/><br><br> -->
		기존 비밀번호 : <input type="text" name="password" id="pw1" required /><br><br>
		새로운 비밀번호 : <input type="text" name="newPassword" id="pw2" required /><br><br>
		비밀번호 재확인 : <input type="text" name="passwordCheck" id="pwc" required/>&nbsp&nbsp
		<input type="button" onclick="openPop();" value="변경"><br><br>
	</form>
	
	<form action="infoChangeSellerComplete" method="post">
		아이디 : <input type="text" name="id"  id="id" value="${authInfo.id}" readonly/><br><br>
		휴대폰번호:<input type="text" name="newPhone" id="phone" value="${authInfo.phone}" readonly/>
		<button type="button" onclick="popObj();">변경</button><br><br> 
		이메일:<input type="text" name="newEmail" value="${authInfo.email}" /><br><br>
		스토어이름:<input type="text" name="newStoreName" value="${seller.storeName }" /><br><br> 
		스토어주소:<input type="text" name="newStoreAddress" value="${seller.storeAddress }" /><br><br>
		스토어소개글:<input type="text" name="newStoreText" value="${seller.storeText }" /><br><br>
		우편번호:<input type="text" name="newPost" id="newPost" value="${member.post}" readonly /> &nbsp;
		주소:<input type="text" name="newAddress" id="newAddress" value="${member.address}" readonly /> &nbsp;
		상세주소:<input type="text" name="newAddressEtc" id="newAddressEtc" value="${member.addressEtc}"> &nbsp; <input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /> <br><br>
		계좌번호:<input type="text" name="newBankAccount" value="${seller.bankAccount }" /><br><br> 
		은행코드:<input type="number" name="newBankCode" value="${seller.bankCode }" /><br><br> 
		<input type="submit" id="submit" class="submit" value="회원정보 수정" >&nbsp&nbsp
		<input type="button" onclick="javascript:history.back();" value="정보수정 취소">&nbsp&nbsp
		<input type="button" onclick="location.href='${pageContext.request.contextPath}/infoDelete'" value="회원탈퇴">
	</form>
	


</body>
</html>