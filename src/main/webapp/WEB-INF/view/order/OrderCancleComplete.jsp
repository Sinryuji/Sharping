<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
총 ${result}건의 주문 취소 요청 완료<br>
총 환불 예정 금액 : <c:out value="${orderList.productPrice * orderList.cnt + product.deliveryPrice}"></c:out>
<form action="myPage">
	<input type="submit" value="주문 내역 조회">
</form>
</body>
</html>