<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
		<script>
		$('#selectProduct').click(function(){
			window.location.href='<%=request.getContextPath()%>/selectGuest';
			});
		</script>
</head>
<body>
	<h1>Regist</h1>
	<h1>SearchIdPw</h1>
	<h1>GeustOrderSearch</h1>
	<h1>ChangePw</h1>
	<form action="loginComplete">
		<p>
			<label> <input type="text" name="id" value="ID"
				style="color: gray" onfocus="this.value=''" />
			</label>
		</p>
		<p>
			<label> <input type="text" name="password" value="Password"
				style="color: gray" onfocus="this.value=''" /> <input type="submit"
				value="로그인">
			</label>
		</p>
		<p>
			<input type="button"
				onclick="location.href='${pageContext.request.contextPath}/regist'"
				value="회원가입">&nbsp;&nbsp;<input type="button"
				onclick="location.href='${pageContext.request.contextPath}/searchIdChangePw'"
				value="ID/PW찾기">
		</p>
	</form>
	<form action="selectGuest">
			<p>비회원 주문 조회</p>
		<p>
			<input type="text" name="guestName" value="${guestName }"style="color: gray" onfocus="this.value=''" />&nbsp;&nbsp; 
			<input type="text" name="guestPhone" value="${guestPhone }"	style="color: gray" onfocus="this.value=''" />&nbsp;&nbsp; 
			<input type="text" name="guestPassword" value="${guestPassword }" style="color: gray" onfocus="this.value=''" />&nbsp;&nbsp;
			<input type="submit" name="selectGuest" value="조회하기"/>
		</p>
		</form>

</body>
</html>