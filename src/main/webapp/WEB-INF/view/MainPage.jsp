<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>MainPage</title>

<link rel="stylesheet" href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>
<script src="//code.jquery.com/jquery.min.js"></script>

    <style>
    	
    	html {
			height: 100%;
		}
    	
    	body{
   	  		background-image:url('https://paulhueman.co.kr:443/bbs/data/file/banner/2009714319_4Qzoxjug_20544c1b6b40a4acc5de0a9c3bde79bbdb7d68db.jpg');
   	  		background-size: cover;
   	  		padding:0;
   	  		margin:0;
   	  		height:100%;
   	  	}
   	  	
   	  	.wrap {
			min-height: 100%;
			position: relative;
			padding-bottom: 150px; /* footer height */
		}
		
		.navbar-nav {
  		  width: 100%;
  		  text-align: center;
		  height:100%;
		}

		.navbar-nav > li {
		    float: none;
		    display: inline-block;
		}
		
		.navbar-nav > li.navbar-right {
		    float: right !important;
		} 
		
		section#container {
			margin: 0 auto;
		}
		
		section#container::after {
			content: "";
			display: block;
			clear: both;
		}
		
		aside {
			float: left;
			width: 200px;
		}
		
		div#containerBox {
			float: right;
			width: calc(100% - 200px - 20px);
		}
		
		aside ul li {
			text-align: center;
			margin-bottom: 10px;
		}
		
		footer#footer {
			background: #e7e7e7; /* f9f9f9 */
			position: absolute;
			left: 0;
			bottom: 0;
			height:150px;
			width: 100%;
			padding: 7px 0;
			text-align: center;
		}
		
		footer#footer div {
			display: inline-block;
			margin-right: 10px;
		}
		
   	  	.navbar-nav > li.active a{
   	  		text-decoration:none;
   	  		color:black;
   	  		margin-right:90px;
   	  		
   	  	}
   	  	
   	  	div{
			display:inline;
   	  	}
   	  	
   	  	.sDiv{
   	  		height: 40px;
   	  		text-align: center;
      		background: transparent;
      		width: 200px;
   	  	}
   	  	
   	  	#search{
   	  		font-size: 17px;
   	  		font-weight: bold;
   	  		border:none;
	      	border-bottom:3px solid black;
	      	padding: 10px;
	      	text-align:left;
	      	outline: none;
	      	width: 380px;
	      	background: white;
	      	opacity: 0.7;
	      	
      	}
      	
      	#btn{
      		width:20px;
      		background: transparent;
      		ouline: none;
      		color: black;
      		background-position:  0px 0px;
    		background-repeat: no-repeat;
    		border: 0px;
 			cursor:pointer;
 			outline: 0; 
      	}
      	
      	.searchBox{
      		margin-top: 70px;
      		margin-left: 40px;
      	}
      	
      	#who{
      		text-decoration: underline;
      	}
      	
      	.mainCategory{
      		margin-left:900px;
      		width:300px;
      		background: transparent;
      	}
      	
      	.mainCategoryScroll {
			display:none;
			width: 100%;
			margin-top: 10px;
		}
		
		.mainCategoryButton button {
			/* padding: 5px; */
			margin-top: 10px;
   			width: 7%;
   			background: transparent;
			outline: 0; 
			border: 0;
			padding: 0;
		}
		
		.cate{ 
			float: left; 
			width: 20%; 
			height: 400px; 
			text-align: center; 
			background:white;
			background-color: rgba( 255, 255, 255, 0.3);
		}
		
		#large{
			margin-left:392px;
		}
		
		#medium{
			border-right: 2px solid black;
			border-left: 2px solid black;
		}
		
  	  	
   	  	
    </style>

</head>
<body>

<div class="wrap">

	<nav class="navbar navbar-default">
	<!-- <nav class="navbar"> -->
		<div id="navBox">
			<%@ include file="./include/Nav.jsp"%>
		</div>
	</nav>
	
	
	<div class="sDiv">
		<form action="productList" class="searchBox">
			<input type="hidden" name="page" value="1">
			<input type="text" autocomplete="off" name="keyword" id="search" placeholder="키워드를 입력하세요."/>
			<input type="image" src="${pageContext.request.contextPath}/resources/images/search.png" value="검색" id="btn">
		</form>
	</div>
	<%-- <br><br><br><h1><a href="<c:url value='/deliveryTracker'/>" > DeliveryTracker </a></h1> --%>
	
	
	<section id="container">
		<div class="mainCategory">
		<div class="mainCategoryButton">
			<button type="button" id="mainCategoryView" class="mainCategoryView">
				<img src="${pageContext.request.contextPath}/resources/images/cate.png" style="width:60px; height:50px;">
			</button>
		</div>
		<div class="mainCategoryScroll">
		<br>
			<div class="cate" id="large">
				<h2><b>대분류</b></h2><br><br>
			<div id="DepthOneSpace">
				<c:forEach var="category" items="${categorys}" varStatus="status">
					<div id="categoryName${category.categoryNum}"><h4><a href="#" class="depthOne" data-type="${category.categoryNum}">${category.categoryName}</a></h4></div>
				</c:forEach>
			</div>
			</div>
			<div class="cate" id="medium">
				<h2><b>중분류</b></h2><br><br>
				<div id="DepthTwoSpace">
				</div>
			</div>
			<div class="cate">
				<h2><b>소분류</b></h2><br><br>
				<div id="DepthThreeSpace">
				</div>
			</div>
		</div>
	</div>
	</section>
	



