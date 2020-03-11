<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script>
  src="https://code.jquery.com/jquery-2.1.4.min.js"
</script>
</head>
<body>
<h1>Regist</h1>
<h1>SearchIdPw</h1>
<h1>GeustOrderSearch</h1>
<h1>ChangePw</h1>
<form action="loginComplete">
		<p>
			<label>
				<input type="text" name="id" value="ID" style="color:gray" onfocus="this.value=''"/>
			</label>
		</p>
		<p>
			<label>
				<input type="text" name="password" value="Password" style="color:gray" onfocus="this.value=''"/>
				<input type="submit" value="로그인">
			</label>
		</p>
		<p>
			<input type="button" onclick="location.href='${pageContext.request.contextPath}/regist'" value="회원가입">&nbsp;&nbsp;<input type="button" onclick="location.href='${pageContext.request.contextPath}/searchIdChangePw'" value="ID/PW찾기">
		</p>
		<p>
			비회원 주문 조회
		</p>
		<p>
			<input type="text" name="" value="주문자명" style="color:gray" onfocus="this.value=''"/>&nbsp;&nbsp;
			<input type="text" name="" value="휴대폰 번호" style="color:gray" onfocus="this.value=''"/>&nbsp;&nbsp;
			<input type="text" name="" value="주문 비밀번호" style="color:gray" onfocus="this.value=''"/>&nbsp;&nbsp;<button onclick="">조회하기</button>
		</p>		
	</form>
</body>
</html>