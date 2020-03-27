<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InfoDelete</title>
</head>
<body>
	<form action="infoDeleteComplete" method="post">
		아이디 : <input type="text" name="id"  id="id" value="${authInfo.id}"/><br><br>
		비밀번호 : <input type="text" name="password" id="pw1" required /><br><br>
		<input type="submit" class="submit" value="회원 탈퇴">
	</form>
</body>
</html>