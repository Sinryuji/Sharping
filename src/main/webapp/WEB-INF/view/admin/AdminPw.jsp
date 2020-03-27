<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
<form action="adminPwChk" method="post" onsubmit="return false">
관리자 비밀번호<input type="text" name="pw" id="pw"> 
		  <input type="button" value="확인" id="sm">
</form>
<input type="button" value="취소" onclick="window.close()">
<script>

	$('#sm').click(function(){
		var pw = $("#pw").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/adminPwChk",
				type : "POST",
				data : {
					pw : $("#pw").val()
				}, 
				dataType : "text", 
				
				success: function(data) {
					console.log("data:"+data);
					if(data == "true"){
						alert('승인되었습니다.');
						window.opener.document.getElementById("adp").value = data;
						window.close();
					}else{
						alert('비밀번호가 일치하지 않습니다. 다시 입력 해주세요.');
						$("#pw").focus();
					}	
				}
			});
	});
	
</script>
</body>
</html>