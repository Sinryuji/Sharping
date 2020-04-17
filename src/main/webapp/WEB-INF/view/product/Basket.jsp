<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Basket</title>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>
<script src="//code.jquery.com/jquery.min.js"></script>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />

<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all' />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<style>
html {
	height: 100%;
}

body {
	/* background-image:url('https://paulhueman.co.kr:443/bbs/data/file/banner/2009714319_4Qzoxjug_20544c1b6b40a4acc5de0a9c3bde79bbdb7d68db.jpg'); */
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

.navbar-nav>li>a {
	padding-top: 30px;
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

.switch {
	position: relative;
	display: inline-block;
	width: 52px;
	height: 25px;
	vertical-align:middle;
}

.table2 {
	border-top: none;
	border-bottom: none;
}

.table2 tr {
	float: right;
	border-top: none;	
}

.table2 th {
	padding-right: 45px;
	padding-left: 65px;
}

#order {
	width: 90px;
	height: 40px;
	font-family: 'Roboto', sans-serif;
	font-size: 18px;
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

#order:hover {
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
					<h4>장바구니</h4>
				</div>
				
				<form id="orderPageByBasket" action="orderPageByBasket">
					<table>
						<c:choose>
							<c:when test="${empty basketList }">
								<tr>
									<td>장바구니에 담긴 상품이 없어</td>
								</tr>
							</c:when>
							
							<c:when test="${!empty basketList}">
								<thead>
									<tr>
										<th><a href="<%=request.getContextPath()%>/store?storeName=${storeNames}" title="storeNames">${storeNames}</a></th>
										<th>상품이미지</th>
										<th>상품명</th>
										<th>수량</th>
										<th>상품가격</th>
										<th>배송비</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach var="basket" items="${basketList}" varStatus="status">
										<tr>
											<!--체크박스  -->
											<td>
												<div class="switch">
													<input type="checkbox" name="basketNums" class="checkboxs" id="checkedProduct${status.index}"
													 style="width:15px; height:15px;" value="${basket.basketNum}" checked />
												</div>
											</td>
											
												<!--상품이미지  -->												
											<td>
												<div class="img">
													<img src="opload/${basket.productThumb}" width="50" height="50">
												</div>
											</td>
											
												<!--상풍명  -->
											<td>
												<div class="proInfo">
													<a href="#" class="productName" onClick="productView(${basket.productNum})">${basket.productName}</a>
												</div>
											</td>
											
												<!--상품수량  -->											
											<td>
												<div class="cntInfo">
													<input type="number" class="cnt" id="${status.index}" name="cnt${status.index }" min="1" max="${basket.stock}" value="${basket.cnt}" /> 
														<input type="hidden" name="cnt" id="cnt" value="${basket.cnt}" /> 
														<input type="hidden" name="payPrice" id="payPrice" value="${basket.productPrice*basket.cnt}" />
												</div>
											</td>
											
												<!-- 상품가격 -->
											<td>
												<div class="price">
													<input type="number" id="price${status.index}" value="${basket.productPrice*basket.cnt}" /> 
													<input type="hidden" id="pricee${status.index}" value="${basket.productPrice}">원
												</div>
											</td>
											
												<!--배송비  -->
											<td>
												<div class="deliprice">${basket.deliveryPrice}원</div>
											</td>

												<!--삭제버튼  -->
											<td>
												<div class="delete">
													<a href="<%=request.getContextPath()%>/deleteBasket?basketNum=${basket.basketNum}">
													<img src="${pageContext.request.contextPath}/resources/images/X버튼.png"></a>
													<input type="hidden" id="hiddenOn${status.index }" value="${basket.optionNum}">
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:when>
						</c:choose>
					</table>
					
					<table class="table2">
						<c:choose>
							<c:when test="${totalPrice != 0}">
							<tr>
								<th>배송비</th>
								<th>주문합계금액</th>
							</tr>

							<tbody>
								<tr>
									<td>
										<input type="number" id="totalDeliveryPrice" name="totalDeliveryPrice" value="${totalDeliveryPrice}" readonly />
									</td>
								
									<td>
										<input type="number" id="totalPrice" name="totalPrice" value="${totalPrice}" readonly /><br>
										<input type="button" id="order" class="t" value="주문">	
									</td>	
								</tr>	
							</tbody>
							</c:when>
						</c:choose>
					</table>
					




					<p id="optionsInfo">
						<c:forEach var="optionNum" items="${optionNums}" varStatus="status">
							<input type="hidden" name="optionNums" value="${optionNum }" readonly />
						</c:forEach>
					</p>
					
				</form>
			</section>
		</article>
	</div>



	<script>
	
	function productView(productNum){
		var url = "${pageContext.request.contextPath}"+"/product";
		url = url + "?productNum=" + productNum;
		location.href = url;
	}
	
	$('#order').click(function(){
		var basketList = "${basketList}";
		
		if(basketList == "[]") {
			alert("장바구니에 담긴 상품이 없습니다!")
		}
		else {
			$('#orderPageByBasket').submit();
		}
	})
	
	 $('.cnt').change(function(){
		
		 var index = $(this).attr('id') 
		 var priceStr = '#price' + index;
		 var priceeStr = '#pricee' + index;
		 var idStr = '#hiddenId' + index;
		 var onStr = '#hiddenOn' + index;
		 var cntStr = '#' + index;
		 
		 $(priceStr).val($(this).val() * $(priceeStr).val());
		 
		 var f = document.createElement("form");
		 
		 f.name = "updateCnt";
		 f.action = "<%=request.getContextPath()%>/updateBasketCnt";
		 f.method="post";
		 f.target="";
		 
		 var elem = document.createElement("input");
		 
		 elem.setAttribute("type", "hidden");
		 elem.setAttribute("name", "cnt");
		 elem.setAttribute("value", $(cntStr).val());
		 
		
		 
		var elem2 = document.createElement("input");
		 
		 elem2.setAttribute("type", "hidden");
		 elem2.setAttribute("name", "optionNum");
		 elem2.setAttribute("value", $(onStr).val());
		 
	
		 
	 	 f.appendChild(elem);
		 f.appendChild(elem2);
		 
		 document.body.appendChild(f);
		 
		 f.submit();
		 
		 
	 })
	 
	 
$('.checkboxs').click(function(){

var checkboxs = [];
var total = ${productCnt};
for(var i = 0 ; i < total ; i++) {
	//var index = $(this).attr('name')
	var checkStr = '#checkedProduct' + i;
	if($(checkStr).is(":checked") == true) {
		checkboxs.push($(checkStr).val());
	}
};

$.ajax({

	url : "<%=request.getContextPath()%>/checkBoxBtn",
										traditional : true,
										async : false,
										data : {
											basketNums : checkboxs
										},
										type : "post",
										success : function(data) {
											var list = [];
											list = data.optionNums;
											var str = "";
											if (data.optionNums != null) {
												for (var i = 0; i < list.length; i++) {
													str += '<input type="hidden" name="optionNums" value="' + list[i] + '"/>'
												}
											}

											if (data.optionNums == null) {
												str = "";
											}
											$("#optionsInfo").html(str);
											$("#totalPrice").val(
													data.totalPrice);
											$('#totalDeliveryPrice').val(
													data.totalDeliveryPrice);

										}
									})
						});
	</script>

</body>
</html>