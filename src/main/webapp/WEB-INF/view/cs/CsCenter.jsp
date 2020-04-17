<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>cs</title>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous">
</script>

<style>

html {
	height: 100%;
}

body {
	/* background-image: url('${pageContext.request.contextPath}/resources/images/신세경1.jpg'); */
	background-size: cover;
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
	height: 100%;
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
	border-top: 2px solid #eee;
	margin-bottom: 50px;	
}

div#containerBox {
	height: 500px;
 	float: right;
	width: calc(100% - 200px - 20px);
}

#containerBox h4 {
	text-align: center;
}

aside {
	float: left;
	width: 200px;
	border-right: 2px solid #eee;
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
	list-style: none;
}

.t {
    width: 160px;
    height: 100px;
    font-family: 'Roboto', sans-serif;
    font-size: 18px;
    text-transform: uppercase;
    letter-spacing: 2.5px;
    font-weight: 500;
    color: white;
    background-color: #A6A6A6;
    border: none;
    /* border-radius: 35px; */
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

.quickMenu {
	text-align: center;
	margin-top: 30px;
}

button {
  background:none;
  border:0;
  outline:0;
  cursor:pointer;
}
.tab_menu_container {
  display:flex;
  margin-top: 30px;
}
.tab_menu_btn {
  width:100px;
  height:40px;
  transition:0.3s all;
}
.tab_menu_btn.on {
  border-bottom:2px solid #df0000;
  font-weight:700;
  color:#df0000;
}
.tab_menu_btn:hover {
  color:#df0000;
}
.tab_box {
  display:none;
  padding:20px;
}
.tab_box.on {
  display:block;
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
			<%@ include file="../include/CSAside.jsp"%>
		</aside>	
		<div id="containerBox">
					<h4>고객 센터</h4>		
					
			<div class="quickMenu">
					<button id="regiInfo" class="t">고객문의<br>처리절차</button>
					<button id="cancle" class="t">반품<br>취소요청</button>
					<button id="csqa" class="t">고객센터<br>문의내역</button>
					<button id="question" class="t">1:1<br>문의하기</button>
					<button id="chat" class="t">1:1<br>채팅문의</button>
			</div> 	
				
				
			<div class="tab_wrap">		 
			  <div class="tab_menu_container">
			    <button class="tab_menu_btn on" type="button">회원정보</button>
			    <button class="tab_menu_btn" type="button">주문</button>
			    <button class="tab_menu_btn" type="button">결제</button>
			    <button class="tab_menu_btn" type="button">배송</button>
			    <button class="tab_menu_btn" type="button">취소/환불</button>
			    <button class="tab_menu_btn" type="button">권준호</button>
			    <button class="tab_menu_btn" type="button">양호열</button>
			  </div> <!-- tab_menu_container e -->
			
			  <div class="tab_box_container">
			    <div class="tab_box on">고릴라 주장</div>
			    <div class="tab_box">빨간 원숭이</div>
			    <div class="tab_box">농구천재</div>
			    <div class="tab_box">북산의 돌격대장</div>
			    <div class="tab_box">돌아온 풍운아</div>
			    <div class="tab_box">식스맨</div>
			    <div class="tab_box">사실 작중 제일 멋쟁이</div>
			  </div> <!-- tab_box_container e -->	
			</div>

				
					
		</div>
	</section>
</div>


<script>

$('.tab_menu_btn').on('click',function(){
	  //버튼 색 제거,추가
	  $('.tab_menu_btn').removeClass('on');
	  $(this).addClass('on')
	  
	  //컨텐츠 제거 후 인덱스에 맞는 컨텐츠 노출
	  var idx = $('.tab_menu_btn').index(this);
	  
	  $('.tab_box').hide();
	  $('.tab_box').eq(idx).show();
	});

</script>

</body>
</html>