</div>
<c:forEach var="notice" items="${noticeList}" varStatus="status">
	<form id="noticeForm${status.index}">
	<input type="hidden" id="noticeNum${status.index}" value="${notice.noticeNum}">
	<input type="hidden" id="noticeSubject${status.index}" name="noticeSubject" value="${notice.noticeSubject}">
	<input type="hidden" id="noticeDate${status.index}" name="noticeDate" value="${notice.noticeDate}">
	<input type="hidden" id="noticeText${status.index}"name="noticeText" value="${notice.noticeText}">
	</form>
</c:forEach>

<script>
var size = '${noticeSize}';

$(document).ready(function(){
	
	var left = 0;

	for(var i=0 ; i<size; i++){
			var strS = '#noticeSubject'+i;
			var strD = '#noticeDate'+i;
			var strT = '#noticeText'+i;
			var strN = '#noticeNum'+i;
			
			$.ajax({
				url : "<%=request.getContextPath()%>/notice",
					type : "post",
					data : {
						noticeSubject : $(strS).val(),
						noticeDate : $(strD).val(),
						noticeText : $(strT).val(),
						noticeNum : $(strN).val()
					},
		
					
					success : function(data) {
						left += data.notice.noticeNum * 200;
						window.open("noticee?noticeSubject=" + data.notice.noticeSubject + "&noticeDate=" + data.date + "&noticeText=" + data.notice.noticeText, "popup" + data.notice.noticeNum, "width=400, height=400, top=30, resizable = no," + "left=" + left);
					} 
					
			});
			
	}
	})
	

	// 카테고리@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// 대분류 카테고리명 클릭하는 경우
	$(document).on("click", '.depthOne', function(){
		
		var currentCategoryNum = $(this).attr("data-type");	
				
		$("#DepthThreeSpace").html('');
		
		$.ajax({
			url : "<%=request.getContextPath()%>/selectCategory",
				type : "post",
	
				data : {
					categoryNum : currentCategoryNum
				},
				
				success : function(data) {
					
					if(data != null) {
						
					
					var htmls = '<input type="hidden" id="depthOneCurrentCategoryNum" value="' +  currentCategoryNum + '"/>';
					
					for(var i = 0 ; i < data.length ; i++) {
						var category = data[i];
						htmls += '<div id="categoryName' + category.categoryNum  + '"><h4><a href="#" class="depthTwo" data-type="' + category.categoryNum + '">' + category.categoryName + '</a></h4></div>';
					}
					
					
					$("#DepthTwoSpace").html(htmls);
					
					}
					
					if(data == null) {
						
						$("#DepthTwoSpace").html('');
					}
	
				} 
				
		});
		
		
		
	
	})
	
	// 중분류 카테고리명 클릭하는 경우
	$(document).on("click", ".depthTwo", function(){
		
		var currentCategoryNum = $(this).attr("data-type");
	
		
		$.ajax({
			url : "<%=request.getContextPath()%>/selectCategory",
				type : "post",
	
				data : {
					categoryNum : currentCategoryNum
				},
				
				success : function(data) {
					
					if(data != null) {
					
					var htmls = '<input type="hidden" id="depthTwoCurrentCategoryNum" value="' +  currentCategoryNum + '"/>';
					
					for(var i = 0 ; i < data.length ; i++) {
						var category = data[i];
						htmls += '<div id="categoryName' + category.categoryNum  + '"><h4><a href="#" class="depthThree" data-type="' + category.categoryNum + '">' + category.categoryName + '</a></h4></div>';
					}
					
					
					$("#DepthThreeSpace").html(htmls);
					}
					
					if(data == null) {
						$("#DepthThreeSpace").html('');
					}
	
				} 
				
		});
		
	})
	
	// 소분류 카테고리명 클릭하는 경우(카테고리로 상품 리스트 보기)
	$(document).on("click", ".depthThree", function(){
		
		var currentCategoryNum = $(this).attr("data-type");
		
		var f = document.createElement("form");
		
		f.action="<%=request.getContextPath()%>/productList";
		f.method="post";
		
		var elem = document.createElement("input");
		
		elem.setAttribute("type", "hidden");
		elem.setAttribute("name", "categoryNum");
		elem.setAttribute("value", currentCategoryNum);
		
		var elem2 = document.createElement("input");
		
		elem2.setAttribute("type", "hidden");
		elem2.setAttribute("name", "keyword");
		elem2.setAttribute("value", "");

		
		f.appendChild(elem);
		f.appendChild(elem2);
		
		document.body.appendChild(f);
		
		f.submit();
		
		
	})
	
	// 메인페이지 카테고리 열기/닫기
	$(document).on("click", "#mainCategoryView", function(){
		
		$('.mainCategoryScroll').slideToggle("slow");
	})
	
	// 최근 본 상품 버튼
	
	$(document).on("click", "#latelyViewProduct", function(){
		
		location.href = "<%=request.getContextPath()%>/latelyViewProduct";
		
	})
	
	
</script>



<script src="${pageContext.request.contextPath}/asset/js/bootstrap.js"></script>
</body>
</html>