<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="button" onclick="location.href='${pageContext.request.contextPath}/searchId'" value="아이디찾기"><br>

<input type="button" onclick="location.href='${pageContext.request.contextPath}/changePw'" value="비밀번호 재설정">
</body>
</html>