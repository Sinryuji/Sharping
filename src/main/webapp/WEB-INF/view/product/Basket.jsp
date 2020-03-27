<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Basket</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
<%-- function checkBoxBtn(){
	var index = $(this).attr('name')
	alert(index);
	var checkStr = '#checkedProduct' + index;
	$.ajax({
		url : "<%=request.getContextPath()%>/checkBoxBtn",
		data : {
			basketNum : $(checkStr).val()
		},
		type :"post",
		success : function(data){
			
			$('#totalPrice').val(data.totalPrice);
			$('#totalDeliveryPrice').val(data.totalDeliveryPrice)
		}
	});
} --%>
/* 삭제 ajax */
<%-- $('.deleteBasket').click(function(){
	var basketNum = $(this).val();
	
	$.ajax({
		url : "<%=request.getContextPath()%>/deleteBasket",
		data : {
			basketNum : $(basketNum).val()
		},
		type :"post",
		success : function(){
			
		}
	});
}); --%>
</script>
</head>
<body>
	<form action="orderPage">
		<table>
		<c:choose>
			<c:when test="${empty basketList }">
					<tr><td>장바구니에 담긴 상품이 없어</td>
			</c:when>
			<c:when test="${!empty basketList}">
			<tr>
				<th></th>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>수량</th>
				<th>상품가격</th>
				<th>배송비</th>
			</tr>
			<c:forEach var="basket" items="${basketList}" varStatus="status">
				<tr>
					<!--체크박스  -->
					<td><input type="checkbox" name="${status.index}"class="checkboxs" id="checkedProduct${status.index}"value="${basket.basketNum}" checked />
					<!--상품이미지  -->
					<td><a href="#" 상품페이지 이동> ${basket.productImage}</a></td>
					<!--상풍명  -->
					<td><c:out value="${basket.productName}"/></td>
					<td><!--상품수량  -->
						<!-- <button type="button" class="plus">+</button>  -->
						<input type="number" class="cnt" id="${status.index}" name="cnt${status.index }" min="1" max="${basket.stock}"	value="${basket.cnt}" />
						<!-- <button type="button" class="minus">-</button> -->
					</td>
					<!-- 상품가격 -->
					<td><input type="number" id="price${status.index}"
						value="${basket.productPrice*basket.cnt}" /> <input type="hidden"
						id="pricee${status.index}" value="${basket.productPrice}"></td>
					<!--배송비  -->
					
					<td>${basket.deliveryPrice}</td>
					
					 <td><!--삭제버튼  -->
						<%-- <button class="deleteBasket" value="${basket.basketNum}">X</button> --%>
						<%-- <input type="hidden" value="${basket.basketNum}"> --%>
						<a href="<%=request.getContextPath()%>/deleteBasket?basketNum=${basket.basketNum}">X</a>
						<%-- <input type="hidden" id="hiddenCnt${status.index }" value = ""> --%>
						<input type="hidden" id="hiddenOn${status.index }" value = "${basket.optionNum}">
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
			<%-- <c:forEach var="basketinfo" items="${productinfo}"> --%>
			<tr>
				<td><input type="number" id="payPrice" name="payPrice" value="${totalPrice}" readonly/></td>
				<td><input type="number" id="deliveryPrice" name="deliveryPrice" value="${totalDeliveryPrice}" readonly/></td>
			</tr>
			<%-- </c:forEach> --%>
			</c:when>
		</c:choose>
		</table>
		<input type="submit" value="주문">
	</form>

	<h1>OrderPage</h1>
	
	<script>
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
	
	
	
	
	
	/*  $('.cnt').change(function(){
		
		 var index = $(this).attr('id') 
		 var priceStr = '#price' + index;
		 var priceeStr = '#pricee' + index;
		 
		 $(priceStr).val($(this).val() * $(priceeStr).val());
	 }) */
	 
$('.checkboxs').click(function(){

var checkboxs = [];
var total = ${productCnt};
for(var i = 0 ; i < total ; i++) {
	var index = $(this).attr('name')
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

					$("#payPrice").val(data.totalPrice);
					$('#deliveryPrice').val(data.totalDeliveryPrice);

				}
			})
		});
	</script>
</body>
</html>