<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InfoChangeMember</title>
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

	<h1>MyPage</h1>
	<h1>InfoDelete</h1>
	<h1>MemberGrade</h1>
	
	이름 : <input type="text" name="name" id="name" value="${authInfo.name}" disabled="disabled" ><br><br>

	<form name="changePw" id="changePw" method="post">
	
		아이디 : <input type="text" name="id"  id="id" value="${authInfo.id}" readonly/><br><br>
		기존 비밀번호 : <input type="text" name="password" id="pw1" required /><br><br>
		새로운 비밀번호 : <input type="text" name="newPassword" id="pw2" required /><br><br>
		비밀번호 재확인 : <input type="text" name="passwordCheck" id="pwc" required/>&nbsp&nbsp
	<input type="button" onclick="openPop();" value="변경"><br><br>
	
	</form>
		
	<form action="infoChangeMemberComplete" method="post">
	
		<br>휴대폰번호 : <input type="text" name="newPhone" id="newPhone" value="${authInfo.phone}" required/><br><br>
		이메일 : <input type="text" name="newEmail" id="newEmail" value="${authInfo.email}" required/><br><br>
		아이디 : <input type="text" name="id"  id="id" value="${authInfo.id}"/><br><br>
		우편번호:<input type="text" name="newPost" id="newPost" value="${member.post}" readonly /> &nbsp;
		주소:<input type="text" name="newAddress" id="newAddress" value="${member.address}" readonly /> &nbsp;
		상세주소:<input type="text" name="newAddressEtc" id="newAddressEtc" value="${member.addressEtc}"> &nbsp; <input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /> <br> 
		<input type="submit" class="submit" value="회원정보 수정">&nbsp&nbsp
		<input type="button" onclick="javascript:history.back();" value="정보수정 취소">&nbsp&nbsp
		<input type="button" onclick="location.href='${pageContext.request.contextPath}/infoDelete'" value="회원탈퇴">
	
	</form>
</body>
</html>