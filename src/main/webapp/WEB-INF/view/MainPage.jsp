<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>

    <style>
    	#mm {
    		 text-align: center;
 			 margin: 0 950px;
    	}
    	
    	body{
   	  		background-image:url('https://paulhueman.co.kr:443/bbs/data/file/banner/2009714319_4Qzoxjug_20544c1b6b40a4acc5de0a9c3bde79bbdb7d68db.jpg');
   	  		overflow:hidden;
   	  	}
   	  	
   	  	a{
   	  		text-decoration:none;
   	  		color:black;
   	  	}
   	  	
   	  	div{
			display:inline;
   	  	}
   	  	
   	  	h1{
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
      		margin-left: 70px;
      	}
      	
      	#who{
      		text-decoration: underline;
      	}
      	
      	.mainCategoryScroll {

		

			display:none;

	

		}
		
		.mainCategoryButton {
		
			margin: auto;

  			width: 50%;
		
		}
		
		.mainCategoryButton button {
		
			padding: 5px;

   			width: 100%;

   			font-size: 18px;
		
		}
		
  	  	
   	  	
    </style>
    
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>

	<c:if test="${empty authInfo}">
		<div style="float:left">
			<b><a href="<c:url value='/login'/>">&nbsp;로그인&nbsp;</a></b>
			<b><a href="<c:url value='/regist'/>">&nbsp;회원 가입&nbsp;</a></b>
		</div>
	</c:if>
	
	<c:if test="${!empty authInfo}">
		<div style="float:left">
			<b id="who">[${authInfo.name}]</b><b>님 환영합니다.</b>
			<b><a href="<c:url value='/logout'/>">&nbsp;로그아웃&nbsp;</a></b>
			<b><a href="<c:url value='/infoChange'/>">&nbsp;회원정보 수정&nbsp;</a></b>
		</div>	
	
		<div style="float:right">
			<b><a href="<c:url value='/myPage'/>">&nbsp;마이페이지&nbsp;</a></b>
			
			<b><a href="<c:url value='/basket'/>">&nbsp;장바구니&nbsp;</a></b>
	
			<c:if test="${authInfo.sellerCheck == 'false' }">
				<b><a href="<c:url value='/changeSeller'/>">&nbsp;판매하기&nbsp;</a></b>
			</c:if>
			
			<c:if test="${authInfo.sellerCheck == 'true' }">
				<b><a href="<c:url value='/sellerPage'/>">&nbsp;판매자 페이지&nbsp;</a></b>
			</c:if>
		</div>	
	</c:if>
	
    <div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div>
	

	<%-- <br><br><br><h1><a href="<c:url value='/deliveryTracker'/>" > DeliveryTracker </a></h1> --%>
	<br><br>
	<div class="mainCategory">
		<div class="mainCategoryButton"><button type="button" id="mainCategoryView" class="mainCategoryView">카테고리</button></div>
		<div class="mainCategoryScroll">
			<div style="border-right: 2px solid black; float: left; width: 33%; height: 400px; text-align: center">
				대분류<br><br>
			<div id="DepthOneSpace">
				<c:forEach var="category" items="${cetegorys}" varStatus="status">
					<div id="categoryName${category.categoryNum}"><h4><a href="#" class="depthOne" data-type="${category.categoryNum}">${category.categoryName}</a></h4></div>
				</c:forEach>
			</div>
			</div>
			<div style="border-right: 2px solid black; float: left; width: 33%; height: 400px; text-align: center">
				중분류<br><br>
				<div id="DepthTwoSpace">
				</div>
			</div>
			<div style="float: left; width: 33%; height: 400px; text-align: center">
				소분류<br><br>
				<div id="DepthThreeSpace">
				</div>
			</div>
		</div>
	</div>
	<div class="sDiv">
		<form action="productList" class="searchBox">
			<input type="text" autocomplete="off" name="keyword" id="search" placeholder="키워드를 입력하세요."/>
			<input type="image" src="upload/\upload\img\search.png" value="검색" id="btn">
		</form>
	</div>

<script>

	// 카테고리@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// 대분류 카테고리명 클릭하는 경우
	$('.depthOne').on("click", function(){
		
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
		
		$('.mainCategoryScroll').slideToggle(1);
	})
	
	
</script>	
</body>
</html>
