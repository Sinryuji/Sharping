<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>InsertMoney</title>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>
<script src="//code.jquery.com/jquery.min.js"></script>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>
html {
	height: 100%;
}

body {
	background-image: url('https://images.pexels.com/photos/1470589/pexels-photo-1470589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');
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
	text-align: center;
	border: 2px solid transparent;
	width: 800px;
	background: pink;
	background-color: rgba(255, 217, 250, 0.5);
}

.blank {
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle;
}

.cancelBox {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

.can {
	display: inline-block;
	vertical-align: middle;
	font-weight: bold;
}

#sel {
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
	margin-top: 10px;
}

#sel:hover {
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

				<div class="cancelBox">
					<div class="can">
						<c:if test="${!empty authInfo}">
						[${authInfo.name}]님<br>
						</c:if>
						<c:if test="${empty authInfo}">
						비회원님<br>
						</c:if>
						총 ${result}건의 주문 취소 요청 완료<br> 
						총 환불 예정 금액 :
						<c:out value="${orderList.productPrice * orderList.cnt + product.deliveryPrice}"></c:out>
						
						<c:if test="${!empty authInfo}">
							<form action="myPage">
								<input type="submit" id="sel" value="주문 내역 조회">
							</form>
						</c:if>
						
						<c:if test="${empty authInfo}">
							<form action="login">
								<input type="submit" id="sel" value="주문 내역 조회">
							</form>
						</c:if>

					</div>

				</div>



		</div>
		<span class="blank"></span>
	</section>




	<script src="${pageContext.request.contextPath}/asset/js/bootstrap.js"></script>
</body>
</html>