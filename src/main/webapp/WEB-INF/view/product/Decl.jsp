<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style>
		
		.b {
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

		.b:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		form{
			text-align: center;
			width: 400px;
			margin: auto;
		}
		
		textarea{
			min-width: 400px;
			min-height: 150px;
			resize: none;
			overflow: hidden;
			outline: none;
		}
		
		span, select{
			float: left;
		}
		
		span{
			width: 90px;
    		font-size: 17px;
		}
		
		select{
			width: 290px;
    		height: 22px;
    		outline: none;
		}
		
		div{
			padding: 10px;
		}
		
</style>
</head>
<body>
	<br>
	<form action="insertDeclProduct">
		<div>
			<span>신고 사유</span>
			<select name="declReason">
				<option value="상품정보 다름">상품정보 다름</option>
				<option value="가품/이미테이션">가품/이미테이션</option>
				<option value="청소년유해상품 및 이미지">청소년유해상품 및 이미지</option>
				<option value="불법상품">불법상품</option>
				<option value="부적합 판매행위">부적합 판매행위</option>
				<option value="개인정보 침해">개인정보 침해</option>
				<option value="결제도용신고">결제도용신고</option>
				<option value="배송환불분쟁/연락두절">배송환불분쟁/연락두절</option>
				<option value="저작권 위반">저작권 위반</option>
			</select>
		</div>
		<br>
		<textarea name="declText" placeholder="신고 내용을 자세히 작성해주십시오." required></textarea>
		<input type="hidden" name="productNum" id="productNum" value="">
		<input type="hidden" name="sellerId" id="sellerId" value="">
	   <br>
	   <br>
	   <div align="center">
	       <input type="button" class="b" value="취소" onclick="window.close()">
           <input type="submit" class="b" id="submit" value="접수">
	   </div>
	</form>
	
<script>
	
	$(document).ready(function(){
 		document.getElementById("productNum").value = opener.document.getElementById("productNum").value;
 		document.getElementById("sellerId").value = opener.document.getElementById("sellerId").value;
	});
	
	$("#submit").click(function(){
		alert('신고가 접수되었습니다.');
	
	});
	
</script>
	
</body>
</html>