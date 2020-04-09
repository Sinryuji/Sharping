
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
<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

<title>SearchResult</title>

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
/*    	background-image:url('https://paulhueman.co.kr:443/bbs/data/file/banner/2009714319_4Qzoxjug_20544c1b6b40a4acc5de0a9c3bde79bbdb7d68db.jpg');
 */ 	background-size: cover;
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
	margin-bottom: 50px;	
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

#containerBox {
	margin-left: 300px;
	width: 500px;
	margin-bottom: 10px;
	border:3px solid #ccc;
	border-radius:50px;
	color:#666;
	text-align: center;
	padding: 10px;
}

aside {
	float: left;
	margin: 0 0 0 30px;
	width: 230px;
	border:3px solid #ccc;
	border-radius:50px;
	color:#666;
	text-align: center;
	padding: 10px;
	position: fixed;
}

select {
	border:1px solid #ccc;
	border-radius:50px;
	color:#666;
	text-align: center;
	padding: 6px;
}

aside h3 {
	text-align: center;
	margin-bottom: 20px;
}

.s100 {
	margin-bottom: 10px;
}

.containerTable {
	width:100%;
}

footer#footer {
	background: #e7e7e7;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	height:190px;
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

		<section id="container">
		
			<aside>
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
					<input type="text" name="minPrice" id="minPrice"
						placeholder="최소금액" value="${minPrice}">
					<div style="width: 200px;">
						<p class="text-center">~</p>
					</div>
					<input type="text" name="maxPrice" id="maxPrice"
						placeholder="최대금액" value="${maxPrice}">
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
					<input type="text" name="keyword2"
						id="keyword2" placeholder="키워드를 입력하세요." value="${keyword2}">
					<input type="hidden" class="form-search" name="keyword"
						id="keyword" value="${keyword}">
				</div>

				<div>
					<button class="btnSearch" type="button" id="btnSearch">검색</button>
				</div>
			</aside>
			
			<div id="containerBox">
				<form action="productList">
					<input type="hidden" name="page" value="1">
					<h4>
						메인검색 <input type="text" name="keyword" placeholder="키워드를 입력하세요."
							value="${keyword}" /> <input type="submit" id="btnMainSer"
							value="검색">
					</h4>
				</form>
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
							<tbody id="tbody">
								<c:choose>
									<c:when test="${empty productList }">
										<tr>
											<td colspan="10" align="center"><b>검색결과가 없습니다.</b></td>
										</tr>
									</c:when>
									<c:when test="${!empty productList}">
										<c:forEach var="list" items="${productList}">
											<tr>
												<td><c:out value="${list.productNum}" /></td>
												<%-- <td><c:out value="${list.productThumb}" /></td> --%>
												<td><img src="opload/${list.productThumb}" style="width:50px;"></td>
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



		<footer id="footer">
			<div id=footerBox>
				<%@ include file="../include/Footer.jsp"%>
			</div>
		</footer>


	</div>

<script>

history.scrollRestoration = "manual";
var categoryNum = "${categoryNum}";

var page = 1;

$(function(){
	getList(page);
	page++;
})

$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
     if($(window).scrollTop() >= $(document).height() - $(window).height()){
    	 getList(page);
    	 console.log(page);
    	 page++; 
     } 
});


function getList(page) {
	
	console.log("되냐");
	
	 $.ajax({
	        type : 'POST',  
	        dataType : 'json', 
	        data : {
	        	page : page,
	        	searchType : $("#searchType").val(),
	        	sortType : $("#sortType").val(),
	        	keyword :  $("#keyword").val(),
	        	keyword2 : $("#keyword2").val(),
	        	minPrice : $("#minPrice").val(),
	        	maxPrice : $("#maxPrice").val(),
	        	checkDelivery : $("#checkDelivery").val(),
	        	categoryNum : categoryNum
	        	},
	        url : '<%=request.getContextPath()%>/productListPaging',
	        success : function(data) {
	        	console.log("되냐1.5");
	            /* var data = returnData.rows; */
	            var html = "";
	            /* if (page==1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
	                  $("#tbody").html(""); 
	            } */
	            if (data.startNum<=data.totCnt){
	            	console.log("되냐2");
	                if(data.productList.length>0){
	                	console.log("되냐3");
	                	// for문을 돌면서 행을 그린다.
	                	for(var i = 0 ; i < data.productList.length ; i++) {
	                		var product = data.productList[i];
	                		var deliveryPrice;
	                		if(product.deliveryPrice == 0) {
	                			deliveryPrice = "무료배송";
	                		} else {
	                			deliveryPrice = product.deliveryPrice;
	                		}
	                		html += "<tr><td>" + product.productNum + "</td><td><img src='opload/" + product.productThumb  + "' style='width:50px;'></td><td><a href='#'onClick='productView(" + product.productNum + ")'>" + product.productName + "</a></td><td>" + product.productPrice + "</td><td> " + deliveryPrice + " </td><td>" + product.id + "</td></tr>"
	                	}
	                }else{
	                //데이터가 없을경우
	                }
	            }
	           /*  html = html.replace(/%20/gi, " "); */
	            if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
	                $("#tbody").html(html); 
	            }else{
	                $("#tbody").append(html);
	            }
	       },error:function(e){
	           if(e.status==300){
	               alert("데이터를 가져오는데 실패하였습니다.");
	           };
	       }
	    }); 

}
	
$("#btnSearch").click(function(){


 	if(document.getElementById("checkDelivery").checked == true){
		document.getElementById("checkDelivery").value = 'on'
	} else{
		document.getElementById("checkDelivery").value = 'off'
	}
		
	var url = "${pageContext.request.contextPath}"+"/productList";
	url = url + "?searchType=" + $("#searchType").val() + "&sortType=" + $("#sortType").val() + "&keyword=" + $("#keyword").val() 
			  + "&keyword2=" + $("#keyword2").val() + "&minPrice=" + $("#minPrice").val() + "&maxPrice=" + $("#maxPrice").val()
			  + "&checkDelivery=" + $("#checkDelivery").val() + "&page=1";
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