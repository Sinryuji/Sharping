<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
</head>
<body>
<h1>OrderPage</h1>
<h1>Basket</h1>
<h1>ProductQa</h1>
<h1>ChangeReturnProcess</h1>
<h1>ReviewList</h1>
<h1>WriteDeclare</h1>
<br>
상품명 : ${product.productName}<br>
상품설명 : ${product.productText}<br>
상품가격 : ${product.productPrice}<br>
상품썸네일 : ${product.productImage}<br>
상품사진 : ${product.stock}<br>
카테고리번호 : ${product.categoryNum}<br>
상품등록날짜 : ${product.productDate}<br>
판매자명 : ${seller.storeName}<br>
상품소재 : ${product.productMeterial}<br>
제조사 : ${product.manufacturer}<br>
제조일자 : ${product.mfDate}<br>
원산지 : ${product.origin}<br>
배송비 : ${product.deliveryPrice}
</body>
</html>