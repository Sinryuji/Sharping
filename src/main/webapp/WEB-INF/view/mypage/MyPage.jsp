<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
<h1 style="text-align:center;"><a href="<c:url value='/main'/>"> 메인 </a></h1><br>
<h1>WishList</h1>
<h1>InfoChange</h1>
<h1>SellerChange</h1>
<input type="button" onclick="location.href='${pageContext.request.contextPath}/deliveryAddress'" value="배송주소록"><br>
<h1>CS</h1>
<h1>MyReviewList</h1>
<h1>SellerDetail</h1>
<h1>Store</h1>
<h1>ProductQa</h1>
<h1>ChangeProduct</h1>
<h1>ReturnProduct</h1>
</body>
</html>