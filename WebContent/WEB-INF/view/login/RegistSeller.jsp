<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>RegistSeller</title>
</head>
<body>
<form action="registCompleteSeller" method="post">
이름 : <input type="text" name="name"><br><br>
아이디 : <input type="text" id="id" name="id"/>&nbsp&nbsp&nbsp<button class="idCheck" type="button">중복확인</button><br><br>
비밀번호 : <input type="text" name="password"/><br><br>
비밀번호 재입력 : <input type="text" name="passwordCheck"/><br><br>
휴대폰번호 : <input type="text" name="phone"/><br><br>
이메일 : <input type="text" name="email"/><br><br>
스토어이름 : <input type="text" name="storeName"/><br><br>
스토어주소 : <input type="text" name="storeAddress"/><br><br>
스토어소개글 : <input type="text" name="storeText"/><br><br>
우편번호 : <input type="text" name="post"/><br><br>
주소 : <input type="text" name="address"/><br><br>
계좌번호 : <input type="text" name="bankAccount"/><br><br>
은행코드 : <input type="number" name="bankCode"/><br><br>
<input type="submit" class="submit" value="회원가입하기">
</form>
<script>

$(".idCheck").click(function(){
	 
	 var query = {id : $("#id").val()};
	 
	 $.ajax({
	  url : "/Sharping/idCheck",
	  type : "post",
	  data : query,
	  dataType : "json",
	  success : function(data) {
	  
		if(data == 1){
		   alert("중복된 아이디입니다.");
		   $(".submit").attr("disabled", "disabled");
		   $("#id").val('');
		   $("#id").focus();
	   	} else if(data == 0){
		   alert("사용가능한 아이디입니다.");
		   $(".submit").removeAttr("disabled");
	   	}
	  }
	 });  // ajax 끝
	});

</script>
</body>
</html>