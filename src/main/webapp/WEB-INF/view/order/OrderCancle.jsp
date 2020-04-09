<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OrderCancel</title>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />

<style>

body {
	background-image:
		url('https://images.pexels.com/photos/1470589/pexels-photo-1470589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');
	background-size: cover;
	padding: 0;
	margin: 0;
	height: 100%;
}

.navbar-nav {
	width: 100%;
	text-align: center;
}

.navbar-nav>li {
	float: none;
	display: inline-block;
}

.navbar-nav>li>a {
	padding-top: 30px;
}

.navbar-nav>li.navbar-right {
	float: right !important;
}

#container {
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	padding: 20px 0;
}

#containerBox {
	display: inline-block;
	vertical-align: middle;
	width: 100%;
}

td {
	vertical-align: middle;
}

.blank {
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle;
}

#cancel {
	width: 150px;
	height: 30px;
	font-family: 'Roboto', sans-serif;
	font-size: 14px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: white;
	background-color: #6B66FF;
	border: none;
	border-radius: 35px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
	opacity: 0.8;
	margin-top: 20px;
}

#cancel:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}
</style>
</head>

<body>


	<nav class="navbar navbar-default">
		<div id="navBox">
			<%@ include file="../include/Nav.jsp"%>
		</div>
	</nav>

	<section id="container">
		<div id="containerBox">

			
			<table>
				<thead>
					<tr>
						<th>상품명</th>
						<th>결제 금액</th>
						<th>배송비</th>
						<th>판매자</th>
						<th>주문상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${orderList.productName}<br>
							${orderList.productPrice} / ${orderList.cnt}<br> 주문번호 :
							${order.orderNum}
						</td>
						<td><c:out value="${orderList.productPrice * orderList.cnt}"></c:out>
						</td>
						<td>${product.deliveryPrice}</td>
						<td>${seller.storeName}</td>
						<td>${order.state}</td>
					</tr>
				</tbody>
			</table>

			<form action="orderCancleComplete">
				<input type="hidden" name="orderNum" value="${orderList.orderNum}">
				<input type="submit" id="cancel" value="주문취소 요청">
			</form>
		</div>
		<span class="blank"></span>
	</section>



</body>
</html>