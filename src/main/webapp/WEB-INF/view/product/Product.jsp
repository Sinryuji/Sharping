<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
	
	<style>
    	.site-branding {
    		 text-align: center;
 			 margin: 0 auto;
    	}
    	
    	a{
   	  		text-decoration:none;
   	  		color:black;
   	  	}
   	  	
   	  	h1{
   	  		display:inline;
   	  	}
    </style>
	

</head>
<body class="single single-product woocommerce woocommerce-page">
<div id="basket">
	<div class="page">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
		</div>
		</header>
		</div>
		</div>
	<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main" role="main">
				<div id="container">
					<div id="content" role="main">
						<nav class="woocommerce-breadcrumb" itemprop="breadcrumb">카테고리 가져오면 될듯</nav>
						<nav class="woocommerce-breadcrumb" itemprop="breadcrumb">상품번호:</nav>
						<div itemscope itemtype="http://schema.org/Product" class="product"><!-- 사진 및 상품옵션 보는 묶음 -->
							<div class="images">
								<b><img src="opload/${product.productImage}" width="250" height="250"></b>
							</div>
							<div class="summary entry-summary">
								<form action="orderPage" id="orderPage">
								<input type="hidden" name="productNum" id="productNum" value="${product.productNum}">
								<h1 itemprop="name" class="product_title entry-title">${product.productName}</h1><!-- 상품명 -->
								<div class="woocommerce-product-rating" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
									<a href="#reviews" class="woocommerce-review-link" rel="nofollow">(<span itemprop="reviewCount" class="count">리뷰남긴사람수)</span>고객리뷰</a>
								</div>
								<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
									<p class="price">
										<span class="amount">${product.productPrice}원</span><!--가격  -->
									</p>
								</div>
								<div itemprop="description">
									<p>
										${product.productText}<!--상품설명  -->
									</p>
									<p>
									상품소재 : ${product.productMeterial}<br>
									 제조사 : ${product.manufacturer}<br>
									 원산지 : ${product.origin}<br>
									</p>
								</div>
								<div class="sumthing">
									<h3 class="옵션석택 스타일 찾아"> 옵션 선택</h3>
									<c:if test="${maxOptionLevel == 0}">
										<input type="hidden" name="optionOneNum" value="0">
										<input type="hidden" name="optionTwoNum" value="0">
										<input type="hidden" name="optionThreeNum" value="0">
									</c:if>
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
									<br>
									<div class="quantity"><!--상품수량 -->
										<h4>수량:<span><input type="number" name="cnt" id="cnt" value="1" min="1"></span></h4>
									</div>
								</div>
								<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
									<p class="price">
										<h4>결제금액:<span class="amount"><input type="number" name="payPrice" id="payPrice" value="${product.productPrice }" readonly></span></h4>
									</p>
								</div>
								<input type="hidden" name="deliveryPrice" id="deliveryPrice" value="${product.deliveryPrice}">
								<input type="button" class="basketBtn" style="margin: 0;" value="담기">
								<input type="button" class="orderBtn" id="t" style="margin: 0;" value="주문">
								</form>
							</div>
						</div>
					</div>
				</div>
				</main>
			</div>
	</div>
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
					var result1 = confirm("장바구니에 추가 되었습니다. 계속 쇼핑 하시겠습니까?");
					if(result1){
					location.reload();
					}else{
					window.location.href='<%=request.getContextPath()%>/basket';	
					}
				}else{
					alert("로그인하세요");
					window.location.href='<%=request.getContextPath()%>/login';
				}
			}
			
		});
	});
</script>

</body>
</html>