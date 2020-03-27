<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>RegistMember</title>
</head>
<body>
<form action="registCompleteMember" method="post"> 
이름 : <input type="text" name="name" id="name" required><br><br>
아이디 : <input type="text" id="id" name="id" required/>&nbsp&nbsp&nbsp<button class="idCheck" type="button">중복확인</button><br><br>
비밀번호 : <input type="text" name="password" id="pw" required/><br><br>
비밀번호 재입력 : <input type="text" name="passwordCheck" id="pwc" required/><br><br>
휴대폰번호 : <input type="text" name="phone" id="ph" required/><br><br>
이메일 : <input type="text" name="email" id="email" required/><br><br>
<input type="submit" class="submit" disabled="disabled" value="회원가입하기"><br><br>
</form>
<script> 

$(".submit").click(function(){

	 	if($("#name").val() == ""){
		   alert("이름을 입력해주세요.");
		   $("#name").focus();
	   	}else if($("#id").val() == ""){
			alert("아이디를 입력해주세요.");
			$("#id").focus();
		}else if($("#pw").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
		}else if($("#pwc").val() == ""){
			alert("비밀번호 재입력을 입력해주세요.");
			$("#pwc").focus();
		}else if($("#ph").val() == ""){
			alert("휴대폰 번호를 입력해주세요.");
			$("#ph").focus();
		}else if($("#email").val() == ""){
			alert("이메일을 입력해주세요.");
			$("#email").focus();
		} 
	  });

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