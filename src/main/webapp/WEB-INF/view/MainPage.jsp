<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
</head>
<body>
	<h1>SellerChange</h1>
	<h1>Basket</h1>
	<h1>CS</h1>
	<h1>ProductList</h1>
	<c:if test="${empty authInfo}">
		<p>환영합니다.</p>

		<p>
			
		<a href="<c:url value='/regist'/>">[회원 가입]</a>
		
		<a href="<c:url value='/login'/>">[로그인]</a>
		
		</p>

	</c:if>

	<c:if test="${!empty authInfo}">
		<p>${authInfo.name}님 환영합니다.</p>

		
		<a href="<c:url value='/logout'/>">[로그아웃]</a> <br>
		
		<a href="<c:url value='/infoChange'/>">
				[회원정보 수정]
			</a>
		
	<c:if test="${authInfo.sellerCheck == 'false' }">
		<a href="<c:url value='/changeSeller'/>">[판매하기]</a>
		
	</c:if>

	</c:if>
</body>
</html>