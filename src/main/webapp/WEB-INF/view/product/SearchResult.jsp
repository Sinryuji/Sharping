
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">


<title>SearchResult</title>
<style>
	body {
		padding-top:70px;
		padding-bottom : 30px;
	}
	
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

	<form action="productList">
		<h2>메인검색
		<input type="text" name="keyword"  placeholder="키워드를 입력하세요."  value="${keyword}" />
		<input type="submit" value="검색">
		</h2>
	</form>
	
			<div class="m000" style="padding-right:10px">
				<select class="form-sortType" name="sortType" id="sortType" >
					<option value="productDate" ${param.sortType == "productDate" ? "selected" : "" } >신규등록순</option>
					<option value="highPrice" ${param.sortType == "highPrice" ? "selected" : "" } >높은가격순</option>
					<option value="lowPrice" ${param.sortType == "lowPrice" ? "selected" : "" } >낮은가격순</option>
				</select>
			</div>

<article>
	<div class="container">
		<div class="table-responsive">
<table class="table table-striped table-sm">
		<colgroup>
			<col style="width:5%;" />
			<col style="width:auto;" />
			<col style="width:15%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />
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
				<c:when test="${empty productList }" >
					<tr><td colspan="5" align="center"><b>검색결과가 없습니다.</b></td></tr>
				</c:when> 
				<c:when test="${!empty productList}">
					<c:forEach var="list" items="${productList}">
						<tr>
							<td><c:out value="${list.productNum}"/></td>
							<td><c:out value="${list.productThumb}"/></td>
							<td>
								<a href="#" onClick="productView(<c:out value="${list.productNum}"/>)">
							<c:out value="${list.productName}"/></a>
							</td>
							<td><c:out value="${list.productPrice}"/></td>
							<td><c:if test="${list.deliveryPrice == 0}">
									<c:out value="무료배송"/>
								</c:if>
								<c:if test="${list.deliveryPrice != 0}">
									<c:out value="${list.deliveryPrice}"/>
								</c:if>	
							</td>
							<td><c:out value="${list.id}"/></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
</div>
</div>
</article>
		<div class="form-filter">
				<h3>카테고리필터</h3>
			<div class="s000">	
				<input type="checkbox" id="checkDelivery" name="checkDelivery" value="" ${param.checkDelivery == "on" ? "checked" : ""}>무료배송
			</div>		
			
			<div class="s100" style="padding-right:10px">
				<input type="text" class="form-price" name="minPrice" id="minPrice" placeholder="최소금액" value="${minPrice}" ><br>
				~<br>
				<input type="text" class="form-price" name="maxPrice" id="maxPrice" placeholder="최대금액" value="${maxPrice}" >
			</div>
			
			<div class="s200" style="padding-right:10px">
				<select class="form-searchType" name="searchType" id="searchType" >
					<option value="productNum" ${param.searchType == "productNum" ? "selected" : "" } >상품번호</option>
					<option value="productName" ${param.searchType == "productName" ? "selected" : "" } >상품명</option>
					<option value="id" ${param.searchType == "id" ? "selected" : "" } >판매자</option>
				</select>
			</div>
			
			<div class="s300" style="padding-right:10px">
				<input type="text" class="form-search" name="keyword2" id="keyword2" placeholder="키워드를 입력하세요." value="${keyword2}">
				<input type="hidden" class="form-search" name="keyword" id="keyword" value="${keyword}">
			</div>
			
			<div>
				<button class="btn btn-sm btn-primary"  type="button" id="btnSearch">검색</button>
			</div>
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


</body>
</html>