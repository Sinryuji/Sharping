<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript"></script>
<meta charset="UTF-8">
<title>RegisterAdmin</title>
</head>
<body>


<form action="registerCompleteAdmin" method="post" target="AdminPage"> 
아이디 : <input type="text" id="adminId" name="adminId" required/>&nbsp&nbsp&nbsp<button class="adminIdCheck" type="button">중복확인</button><br><br>
비밀번호 : <input type="text" name="adminPassword" id="adminPassword" required/><br><br>
비밀번호 재입력 : <input type="text" name="adminPasswordCheck" id="adminPasswordCheck" required/><br><br>

		<input type="submit" class="submit" disabled="disabled" value="등록하기">
        <input type="button" value="창 닫기" onclick="window.close()">
</form>

<script>

$(".submit").click(function(){

 	if($("#adminId").val() == ""){
		alert("아이디를 입력해주세요.");
		$("#adminId").focus();
	}else if($("#adminPassword").val() == ""){
		alert("비밀번호를 입력해주세요.");
		$("#adminPassword").focus();
	}else if($("#adminPasswordCheck").val() == ""){
		alert("비밀번호 재입력을 입력해주세요.");
		$("#adminPasswordCheck").focus();
	}
  });
  
$(".adminIdCheck").click(function(){
	 
	 var query = {adminId : $("#adminId").val()};
	 
	 $.ajax({
	  url : "/Sharping/adminIdCheck",
	  type : "post",
	  data : query,
	  dataType : "json",
	  success : function(data) {
	  
		if(data == 1){
		   alert("중복된 아이디입니다.");
		   $(".submit").attr("disabled", "disabled");
		   $("#adminId").val('');
		   $("#adminId").focus();
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