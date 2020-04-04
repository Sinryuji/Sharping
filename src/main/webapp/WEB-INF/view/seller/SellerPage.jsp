<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SellerPage</title>
	<style>
	
		#mm {
    		 text-align: center;
 			 margin: 0 910px;
    	}
    	
    	body{
   	  		background-image:url('https://images.pexels.com/photos/1470589/pexels-photo-1470589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');
   	  		overflow:hidden;
   	  	}
   	  	
   	  	a{
   	  		text-decoration:none;
   	  		color:black;
   	  	}
   	  	
   	  	h1{
   	  		display:inline;
   	  	}
   	  	
   	  	#who{
      		text-decoration: underline;
      	}
      	
      	.who{
      		text-align: center;
      		font-size: 18px;
      	}
      	
      	.t {
		    width: 100px;
		    height: 75px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 18px;
		    text-transform: uppercase;
		    letter-spacing: 2.5px;
		    font-weight: 500;
		    color: white;
		    background-color: #6B66FF;
		    border: none;
		    border-radius: 25px;
		    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		    transition: all 0.3s ease 0s;
		    cursor: pointer;
		    outline: none;
		    opacity: 0.8;
		    margin-bottom: 10px;
		}

		.t:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		.menu{
			margin-left: 20px;
		}
   	  	
	</style>
</head>
<body>
	<div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div>
	<div class="who">
		<br><br><b id="who">[${authInfo.name}]</b><b>님의 페이지</b><br><br>
	</div>
	<div class="menu">
		<input type="button" class="t" onclick="location.href='${pageContext.request.contextPath}/uploadProduct'" value="상품 등록"><br>
		<input type="button" class="t" onclick="location.href='${pageContext.request.contextPath}/productManage'" value="상품 관리"><br>
		<input type="button" class="t" onclick="location.href='${pageContext.request.contextPath}/orderManage'" value="주문 관리">
	</div>
</body>
</html>