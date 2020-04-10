<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">


<title>cs</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous">
</script>
<link rel="stylesheet" href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>
<script src="//code.jquery.com/jquery.min.js"></script>
    <style>
    	
    	html {
			height: 100%;
		}
    	
    	body{
   	  		/* background-image:url('https://paulhueman.co.kr:443/bbs/data/file/banner/2009714319_4Qzoxjug_20544c1b6b40a4acc5de0a9c3bde79bbdb7d68db.jpg'); */
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
      		padding: 20px;
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
      		margin-bottom: 40px;
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
		ul{
			list-style: none;
			margin: auto;
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
		
		
		.btn{padding:0;background:transparent;border:0;outline:0}
		/* .clearfix::after{display:block;content:'';clear:both} */
		.tab_wrap{width:800px;margin:50px auto}
		
		/* .tab_wrap .btn_tab{
		
		float:left;
		width:120px;
		height:30px;
		background: none;
		border-radius:10px 10px 0 0;
		text-align:center;
		line-height:30px
		
		} */
		.tab_wrap #btn_tab{
		
		width:90px;
		height:30px;
		background: #eee;
		text-align:center;
		/* line-height:30px */
		
		}
		
		.tab_wrap .btn_tab.act{
		
		text-decoration:underline;
		font-weight:bold;
	    padding: 10px;
    	background: rgba(255,255,255,0.3);
		}
		
		.tab_wrap .content_area{
		display:none;
		width:100%;
		min-height:200px;
		padding:10px;
		background:#fff;
		border-radius:0 0 10px 10px;
		box-sizing:border-box;
		}
		.tab_wrap .content_area.act{
		height:10px;
		display:inline-block;
		background: none;
		
		
		}
		.tab_wrap *[data-depth="6"]{
		
		background:#BDBDBD;
		
		}
		
		#act{
			padding: 10px;
    		background: rgba(255,255,255,0.3);
		}
		
		.innerp_s{
			width:600px;
		}
		
		
		
		
		
		
		
   	  	
</style>
</head>

<body>
<div class="tab_wrap tab_area">
		<nav class="navbar navbar-default">
	<!-- <nav class="navbar"> -->
		<div id="navBox">
			<%@ include file="../include/Nav.jsp"%>
		</div>
		</nav>
		<section id="container">
		<aside>
			<%@ include file="../include/CSAside.jsp"%>
		</aside>
		<div id="containerBox"></div>
		</section>
		<div class="sDiv">
		<form action="productList" class="searchBox">
			<input type="text" autocomplete="off" name="keyword" id="search" placeholder="키워드를 입력하세요."/>
			<input type="image" src="${pageContext.request.contextPath}/resources/images/search.png" value="검색" id="btn">
		</form>
		</div>
