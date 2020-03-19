<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SellerPage</title>
</head>
<body>
<h1>Product</h1>
<h1>InfoDetail</h1>
<h1>DeliveryDetail</h1>
<h1>StatusChange</h1>
<h1>UploadProduct</h1><br>
<input type="button" onclick="location.href='${pageContext.request.contextPath}/productManage'" value="상품관리"><br>

<input type="button" onclick="location.href='${pageContext.request.contextPath}/orderManage'" value="주문관리">
</body>
</html>