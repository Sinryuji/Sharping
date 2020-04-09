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

.payBox {
	text-align: center;
	margin-top: 50px;
}

.pay {
	display: inline-block;
	vertical-align: middle;
}

#btnpay {
	width: 100px;
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
}

#btnpay:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}

select, input {
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 50px;
	color: #666;
	text-align: center;
	padding: 6px;	
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

			<form action="payMoney">
				<div class="payBox">
					<div class="pay">
						<input type="hidden" value="${payNum}" name="payNum">
						 입금 은행 <select name="bankCode">
							<option value="none">은행을 선택해 주세요</option>
							<c:forEach var="bankCode" items="${bankInfo}" varStatus="status">
								<option value="${bankCode.bankCode}">${bankCode.bankName}
								</option>
							</c:forEach>
						</select>
					</div> 

					<div> 
						계좌번호 <input type="text" id="vaNum" name="vaNum" value="${payBank.vaNum}"><br>
					</div>
						
					<div>
						금액 <input type="text" id="paytPrice" name="payPrice" value=""><br>
						<input type="submit" id="btnpay" value="입금하기">
					</div>

				</div>
		</form>


		</div>
		<span class="blank"></span>
	</section>



	<script>
		$(document).ready(
				function() {
					var bankCode = "${payBank.bankCode}";
					$('select[name=bankCode]').val(bankCode).attr("selected",
							"selected");
				})
	</script>
	
	<script src="${pageContext.request.contextPath}/asset/js/bootstrap.js"></script>	
</body>
</html>