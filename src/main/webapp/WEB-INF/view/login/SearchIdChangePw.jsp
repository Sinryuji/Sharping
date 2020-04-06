<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
   	  	
   	   .t {
		    width: 200px;
		    height: 100px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 18px;
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

		.t:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		.reg{
			text-align: center;
			/* background: white; */
			margin: 0 680px;;
			width: 600px;
			height: 300px;
			/* background-color: rgba( 255, 255, 255, 0.6 ); */
			margin-top: 150px;
		}
		
		.in{
			position: absolute;
			left:38.5%;
			top:35%;
		}
</style>
</head>
<body>

	<div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div><br><br>
	<div class="reg">
		<div class="in">
			<input type="button" class="t" onclick="location.href='${pageContext.request.contextPath}/searchId'" value="아이디찾기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="t" onclick="location.href='${pageContext.request.contextPath}/changePw'" value="비밀번호 재설정">
		</div>
	</div>

</body>
</html>