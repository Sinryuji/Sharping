<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Basket</title>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/styleSB.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<h1 class="site-title"><a href="<c:url value='/main'/>" rel="home">#ing</a></h1>
		</div>
		</header>
		</div>
		</div>
	<form id="orderPageByBasket" action="orderPageByBasket">
		<table class="basketTable">
			<c:choose>
				<c:when test="${empty basketList }">
					<tr>
						<td>장바구니에 담긴 상품이 없어</td>
					</tr>
				</c:when>
				<c:when test="${!empty basketList}">
					<tr>
						<th><a
							href="<%=request.getContextPath()%>/store?storeName=${storeNames}"
							title="storeNames">${storeNames}</a></th>
						<th>상품이미지</th>
						<th>상품명</th>
						<th>수량</th>
						<th>상품가격</th>
						<th>배송비</th>
					</tr>
					<c:forEach var="basket" items="${basketList}" varStatus="status">
						<tr>
							<!--체크박스  -->
							<td><input type="checkbox" name="basketNums"
								class="checkboxs" id="checkedProduct${status.index}"
								value="${basket.basketNum}" checked /> <!--상품이미지  -->
							<td><a href="#"> ${basket.productThumb}</a></td>
							<!--상풍명  -->
							<td><c:out value="${basket.productName}" /></td>
							<td>
								<!--상품수량  --> <!-- <button type="button" class="plus">+</button>  -->
								<input type="number" class="cnt" id="${status.index}"
								name="cnt${status.index }" min="1" max="${basket.stock}"
								value="${basket.cnt}" /> <input type="hidden" name="cnt"
								id="cnt" value="${basket.cnt}" /> <input type="hidden"
								name="payPrice" id="payPrice"
								value="${basket.productPrice*basket.cnt}" /> <!-- <button type="button" class="minus">-</button> -->
							</td>
							<!-- 상품가격 -->
							<td><input type="number" id="price${status.index}"
								value="${basket.productPrice*basket.cnt}" /> <input
								type="hidden" id="pricee${status.index}"
								value="${basket.productPrice}">원</td>
							<!--배송비  -->

							<td>${basket.deliveryPrice}원</td>

							<td>
								<!--삭제버튼  --> <%-- <button class="deleteBasket" value="${basket.basketNum}">X</button> --%>
								<%-- <input type="hidden" value="${basket.basketNum}"> --%> <a
								href="<%=request.getContextPath()%>/deleteBasket?basketNum=${basket.basketNum}">X</a>
								<%-- <input type="hidden" id="hiddenCnt${status.index }" value = ""> --%>
								<input type="hidden" id="hiddenOn${status.index }"
								value="${basket.optionNum}">
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		<%-- ${(basketinfo.productPrice*basketinfo.cnt)+basketinfo.deliveryPrice} --%>
		<table>
			<c:choose>
				<c:when test="${totalPrice == 0}">
				</c:when>
				<c:when test="${totalPrice != 0}">
					<tr>
						<th>주문합계금액</th>
						<th>배송비</th>
					</tr>
					<tr>

						<td><input type="number" id="totalPrice" name="totalPrice"
							value="${totalPrice}" readonly /></td>
						<td><input type="number" id="totalDeliveryPrice"
							name="totalDeliveryPrice" value="${totalDeliveryPrice}" readonly /></td>
					</tr>
					<p id="optionsInfo">
						<c:forEach var="optionNum" items="${optionNums}"
							varStatus="status">

							<input type="hidden" name="optionNums" value="${optionNum }"
								readonly />

						</c:forEach>
					</p>



				</c:when>
			</c:choose>
		</table>
		<input type="button" id="order" class="button" value="주문">
	</form>

	<script>
	
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