<!--     고객센터 해더           -->		
		
		
		
					
					<div class="buyer_quick" style="margin-left:500px;">
						<div class="qiocl-menu-lick" style="margin: auto;">
							<button id="regiInfo" class="t">고객문의<br> 처리절차</button>
							<button id="cancle" class="t">반품/취소요청<br></button>
							<button id="csqa" class="t">고객센터<br> 문의내역</button>
							<button id="one-on-one" class="t">1:1문의하기<br></button>
							<button id="one-on-chat" class="t">1:1채팅문의<br></button>
						</div>
						<!-- class buyer_quick -->
					</div> 
					
					
					
						  <div class="btn_area clearfix">
						    <button class="btn btn_tab act" id="btn_tab" data-depth="0" data-idx="0" style="margin-left:620px;margin-top:70px;">회원정보</button>
						    <button class="btn btn_tab" id="btn_tab" data-depth="0" data-idx="1" style="margin-top:70px;">주문</button>
						    <button class="btn btn_tab" id="btn_tab" data-depth="0" data-idx="2" style="margin-top:70px;">결제</button>
						    <button class="btn btn_tab" id="btn_tab" data-depth="0" data-idx="3" style="margin-top:70px;">배송</button>
						    <button class="btn btn_tab" id="btn_tab" data-depth="0" data-idx="4" style="margin-top:70px;">취소/환불</button>
						    <button class="btn btn_tab" id="btn_tab" data-depth="0" data-idx="5" style="margin-top:70px;">반품/교환</button>
						    <button class="btn btn_tab" id="btn_tab" data-depth="0" data-idx="6" style="margin-top:70px;">서비스</button>
						  </div>
						  
						  <div class="content_area act" data-depth="0" data-idx="0">
							  <div class="tab_area">
							      <div class="btn_area clearfix">
							        <button class="btn btn_tab act" id="act" data-depth="6" data-idx="0" style="margin-left:650px;">회원가입/정보수정</button>
							        <button class="btn btn_tab" id="act" data-depth="6" data-idx="1">아이디/비밀번호</button>
							        <button class="btn btn_tab" id="act" data-depth="6" data-idx="2">로그인</button>
							        <button class="btn btn_tab" id="act" data-depth="6" data-idx="3">탈퇴/재가입</button>
							      </div>
							      
							      	<div class="content_area act" data-depth="6" data-idx="0" style="margin-left:650px;">
							      				<p class="innerp_s mtxs" style="font-weight: bold;">
												<span style="font-family: 'malgun gothic';">
												  	회원정보 변경은 회원님의  
												  	  <span class="color02">홈 > 마이페이지 > </span>
												  	  	<a href="#" target="_black">회원정보 수정</a>
												  	  	페이지에서 수정할 수 있습니다.
												  	</span>
												</p>
												<p class="innerp_s">&nbsp;</p>
												<p class="innerp_s mtxs" style="font-weight: bold;">
												<span style="font-family: 'malgun gothic';">
												  	회원가입은  
												  	  <span class="color02">홈  좌측상단</span>
												  	  	<a href="#" target="_black">회원정보 가입</a>
												  	  	버튼을 통해서 가입이 가능합니다. 
												  	</span>
												</p>
							      	</div>
								    <div class="content_area" data-depth="6" data-idx="1"style="margin-left:650px;">
								   				<p class="innerp_s mtxs" style="font-weight: bold;">
												<span style="font-family: 'malgun gothic';">
												  	비밀번호 및 아이디는  
												  	  <span class="color02">홈 > </span>
												  	  	<a href="#" target="_black">로그인</a>
												  	  	페이지에서 아이디 찾기 및 비밀번호 재설정 할 수 있습니다.
												  	</span>
												</p>
												<p class="innerp_s">&nbsp;</p>
												<p class="innerp_s">
													<span style="color:#ff6600;">
														<strong>아이디 찾기 및 비밀번호 재설정</strong>
													</span>
													<br>
													이메일 인증 혹은 휴대폰 번호 인증으로 아이디를 찾거나 비밀번호를 재 설정 할 수 있습니다. 
													</p>
												<p class="innerp_s">
													<strong>
														<span style="color:#ff6600;"></span>
													</strong>	
												</p>
								    </div>
								    <div class="content_area" data-depth="6" data-idx="2"style="margin-left:650px;">
								    			<p class="innerp_s mtxs" style="font-weight: bold;">로그인이 되지 않는 경우는 다음 사항을 확인하세요.
												</p>
												<p class="innerp_s">&nbsp;</p>
												<p class="innerp_s">
													<span style="color:#ff6600;">
														<strong>아이디 비밀번호 확인</strong>
													</span>
													<br>
													로그인이 안되실 경우에는 "로그인" 페이지에 있는 <a href="#" target="_blank">아이디 찾기</a>
													또는"<a href="#" target="_blank">비밀번호찾기</a>" 에서 아이디와 비밀번호를 확인하여 주십시오.
													참고로, 등록된 정보 기준으로 아이디찾기가 이루어지므로 동일한 등록정보를 가진 타 아이디가 함께 검색 될 수 있습니다.
													</p>
												<p class="innerp_s">
													<strong>
														<span style="color:#ff6600;">비밀번호 입력 오류</span>
													</strong>	
													<br>
													지속적으로 잘못된 비밀번호를 입력할 경우 로그인이 제한될 수 있습니다.
													<br>
													<a href="#" target="_blank">비밀번호 재설정</a>
													을 통해 본인 인증 후 비밀번호를 재설정 하시면 됩니다.
								    </div>
								    <div class="content_area" data-depth="6" data-idx="3"style="margin-left:650px;">
								    	<p class="innerp_s mtxs" style="font-weight: bold;">
												  	<span style="font-family: 'malgun gothic';">
												  	회원탈퇴는 고객님의 
												  	  <span class="color02">마이페이지 > 회원정보 > </span>
												  	  	<a href="#" target="_black">회원정보 수정</a>
												  	  	페이지에서 신청할 수 있습니다.
												  	</span>
												  </p>
												 <p class="innerp_s">&nbsp;</p>
												 <p class="innerp_s">
												 		<span style="color:#ff6600;">
														<strong>1. 진행중인 판매건이 있는경우</strong>
														</span>
												 	<br>
													진행중인 판매가 종료된 이후에 탈퇴하실 수 있습니다.<br>
													(판매 종료시점은 판매자가 상품등록시 설정한 판매종료기간이 끝난 이후입니다.)
													</p>
								    </div>
							  </div>  
						  </div>
						  <div class="content_area" data-depth="0" data-idx="1"> 
						     <div class="tab_area">
						     	<div class="btn_area clearfix">
						     		<button class="btn btn_tab act" id="act"data-depth="6" data-idx="0" style="margin-left:650px;">주문방법</button>
						     		<button class="btn btn_tab" id="act"data-depth="6" data-idx="1">주문내역/확인</button>
							        <button class="btn btn_tab" id="act"data-depth="6" data-idx="2">상품찾기/문의</button>
							        <button class="btn btn_tab" id="act"data-depth="6" data-idx="3">구매결정/후기</button>
						     	</div>
						     		<div class="content_area act" data-depth="6" data-idx="0" style="margin-left:650px;">
						     			<p class="innerp_s mtxs" style="font-weight: bold;">
										상품을 구매하시려면, 회원가입을 하신 후 구매하시거나 비회원으로 구매하실 수 있습니다.<br>
										단, 비회원으로 구매하실 경우 회원님들께 제공되는 혜택을 받으실 수 없으니 참고해 주세요.
												</p>
												<p class="innerp_s">&nbsp;</p>
												<p class="innerp_s">
													<span style="color:#ff6600;">
														<strong>구매방법</strong>
													</span>
													<br>
													1.원하는 상품을 키워드 또는 카테고리로 검색하신 다음 상품명 클릭 후 상품 상세정보 페이지로 이동해 주세요.
													<br>
													2.옵션을 선택하신 후 구매하기를 누르시거나 회원이신 경우 장바구니를 이용하실 수 있습니다. 
													<br>
													3.주문하신 내역은 <span class="color02"></span>
												  	  	<a href="#" target="_black">마이페이지</a>
												  	  	에서 확인 가능하십니다.
													</p>
												<p class="innerp_s">
													<strong>
														<span style="color:#ff6600;"></span>
													</strong>	
													
													
												</p>
						     		
						     		</div>
								    <div class="content_area" data-depth="6" data-idx="1"style="margin-left:650px;">주문내역어디소봄</div>
								    <div class="content_area" data-depth="6" data-idx="2"style="margin-left:650px;">상품어딨음</div>
								    <div class="content_area" data-depth="6" data-idx="3"style="margin-left:650px;">후기남기고파</div>
						     
						     </div>
						  </div>
						  
						  <div class="content_area" data-depth="0" data-idx="2"> 
						     <div class="tab_area">
						     	<div class="btn_area clearfix">
						     		<button class="btn btn_tab act" id="act"data-depth="6" data-idx="0" style="margin-left:650px;">입금확인</button>
						     		<button class="btn btn_tab" id="act"data-depth="6" data-idx="1">무통장입금</button>
							        <button class="btn btn_tab" id="act"data-depth="6" data-idx="2">카드결제</button>
							        <button class="btn btn_tab" id="act"data-depth="6" data-idx="3">영수증</button>
							        <button class="btn btn_tab" id="act"data-depth="6" data-idx="4">결제</button>
						     	</div>
						     		<div class="content_area act" data-depth="6" data-idx="0" style="margin-left:650px;">입금확인어케함</div>
								    <div class="content_area" data-depth="6" data-idx="1"style="margin-left:650px;">무통장결제어케함</div>
								    <div class="content_area" data-depth="6" data-idx="2"style="margin-left:650px;">카드결제어케함</div>
								    <div class="content_area" data-depth="6" data-idx="3"style="margin-left:650px;">현금영수증어케받음</div>
						     		<div class="content_area" data-depth="6" data-idx="4"style="margin-left:650px;">결제는뭐뭐있음</div>
						     </div>
						  </div>
						  <div class="content_area" data-depth="0" data-idx="3"> 
						     <div class="tab_area">
						     	<div class="btn_area clearfix">
						     		<button class="btn btn_tab act" id="act"data-depth="6" data-idx="0" style="margin-left:650px;">배송기간/확인</button>
						     		<button class="btn btn_tab" id="act"data-depth="6" data-idx="1">배송지연</button>
							        <button class="btn btn_tab" id="act"data-depth="6" data-idx="2">배송비</button>
						     	</div>
						     		<div class="content_area act" data-depth="6" data-idx="0" style="margin-left:650px;">배송확인어디서함</div>
								    <div class="content_area" data-depth="6" data-idx="1"style="margin-left:650px;">상품언제옴</div>
								    <div class="content_area" data-depth="6" data-idx="2"style="margin-left:650px;">배송비누가냄</div>
						     </div>
						  </div>
						  <div class="content_area" data-depth="0" data-idx="4"> 
						     <div class="tab_area">
						     	<div class="btn_area clearfix">
						     		<button class="btn btn_tab act" id="act"data-depth="6" data-idx="0" style="margin-left:650px;">주문취소</button>
						     		<button class="btn btn_tab" id="act"data-depth="6" data-idx="1">환불확인/기간</button>
						     	</div>
						     		<div class="content_area act" data-depth="6" data-idx="0" style="margin-left:650px;">주문취소할래</div>
								    <div class="content_area" data-depth="6" data-idx="1"style="margin-left:650px;">환불언제해줌</div>
						     </div>
						  </div>
						  <div class="content_area" data-depth="0" data-idx="5"> 
						     <div class="tab_area">
						     	<div class="btn_area clearfix">
						     		<button class="btn btn_tab act" id="act"data-depth="6" data-idx="0" style="margin-left:650px;">반품요청/승인</button>
						     		<button class="btn btn_tab" id="act"data-depth="6" data-idx="1">반품환불지연</button>
							        <button class="btn btn_tab" id="act"data-depth="6" data-idx="2">반품운송비</button>
							        <button class="btn btn_tab" id="act"data-depth="6" data-idx="3">A/S및 교환</button>
						     	</div>
						     		<div class="content_area act" data-depth="6" data-idx="0" style="margin-left:650px;">반품어케함</div>
								    <div class="content_area" data-depth="6" data-idx="1"style="margin-left:650px;">반품환불언제해쥼</div>
								    <div class="content_area" data-depth="6" data-idx="2"style="margin-left:650px;">반품배송비 누가냄</div>
								    <div class="content_area" data-depth="6" data-idx="3"style="margin-left:650px;">상품교환할래</div>
						     </div>
						  </div>
						  <div class="content_area" data-depth="0" data-idx="6"> 
						     <div class="tab_area">
						     	<div class="btn_area clearfix">
						     		<button class="btn btn_tab act" id="act"data-depth="6" data-idx="0" style="margin-left:650px;">이벤트</button>
						     		<button class="btn btn_tab" id="act"data-depth="6" data-idx="1">사이트오류</button>
						     	</div>
						     		<div class="content_area act" data-depth="6" data-idx="0" style="margin-left:650px;">이벤트뭐함</div>
								    <div class="content_area" data-depth="6" data-idx="1"style="margin-left:650px;">사이트에러남</div>
						     </div>
						  </div>
						   	  
