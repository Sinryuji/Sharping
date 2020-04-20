<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>InfoChangePwResult</title>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />

<script>
  src="https://code.jquery.com/jquery-2.1.4.min.js"
</script>
	
<style>

#container {
	position:absolute;
	top:0;
	left:0;
	width:100%;
	height:100%;
	text-align:center
}

#containerBox {
	display:inline-block;
	vertical-align:middle;
}

.blank {
	display:inline-block;
	width:0;
	height:100%;
	vertical-align:middle;
}

#cancel {
	width: 100px;
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

#cancel:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}

</style>
</head>

<body>

<article>
	<section id="container">
		<div id="containerBox">
			<c:if test="${falsee != 'falsee' }">
			<span>변경이 완료되었습니다!</span>
			</c:if>
			
			<c:if test="${falsee == 'falsee' }">
			<span>새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다!</span>
			</c:if>
			<br>
			<input type='button' id="cancel" value="닫기" onClick='window.close();'>
		</div>
		<span class="blank"></span>
	</section>
</article>

</body>
</html>