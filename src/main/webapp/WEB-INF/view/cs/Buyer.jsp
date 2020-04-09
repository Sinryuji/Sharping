<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">


<title>Buyer</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/member_customer.css' type='text/css' media='all' />
<script language="JavaScript" type="text/javascript" src="http://script.auction.co.kr/style/js/common.js"></script>
<link rel="stylesheet" href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>
<script src="//code.jquery.com/jquery.min.js"></script>
    <style>
    	
    	html {
			height: 100%;
		}
    	
    	body{
   	  		background-image:url('https://paulhueman.co.kr:443/bbs/data/file/banner/2009714319_4Qzoxjug_20544c1b6b40a4acc5de0a9c3bde79bbdb7d68db.jpg');
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
		
  	  	
   	  	
    </style>
</head>

<body>

<div class="wrap">
		<nav class="navbar navbar-default">
	<!-- <nav class="navbar"> -->
		<div id="navBox">
			<%@ include file="../include/Nav.jsp"%>
		</div>
	</nav>
		<div id="header">
		
		<h1>
			고객센터
		</h1>
			<div class="guest-header">
					<ul class="guest-tap">
						<li><a id="t1" href="#tab01">구매회원</a></li>
						
						<li><a id="t2" href="#tab02">판매회원</a></li>
					</ul>
				</div>
		</div>
				<div id="tab01" class="tab-contents">
				<%-- 	<form action="memberList">
						<input type="text" name="keywordM" placeholder="키워드를 입력하세요."
							value="${keywordM}" /> <input type="submit" id="btnSearch" value="검색">
					</form> --%>
				</div>
<!--     고객센터 해더           -->		
		
		
		
		<div class="body">
			
			<div id="contents">
			
				<div id="cont">
				
					<h1 id="buyer_title" class="title" style="display:none"> 구매 고객센터 </h1>
					<h1 id="seller_title" class="title" style="display:none"> 판매 고객센터 </h1>
					
					<div class="buyer_quick">
						<ul class="qiocl-menu-lick">
							<li id="regiInfo" class="on"><a href="#">고객문의 처리절차</a></li>
							<li id="cancle"> <a href="#">반품/취소요청</a></li>
							<li id="csqa"><a href="#">고객센터 문의내역</a></li>
							<li id="one-on-one"><a href="#">1:1문의하기</a></li>
							<li id="one-on-chat"><a href=#>1:1채팅문의</a>
						</ul>
					</div>
					
					<div class="one-tab-area">
						<span class="all-view-btn">전체보기</span>
						<div class="all-view-layer">
						<ul class="all-one-depth">
							<li class="tepth-child1">
								<strong>회원정보</strong>
								<ul class="all-view-list">
									<li>
										<a href="#">회원가입/정보수정</a>
									</li>
									<li>
										<a href="#">아이디/비밀번호</a>
									</li>
									<li>
										<a href="#">로그인</a>
									</li>
									<li>
										<a href="#">탈퇴/재가입</a>
									</li>
									<li>
										<a href="#">구매등급</a>
									</li>
								</ul>
							</li>
							<li class="tepth-child2">
								<strong>주문</strong>
								<ul class="all-view-list">
									<li>
										<a href="#">주문방법</a>
									</li>
									<li>
										<a href="#">주문내역/확인</a>
									</li>
									<li>
										<a href="#">상품찾기/문의</a>
									</li>
									<li>
										<a href="#">탈퇴/재가입</a>
									</li>
									<li>
										<a href="#">구매결정/후기</a>
									</li>
								</ul>
							</li>
							<li class="tepth-child3">
								<strong>결제</strong>
								<ul class="all-view-list">
									<li>
										<a href="#">입금확인</a>
									</li>
									<li>
										<a href="#">무통장입금</a>
									</li>
									<li>
										<a href="#">카드결제</a>
									</li>
									<li>
										<a href="#">영수증</a>
									</li>
									<li>
										<a href="#">결제</a>
									</li>
								</ul>
							</li>
							<li class="tepth-child4">
								<strong>배송</strong>
								<ul class="all-view-list">
									<li>
										<a href="#">배송기간/확인</a>
									</li>
									<li>
										<a href="#">배송지연</a>
									</li>
									<li>
										<a href="#">배송비</a>
									</li>
								</ul>
							</li>
							<li class="tepth-child5">
								<strong>취소/환불</strong>
								<ul class="all-view-list">
									<li>
										<a href="#">주문취소</a>
									</li>
									<li>
										<a href="#">환불확인/기간</a>
									</li>
								</ul>
							</li>
							<li class="tepth-child6">
								<strong>반품/교환</strong>
								<ul class="all-view-list">
									<li>
										<a href="#">반품요청/승인</a>
									</li>
									<li>
										<a href="#">반품환불지연</a>
									</li>
									<li>
										<a href="#">반품운송비</a>
									</li>
									<li>
										<a href="#">A/S 및 교환</a>
									</li>
								</ul>
							</li>
							<li class="tepth-child7">
								<strong>서비스</strong>
								<ul class="all-view-list">
									<li>
										<a href="#">이벤트</a>
									</li>
									<li>
										<a href="#">사이트오류</a>
									</li>
								</ul>
							</li>
						</ul>
						</div>
						<ul class="one-tab">
							<li id="li_M01" class="on">
								<a href="#">회원정보</a>
							</li>
							<li id="li_M02">
								<a href="#">주문</a>
							</li>
							<li id="li_M03">
								<a href="#">결제</a>
							</li>
							<li id="li_M04">
								<a href="#">배송</a>
							</li>
							<li id="li_M05">
								<a href="#">취소/환불</a>
							</li>
							<li id="li_M06">
								<a href="#">반품/교환/AS</a>
							</li>
							<li id="li_M07">
								<a href="#">서비스</a>
							</li>
						</ul>
					</div>
					<div id="tabCont1" class="tab-cont" style="display:block;">
						<ul class="two-tab">
							<li id="subLi_" class="on"></li>
							<li id="subLi_01">
								<a href="#"></a>
							</li>
							<li id="subLi_02">
								<a href="#"></a>
							</li>
							<li id="subLi_03">
								<a href="#"></a>
							</li>
							<li id="subLi_04">
								<a href="#"></a>
							</li>
							<li id="subLi_05">
								<a href="#"></a>
							</li>
						</ul>
						<div id="tabCont1-0" class="subtab-cont" style="display:block;">
							<div class="inquiry-board qna-board">
								<table summary="자주찾는 문의의 구분, 질문제목 및 답변">
									<caption>판매 - 전체 자주찾는 문의</caption>
									<colgroup>
										<col style="width:14%">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">질문제목 및 답변</th>
										</tr>
									</thead>
									<tbody id="faqListTbody"> 
										<tr id="M0103001" class="questions">
											<td class="division">로그인</td>
											<td onclick="fnFaqContentShow('M0103001');">
											<div class="subject">
												<strong>로그인이 안돼요</strong>
												<span class="vh_btn">
												<a>
												<img src="" class="faqListIcons" id="faqListIcon_M0103001">
												</a>
												</span>
											</div>
											</td>
										</tr>
										<tr class="answer" id="M0103001_sub" style="display:none;">
											<td class="division"></td>
											<td>
											<div class="answer-cont">
												<p class="innerp_s mtxs">로그인이 되지 않는 경우는 다음 사항을 확인하세요.
												</p>
												<p class="innerp_s">&nbsp;</p>
												<p class="innerp_s">
													<span style="color:#ff6600;">
														<strong>아이디 비밀번호 확인</strong>
													</span>
													<br>
													"로그인이 안되실 경우에는 "로그인" 페이지에 있는 "<a href="#" target="_blank">아이디 찾기</a>
													"또는"<a href="#" target="_blank">비밀번호찾기</a>" 에서 아이디와 비밀번호를 확인하여 주십시오.
													참고로, 등록된 정보 기준으로 아이디찾기가 이루어지므로 동일한 등록정보를 가진 타 아이디가 함께 검색 될 수 있습니다."
													</p>
												<p class="innerp_s">
													<strong>
														<span style="color:#ff6600;">비밀번호 입력 오류</span>
													</strong>	
													<br>
													"지속적으로 잘못된 비밀번호를 입력할 경우 로그인이 제한될 수 있습니다."
													<br>
													<a href="#" target="_blank">비밀번호 제설정</a>
													"을 통해 본인 인증 후 비밀번호를 재설정 하시면 됩니다."
											</div>
											</td>
										</tr>
										<tr id="M0104001" class="questions">
											<td class="division">탈퇴/재가입</td>
											<td onclick="fnFaqContentShow('M0104001');">
												<div class="subject">
													<strong>회원탈퇴는 어떻게 하나요?</strong>
													<span class="vn-btn">
													<a>
														<img src="" class="faqListIcons" id="faqListIcon_M0104001">
													</a>
													</span>
												</div>
											</td>
										</tr>
										<tr class="answer" id="M0103001_sub" style="display:none;">
											<td class="division"></td>
											<td>
												<div class="answer-cont">
												  <p class="innerp_s mtxs">
												  	<span style="font-family: 'malgun gothic';">
												  	"회원탈퇴는 고객님의 "
												  	  <span class="color02">마이페이지 > 회원정보 > </span>
												  	  	<a href="#" target="_black">회원정보 수정</a>
												  	  	"페이지에서 신청할 수 있습니다."
												  	</span>
												  </p>
												 <ul class="innertxt innerp_s">
												 	<li class="mtxxs">
												 		<h6>
												 			<span style="font-family: 'malgun gothic';">1. 진행중인 판매건이 있는경우</span>
												 		</h6>
												 	<p class="innerp_b">
												 		<span style="font-family: 'malgun gothic';">진행중인 판매가 종료된 이후에 탈퇴하실 수 있습니다.</span>
												 		<br>
												 		<span style="font-family: 'malgun gothic';">(판매 종료시점은 판매자가 상품등록시 설정한 판매종료기간이 끝난 이후입니다.)</span>
												 	</p>
												 	</li>
												 </ul>
												</div>
											</td>
											</tr>
											<tr id="M0104001" class="questions"></tr>
											<tr class="answer" id="M0104001_sub" style="display:none;"></tr>
											<tr id="M0101001" class="questions">
												<td class="division">회원가입/정보수정</td>
												<td onclick="fnFaqContentShow('M0101001');">
													<div class="subject">
														<strong>회원 정보를 변경하고 싶어요.</strong>
														<span class="vh-btn">
															<a>
																<img src="" class="faqListIcons" id="faqListIcon_M0101001">
															</a>
														</span>
													</div>
												</td>
											</tr>
											<tr class="answer" id="M0101001_sub">
												<td class="division"></td>
												<td>
													<div class="answer-cont">
														<div id="M0101001_content">
															<p class="innerp_s mtxs">
															<span style="font-family: 'malgun gothic';">
															"회원정보 변경은 회원님의"
															<span class="color02">홈 > 회원정보 > </span>
															<a href="#" target="_blank">회원정보 수정</a>
															"페이지에서 변경이 가능합니다."
															</span>
															</p>
															<span style="font-family: 'malgun gothic';"></span>
														</div>
														
													</div>
												</td>
											</tr>
											
											
										
									</tbody>
									
								
								
								</table>
							
							</div>
						
						</div>
					
					
					</div>
					</div>
					</div>
					</div>
					</div>
<script>
var size = '${noticeSize}';

$(document).ready(function(){
	
	var left = 0;

	for(var i=0 ; i<size; i++){
			var strS = '#noticeSubject'+i;
			var strD = '#noticeDate'+i;
			var strT = '#noticeText'+i;
			var strN = '#noticeNum'+i;
			
			$.ajax({
				url : "<%=request.getContextPath()%>/notice",
					type : "post",
					data : {
						noticeSubject : $(strS).val(),
						noticeDate : $(strD).val(),
						noticeText : $(strT).val(),
						noticeNum : $(strN).val()
					},
		
					
					success : function(data) {
						left += data.notice.noticeNum * 200;
						window.open("noticee?noticeSubject=" + data.notice.noticeSubject + "&noticeDate=" + data.date + "&noticeText=" + data.notice.noticeText, "popup" + data.notice.noticeNum, "width=400, height=400, top=30, resizable = no," + "left=" + left);
					} 
					
			});
			
	}
	})
	

	// 카테고리@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// 대분류 카테고리명 클릭하는 경우
	$(document).on("click", '.depthOne', function(){
		
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
		
		$('.mainCategoryScroll').slideToggle("slow");
	})
	
	// 최근 본 상품 버튼
	
	$(document).on("click", "#latelyViewProduct", function(){
		
		location.href = "<%=request.getContextPath()%>/latelyViewProduct";
		
	})
	
	
</script>



<script src="${pageContext.request.contextPath}/asset/js/bootstrap.js"></script>

</body>
</html>