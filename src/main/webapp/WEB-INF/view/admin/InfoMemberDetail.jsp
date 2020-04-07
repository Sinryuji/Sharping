<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>InfoDetail</title>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

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

#fake, #cancel, #delPro {
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

#fake:hover, #cancel:hover, #delPro:hover {
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
	<span id="id">아이디 : <b>${member.id}</b></span>
	<br>
	<span id="name">이름 : ${member.name}</span>
	<br>
	<span id="phone">전화번호 : ${member.phone}</span>
	<br>
	<span id="email">이메일 : ${member.email}</span>
	<br>
	<span id="regDate">가입날짜 : ${member.regDate}</span>
	<br>
	<span id="memberGrade">회원등급 : <c:if test="${member.memberGrade == 1}">
									<c:out value="일반회원" />
									</c:if> 
									<c:if test="${member.memberGrade == 2}">
									<c:out value="보통회원" />
									</c:if> 
									<c:if test="${member.memberGrade == 3}">
									<c:out value="VIP회원" />
									</c:if></span>
	<br>
	<span id="post">우편번호 : ${member.post}</span>
	<br>
	<span id="address">주소 : ${member.address}</span>
	<br>
	<span id="addressEtc">상세주소 : ${member.addressEtc}</span>
	<br>
	<br>
	
		<form action="deleteMember">
			<input type="button" value="삭제하기" id="fake">
			<input type="button" value="닫기" id="cancel" onclick="window.close()">
			<input type="hidden" id="adp" value=""/>
			<input type="hidden" value="${member.id}" name="id">
		</form>
		
		</div>
		<span class="blank"></span>
	</section>
	
</article>


<script>

	
	
	$("#fake").click(function(){
		$(this).attr("disabled", "disabled");
		window.name = "InfoMemberDetail";
		var popup = window.open("adminPw","관리자 비밀번호 확인" ,"width = 550, height = 150");
		
		var timer = setInterval(function(){
			
			if(popup.closed) {
				clearInterval(timer);
				if($("#adp").val() == ''){
					$("#fake").attr("disabled", true);
				}	
				else {
					$("#fake").attr("disabled", false);
					$("#fake").after('<input type="submit" value="삭제" id="delPro">');
			 		$("#fake").remove(); 
				}
				$("#delPro").click(function(){
		
					var delConf = confirm("회원정보를 삭제하겠습니다. 진행하시겠습니까?");	
					if(delConf == true){
							window.close();
							return true;
					}else if(delConf == false){		
							window.close();
							return false;
					}	
				
				});
			}
		}, 300)

	});
		
		
</script>


</body>
</html>