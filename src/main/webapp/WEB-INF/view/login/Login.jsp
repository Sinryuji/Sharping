<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<style>
/* 
형찬이를 위한 고화질 여자 배경 모음

https://paulhueman.co.kr:443/bbs/data/file/banner/2009714319_4Qzoxjug_20544c1b6b40a4acc5de0a9c3bde79bbdb7d68db.jpg
https://img.jjang0u.com/data3/chalkadak/160/201407/22/140603249149490.jpg
https://s.gae9.com/trend/9939cccd1c396536.orig
https://img.jjang0u.com/data3/chalkadak/160/201407/22/140603249578590.jpg
https://paulhueman.co.kr:443/bbs/data/file/banner/2009714319_4Qzoxjug_20544c1b6b40a4acc5de0a9c3bde79bbdb7d68db.jpg
https://img.jjang0u.com/data3/chalkadak/160/201407/22/140603249539375.jpg
https://pbs.twimg.com/media/DBtbxP2U0AA7XN3.jpg
https://rgo4.com/files/attach/images/2676751/579/489/012/f4cb61f23e53a1939cd05d2e6dec0b2c.jpg
https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSIuQhsT62O8EGWzni7g9O9dD8l2nSU_1chylhe7ubWTC2TEc3w&usqp=CAU
https://t1.daumcdn.net/cfile/tistory/9964693359EE5F6003
https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile10.uf.tistory.com%2Fimage%2F99B65B3359ED5DE925AD38
https://t1.daumcdn.net/cfile/tistory/9949D53359EE5E4C37
https://t1.daumcdn.net/cfile/tistory/991781435CBD4B8F1E
https://postfiles.pstatic.net/MjAxODA2MDlfMTI2/MDAxNTI4NTI0NjA5MDA3.fyZB4lcA_K26ZwS66yz0dMlQc0uwb4u0zFu4e14b78sg.Fd_4kRAsC3F6GEtewr4PvWSG79GzH9nUk-kpxfDiCSMg.JPEG.amykims/29.jpg?type=w966
https://c.wallhere.com/photos/5d/7e/1920x1200_px_blue_eyes_brunette_face_women-602838.jpg!d
https://t1.daumcdn.net/cfile/tistory/994E094C5B6CFE3C19
https://t1.daumcdn.net/cfile/tistory/1574BE2F4C67FF6E69
 */
html {
	height: 100%;
}

body {
	background-image: url('https://images.pexels.com/photos/1470589/pexels-photo-1470589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');
	background-size: cover;
	padding: 0;
	margin: 0;
	height: 100%;
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

#container {
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	padding: 20px 0;
}

#containerBox {
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	border: 2px solid transparent;
	width: 800px;
	background: pink;
	background-color: rgba(255, 217, 250, 0.5);
}

.blank {
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle;
}

.loginBox {
	text-align: center;
	margin-top: 50px;
	margin-left: 120px;
	height: 120px;
}

.pad {
	color: white;
	height: 35px;
	vertical-align: middle;
	font-size: 16px;
	border: none;
	padding: 10px;
	text-align: left;
	outline: none;
	width: 250px;
	background: #D1B2FF;
	opacity: 0.8;
}

.in {
	display: inline-block;
	align-items: center;
	justify-content: center;
	vertical-align: middle;
}

.idPw {
	float: center;
	display: inline-block;
	vertical-align: middle;
}

#rememberId {
	margin-right: 22px;
	margin-bottom: 13px;
}

.gst {
	text-align: center;
	margin-left: 80px;
}

.span {
	text-align: center;
	margin-right: 100px;
	font-size: 20px;
	color: #A566FF;
}

.in2 {
	margin-right: 40px;
	margin-bottom: 30px;
}

.pad2 {
	color: black;
	height: 25px;
	vertical-align: middle;
	font-size: 16px;
	border: none;
	padding: 10px;
	text-align: left;
	outline: none;
	width: 150px;
	background: #D1B2FF;
}

#login {
	width: 130px;
	height: 90px;
	font-family: 'Roboto', sans-serif;
	font-size: 25px;
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

#login:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}

#t, #searchGuest {
	width: 120px;
	height: 40px;
	font-family: 'Roboto', sans-serif;
	font-size: 13px;
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

#t:hover, #searchGuest:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}

input::-ms-input-placeholder {
	color: gray;
}

input::-webkit-input-placeholder {
	color: gray;
}

input::-moz-placeholder {
	color: gray;
}

</style>
</head>
<body>

	<nav class="navbar navbar-default">
		<div id="navBox">
			<%@ include file="../include/Nav.jsp"%>
		</div>
	</nav>

	<section id="container">
		<div id="containerBox">

			<form action="loginComplete">
				<div class="loginBox">
					<div class="idPw">
						<input type="text" autocomplete="off" class="pad" name="id" placeholder="ID" value="${rememberId}" />
						<br><br>
						<input type="Password" autocomplete="off" class="pad" name="password" value="" placeholder="Password" />
					</div>
					&nbsp;&nbsp;
					<div class="in">
						<input type="submit" id="login" value="LOGIN">
					</div>
				</div>
				
				<div id="rememberId">
					<input type="checkbox" name="rememberId" value="true"
						${rememberId != "" ? "checked" : "" }>&nbsp;아이디 기억하기
				</div>
				
			</form>
			
			<div class="two">
				<input type="button" id="t" onclick="location.href='${pageContext.request.contextPath}/regist'" value="회원가입">&nbsp; 
				<input type="button" id="t" onclick="location.href='${pageContext.request.contextPath}/searchIdChangePw'" value="ID/PW찾기">
			</div>
			
			<hr color="gray" width="60%" size="2px" noshade>

			<div class="gst">
				<div class="span">
					<b>비회원 주문 조회</b>
				</div>
				
				<form id="selectGuest" action="selectGuest">
					<div class="in2">
						<input type="text" class="pad2" name="guestName" value="${guestName }" placeholder="비회원 이름" onfocus="this.value=''" />
						<input type="text" class="pad2" name="guestPhone" value="${guestPhone }" placeholder="비회원 전화번호" onfocus="this.value=''" /> 
						<input type="text" class="pad2" name="guestPassword" value="${guestPassword }" placeholder="비회원 비밀번호" onfocus="this.value=''" />&nbsp; 
						<input type="button" id="searchGuest" name="selectGuest" value="조회하기" />
					</div>
				</form>
			</div>


		</div>
		<span class="blank"></span>
	</section>

<script>
 	$(document).on("click", "#searchGuest", function(){		 
		if($("input[name=guestName]").val() == ""){
			alert("비회원 이름을 입력해주세요!");
		} else if($("input[name=guestPhone]").val() == ""){
			alert("비회원 전화번호를 입력해주세요!");
		} else if($("input[name=guestPassword]").val() == "") {
			alert("비회원 비밀번호를 입력해주세요!");
		} else {
			$("#selectGuest").submit();
		}
	});
</script>
</body>
</html>