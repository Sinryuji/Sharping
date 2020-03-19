<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

</head>
<body>
<h1>OrderPage</h1>
<h1>Basket</h1>
<h1>ProductQa</h1>
<h1>ChangeReturnProcess</h1>
<h1>ReviewList</h1>
<h1>WriteDeclare</h1>
<br>
<span id="productName">상품명 : ${product.productName}</span><br>
<span id="productText">상품설명 : ${product.productText}</span><br>
<span id="productPrice">상품가격 : ${product.productPrice}</span><br>
<span id="productImage">상품썸네일 : ${product.productImage}</span><br>
<span id="stock">상품사진 : ${product.stock}</span><br>
<span id="categoryNum">카테고리번호 : ${product.categoryNum}</span><br>
<span id="productDate">상품등록날짜 : ${product.productDate}</span><br>
<span id="storeName">판매자명 : ${seller.storeName}</span><br>
<span id="productMeterial">상품소재 : ${product.productMeterial}</span><br>
<span id="manufacturer">제조사 : ${product.manufacturer}</span><br>
<span id="mfDate">제조일자 : ${product.mfDate}</span><br>
<span id="origin">원산지 : ${product.origin}</span><br>
<span id="deliveryPrice">배송비 : ${product.deliveryPrice}</span><br>
<formaction>
<input type="hidden" name="productNum" value="${product.productNum}">

<select id="optionOneNum">
	<option value="none">=== ${product.optionOneName} ===</option>
	<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
	<c:if test="${detailOption.optionLevel == 1}">
	<option value="${detailOption.doNum}">${detailOption.optionName}</option>
	</c:if>
	</c:forEach>
</select>
<select id="optionTwoNum">
	<option value="none">=== ${product.optionTwoName} ===</option>
	<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
	<c:if test="${detailOption.optionLevel == 2}">
	<option value="${detailOption.doNum}">${detailOption.optionName}</option>
	</c:if>
	</c:forEach>
</select>
<select id="optionThreeNum">
	<option value="none">=== ${product.optionThreeName} ===</option>
	<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
	<c:if test="${detailOption.optionLevel == 3}">
	<option value="${detailOption.doNum}">${detailOption.optionName}</option>
	</c:if>
	</c:forEach>
</select>
<br>
<p class="cnt">
<span>수량:</span>''
<input type="number" id="cnt" name="cnt" min="1" max="${product.stock}" value="1"/>

<input type="submit" value="주문" formaction="/orderPage">
<p class="addToCart">
<button type="button"  class="basketBtn">담기</button>

<script>
	$(".basketBtn").click(function(){
		
	 	var cnt = $("#cnt").val();
		var productNum = ${product.productNum};
		var optionOneNum = $("#optionOneNum").val();
		var optionTwoNum = $("#optionTwoNum").val();
		var optionThreeNum = $("#optionThreeNum").val();
		var data = { 
				cnt : cnt,
				productNum : productNum,
				optionOneNum : optionOneNum,
				optionTwoNum : optionTwoNum,
				optionThreeNum : optionThreeNum
				};
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/basketInsert",
			data: data,
			success : function(result){
				if(result == 1){
					alert("담았으");
					$(".cnt").val("1");
					window.location.href='<%=request.getContextPath()%>/basket';
				}else{
					alert("로그인하세요");
					windows.open("/login/Login","로그인페이지","null");
					$(".cnt").val("1");
				}
			},
			error : function(){
				alert("옵션을 선택하세요");
			}
		});
	});
</script>
</formaction>

</body>
</html>