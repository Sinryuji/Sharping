<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangePw</title>
</head>
<body>
<form action="changePwEmail" method="post">
이메일:<input type="text" name="email">
새 비밀번호:<input type="text" name="newPassword">
<input type="submit" value="이메일로 변경하기!">
</form>

<form action="changePwPhone" method="post">
phone:<input type="text" name="phone">
새 비밀번호:<input type="text" name="newPassword">
<input type="submit" value="폰번호 변경하기!">
</form>
</body>
</html>