</div>
<script>
	
	// 최근 본 상품 버튼
	
	$(document).on("click", "#latelyViewProduct", function(){
		
		location.href = "<%=request.getContextPath()%>/latelyViewProduct";
		
	})
	
	
</script>
<script>
function findParent(el, className){
  let check = el.parentNode.classList.contains(className);
  
  if(check === true){
     return el.parentNode;
  }else{
    return findParent(el.parentNode, className);
  }
}

function bindingTabEvent(wrap){
	let wrapEl = document.querySelectorAll(wrap);
  
  wrapEl.forEach(function(tabArea){
	  let btn = tabArea.querySelectorAll('.btn_tab');
    
    btn.forEach(function(item){
      item.addEventListener('click', function(){
    	  let parent = findParent(this, 'tab_area');
    	  let idx = this.dataset['idx'];
    	  let depth = this.dataset['depth'];
    	  let btnArr = parent.querySelectorAll('.btn_tab[data-depth="'+ depth +'"]');
        let contentArr = parent.querySelectorAll('.content_area[data-depth="'+ depth +'"]');
        
        btnArr.forEach(function(btn){ btn.classList.remove('act'); });
        this.classList.add('act');
        contentArr.forEach(function(content){ content.classList.remove('act'); });
        parent.querySelector('.content_area[data-idx="'+ idx +'"][data-depth="'+ depth +'"]').classList.add('act');
      });
    });
  });
}

bindingTabEvent('.tab_wrap');
</script>


</body>
</html>