<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InfoChange</title>
</head>
<body>
<h1>MyPage</h1>
<h1>InfoDelete</h1>
<h1>MemberGrade</h1>
<form action="registCompleteMember" method="post"> 
아이디 : <input type="text" name="id"  id="id" value="" disabled="disabled" />
이름 : <input type="text" name="name" id="name" value="" disabled="disabled" ><br><br>
기존 비밀번호 : <input type="text" name="password" id="pw" required/><br><br>
새로운 비밀번호 : <input type="text" name="password" id="pw" required/><br><br>
비밀번호 재확인 : <input type="text" name="passwordCheck" id="pwc" required/><br><br>
휴대폰번호 : <input type="text" name="phone" id="ph" required/><br><br>
이메일 : <input type="text" name="email" id="email" required/><br><br>
<input type="submit" class="submit" disabled="disabled" value="회원정보 수정">&nbsp&nbsp
<input type="button" onclick="javascript:history.back();">
<input type="button" onclick="location.href='${pageContext.request.contextPath}/infoDelete'" value="구매자 회원가입">
</form>
</body>
</html>