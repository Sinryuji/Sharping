
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- jquery -->
<script src="//code.jquery.com/jquery.min.js"></script>


<title>SearchResult</title>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/woocommerce-layout.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/woocommerce-smallscreen.css'
	type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/woocommerce.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/font-awesome.min.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/easy-responsive-shortcodes.css'
	type='text/css' media='all' />

<style>
html {
	height: 100%;
}

body {
	background-image:url('https://paulhueman.co.kr:443/bbs/data/file/banner/2009714319_4Qzoxjug_20544c1b6b40a4acc5de0a9c3bde79bbdb7d68db.jpg');
	background-size: cover;
	padding: 0;
	margin: 0;
	height: 100%;
	font-family: '맑은 고딕', verdana;
}

.wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 190px; /* footer height */
}

.navbar-nav {
	width: 100%;
	text-align: center;
}

.navbar-nav>li {
	float: none;
	display: inline-block;
}

.navbar-nav>li.navbar-right {
	float: right !important;
}

section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

div#containerBox {
	float: right;
	width: calc(100% - 200px - 20px);
	padding-bottom: 10px;
}

footer#footer {
	background: #e7e7e7;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	height: 190px;
	padding: 7px 0;
	text-align: center;
}

footer#footer div {
	display: inline-block;
	margin-right: 10px;
}

#btnMainSer, #btnSearch {
	width: 90px;
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

#btnMainSer:hover, #btnSearch:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}
</style>
</head>

<body>

	<div class="wrap">

		<nav class="navbar navbar-default">
			<div id="navBox">
				<%@ include file="../include/Nav.jsp"%>
			</div>
		</nav>

		<article>
			<section id="container">
				<div id="containerBox">
					<h4>최근 본 상품</h4>
				</div>
				<div class="containerTable">
					<div class="table">
						<table class="listSearch">
							<thead>
								<tr>
									<th>상품번호</th>
									<th>상품썸네일</th>
									<th>상품명</th>
									<th>상품가격</th>
									<th>배송가격</th>
									<th>판매자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty products}">
										<tr>
											<td colspan="10" align="center"><b>관심상품이 없습니다.</b></td>
										</tr>
									</c:when>
									<c:when test="${!empty products}">
										<c:forEach var="list" items="${products}">
											<tr>
												<td><c:out value="${list.productNum}" /></td>
												<%-- <td><c:out value="${list.productThumb}" /></td> --%>
												<td><img src="opload/${list.productThumb}"
													style="width: 50px;"></td>
												<td><a href="#"
													onClick="productView(<c:out value="${list.productNum}"/>)">
														<c:out value="${list.productName}" />
												</a></td>
												<td><c:out value="${list.productPrice}" /></td>
												<td><c:if test="${list.deliveryPrice == 0}">
														<c:out value="무료배송" />
													</c:if> <c:if test="${list.deliveryPrice != 0}">
														<c:out value="${list.deliveryPrice}" />
													</c:if></td>
												<td><c:out value="${list.id}" /></td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>

			</section>
		</article>



		<footer id="footer">
			<div id=footerBox>
				<%@ include file="../include/Footer.jsp"%>
			</div>
		</footer>

	</div>


	<script>
	
$("#btnSearch").click(function(){


 	if(document.getElementById("checkDelivery").checked == true){
		document.getElementById("checkDelivery").value = 'on'
	} else{
		document.getElementById("checkDelivery").value = 'off'
	}
		
	var url = "${pageContext.request.contextPath}"+"/productList";
	url = url + "?searchType=" + $("#searchType").val() + "&sortType=" + $("#sortType").val() + "&keyword=" + $("#keyword").val() 
			  + "&keyword2=" + $("#keyword2").val() + "&minPrice=" + $("#minPrice").val() + "&maxPrice=" + $("#maxPrice").val()
			  + "&checkDelivery=" + $("#checkDelivery").val();
	location.href = url;
	console.log(url);
});	

function productView(productNum){
	var url = "${pageContext.request.contextPath}"+"/product";
	url = url + "?productNum=" + productNum;
	location.href = url;
}
 
</script>

	<script
		src="${pageContext.request.contextPath}/resources/js/masonry.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/asset/js/bootstrap.js"></script>
</body>
</html>