
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

<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<style>

body {
/* 	background-image: url('https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2019%2F07%2Fpeaceminusone-nike-air-force-1.jpg?quality=95&w=1170&cbr=1&q=90&fit=max');
	opacity: 0.5; */
	background-size: cover;
}


.jumbotron {
	background-color: transparent;
	background-size: cover;
	text-shadow: black 0.2em 0.2em 0.2em;
	color: white;
}


aside {
	border: 0;
	margin: 0 0 0 30px;
	width: 230px;
	float: left;
}

.s100 {

	margin-bottom: 10px;
}

section {
	margin: 0 0 0 0;
}
</style>
</head>
<body>


	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">
				<a href="<c:url value='/main'/>"> #ing </a>
			</h1>
		</div>
	</div>

	<div class="container">
		<form class="search" action="productList">
			<h4>
				메인검색 <input type="text" name="keyword" placeholder="키워드를 입력하세요."
					value="${keyword}" /> <input type="submit" value="검색">
			</h4>
		</form>
	</div>



		<aside class="filter">
					<h3>카테고리필터</h3>
					<div class="s100">
						<select class="form-sortType" name="sortType" id="sortType">
							<option value="productDate"
								${param.sortType == "productDate" ? "selected" : "" }>신규등록순</option>
							<option value="highPrice"
								${param.sortType == "highPrice" ? "selected" : "" }>높은가격순</option>
							<option value="lowPrice"
								${param.sortType == "lowPrice" ? "selected" : "" }>낮은가격순</option>
						</select>
					</div>
					
					<div class="s100">
						<input type="checkbox" id="checkDelivery" name="checkDelivery"
							value="" ${param.checkDelivery == "on" ? "checked" : ""}>무료배송
					</div>

					<div class="s100">
						<input type="text" class="form-price" name="minPrice"
							id="minPrice" placeholder="최소금액" value="${minPrice}">
							<div style="width:200px;">
								<p class="text-center">~</p>
							</div>
						<input type="text" class="form-price" name="maxPrice"
							id="maxPrice" placeholder="최대금액" value="${maxPrice}">
					</div>

					<div class="s100">
						<select class="form-searchType" name="searchType" id="searchType">
							<option value="productNum"
								${param.searchType == "productNum" ? "selected" : "" }>상품번호</option>
							<option value="productName"
								${param.searchType == "productName" ? "selected" : "" }>상품명</option>
							<option value="id" ${param.searchType == "id" ? "selected" : "" }>판매자</option>
						</select>
					</div>

					<div class="s100">
						<input type="text" class="form-search" name="keyword2"
							id="keyword2" placeholder="키워드를 입력하세요." value="${keyword2}">
						<input type="hidden" class="form-search" name="keyword"
							id="keyword" value="${keyword}">
					</div>
					
					<div>
						<button class="btn btn-sm btn-primary" type="button"
							id="btnSearch">검색</button>
					</div>

		</aside>
		
		<section>
			<article>
				<div class="container">
					<div class="table-responsive">
						<table class="table table-striped table-sm">
							<colgroup>
								<col style="width: 5%;" />
								<col style="width: auto;" />
								<col style="width: 15%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
							</colgroup>
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
									<c:when test="${empty productList }">
										<tr>
											<td colspan="5" align="center"><b>검색결과가 없습니다.</b></td>
										</tr>
									</c:when>
									<c:when test="${!empty productList}">
										<c:forEach var="list" items="${productList}">
											<tr>
												<td><c:out value="${list.productNum}" /></td>
												<td><c:out value="${list.productThumb}" /></td>
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
			</article>
		</section>

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

</body>
</html>