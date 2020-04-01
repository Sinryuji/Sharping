<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
	
	<style>
    	#mm {
    		 text-align: center;
 			 margin: 0 auto;
    	}
    </style>
	

</head>
<body>
    
    <div id="mm">
	<a href="<c:url value='/main'/>"> <h1>메인</h1> </a>
	</div>


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
<span id="stock">상품재고 : ${product.stock}</span><br>
<span id="categoryNum">카테고리번호 : ${product.categoryNum}</span><br>
<span id="productDate">상품등록날짜 : ${product.productDate}</span><br>
<span id="storeName">판매자명 : ${seller.storeName}</span><br>
<span id="productMeterial">상품소재 : ${product.productMeterial}</span><br>
<span id="manufacturer">제조사 : ${product.manufacturer}</span><br>
<span id="mfDate">제조일자 : ${product.mfDate}</span><br>
<span id="origin">원산지 : ${product.origin}</span><br>
<span>배송비 : ${product.deliveryPrice}</span><br>


<form action="orderPage" id="orderPage">
<input type="hidden" name="productNum" id="productNum" value="${product.productNum}">

<c:if test="${maxOptionLevel == 1}">
<select name="optionOneNum">

	<option value="none">=== ${product.optionOneName} ===</option>
	<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
	<c:if test="${detailOption.optionLevel == 1}">
	<option value="${detailOption.doNum}">${detailOption.optionName}</option>
	</c:if>
	</c:forEach>
</select>

</c:if>

<c:if test="${maxOptionLevel == 2 }">
<select name="optionOneNum">
	<option value="none">=== ${product.optionOneName} ===</option>
	<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
	<c:if test="${detailOption.optionLevel == 1}">
	<option value="${detailOption.doNum}">${detailOption.optionName}</option>
	</c:if>
	</c:forEach>
</select>
<select name="optionTwoNum">

	<option value="none">=== ${product.optionTwoName} ===</option>
	<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
	<c:if test="${detailOption.optionLevel == 2}">
	<option value="${detailOption.doNum}">${detailOption.optionName}</option>
	</c:if>
	</c:forEach>
</select>

</c:if>

<c:if test="${maxOptionLevel == 3}">
<select name="optionOneNum">
	<option value="none">=== ${product.optionOneName} ===</option>
	<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
	<c:if test="${detailOption.optionLevel == 1}">
	<option value="${detailOption.doNum}">${detailOption.optionName}</option>
	</c:if>
	</c:forEach>
</select>
<select name="optionTwoNum">
	<option value="none">=== ${product.optionTwoName} ===</option>
	<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
	<c:if test="${detailOption.optionLevel == 2}">
	<option value="${detailOption.doNum}">${detailOption.optionName}</option>
	</c:if>
	</c:forEach>
</select>
<select name="optionThreeNum">

	<option value="none">=== ${product.optionThreeName} ===</option>
	<c:forEach var="detailOption" items="${detailOptionList}" varStatus="status">
	<c:if test="${detailOption.optionLevel == 3}">
	<option value="${detailOption.doNum}">${detailOption.optionName}</option>
	</c:if>
	</c:forEach>
</select>
</c:if>
<br>
수량:<input type="number" name="cnt" id="cnt" value="1" min="1">
결제금액:<input type="number" name="payPrice" id="payPrice" value="${product.productPrice }" readonly>
<input type="hidden" name="deliveryPrice" id="deliveryPrice" value="${product.deliveryPrice}">
<input type="button" class="orderBtn" value="주문"><br>
<button type="button"  class="basketBtn">담기</button>
</form>

<script>
$('.orderBtn').click(function(){
	
	
	if('<%=session.getAttribute("authInfo")%>' != 'null'){
		$('#orderPage').submit();
	}else {
		var result = confirm('비회원으로 주문하시겠습니까?'); 
		if(result) { //yes 
			$('#orderPage').submit();
		} else {
			//로그인 페이지 전환
			window.location.href='<%=request.getContextPath()%>/login';
		}
	}
	
	
	

	
})


</script>
<script>
$('#cnt').change(function(){
	$('#payPrice').val(${product.productPrice} * $('#cnt').val());
})

</script>
<script>
	$(".basketBtn").click(function(){
		
	 	var cnt = $("#cnt").val();
		var productNum = ${product.productNum};
		var optionOneNum = $("select[name=optionOneNum]").val();
		var optionTwoNum = $("select[name=optionTwoNum]").val();
		var optionThreeNum = $("select[name=optionThreeNum]").val();
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
					window.location.href='<%=request.getContextPath()%>/login';
				}
			},
			error : function(){
				alert("옵션을 선택하세요");
			}
		});
	});
</script>

</body>
</html>