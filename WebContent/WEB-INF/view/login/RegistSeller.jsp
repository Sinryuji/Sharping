<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegistSeller</title>
</head>
<body>
<form action="registCompleteSeller" method="post">
이름:<input type="text" name="name">
아이디:<input type="text" name="id"/>
비밀번호:<input type="text" name="password"/>
비밀번호 재입력:<input type="text" name="passwordCheck"/>
휴대폰번호:<input type="text" name="phone"/>
이메일:<input type="text" name="email"/>
스토어이름:<input type="text" name="storeName"/>
스토어주소:<input type="text" name="storeAddress"/>
스토어소개글:<input type="text" name="storeText"/>
우편번호:<input type="text" name="post"/>
주소:<input type="text" name="address"/>
계좌번호:<input type="text" name="bankAccount"/>
은행코드:<input type="number" name="bankCode"/>
<input type="submit" value="회원가입하기">
</form>
</body>
</html>