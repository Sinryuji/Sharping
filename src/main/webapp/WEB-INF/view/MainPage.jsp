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
	   	  	background-image:url('https://images.pexels.com/photos/1470589/pexels-photo-1470589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');
	   	  	/* background-size : 1000px 1000px; */
	   	  	background-size : cover;
	   	  	overflow:hidden;
   		}
    	
    	/* body{
   	  		background-image:url('https://paulhueman.co.kr:443/bbs/data/file/banner/2009714319_4Qzoxjug_20544c1b6b40a4acc5de0a9c3bde79bbdb7d68db.jpg');
   	  		overflow:hidden;
   	  	} */
   	  	
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
  	  	
   	  	
    </style>
    
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
	<div class="sDiv">
		<form action="productList" class="searchBox">
			<input type="text" autocomplete="off" name="keyword" id="search" placeholder="키워드를 입력하세요."/>
			<input type="image" src="upload/\upload\img\search.png" value="검색" id="btn">
		</form>
	</div>


	
</body>
</html>