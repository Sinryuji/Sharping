<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MyPage</title>

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

section#container::after {
	content: "";
	display: block;
	clear: both;
}

div#containerBox {
	float: right;
	width: calc(100% - 200px - 20px);
}

div#filterBox {
	float: right;
	width: calc(100% - 200px - 20px);
	padding-bottom: 10px;
}

aside {
	float: left;
	width: 200px;
	position: fixed;
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
	list-style: none;
}

select, #firstDate, #secondDate {
	border: 1px solid #ccc;
	border-radius: 50px;
	color: #666;
	text-align: center;
	padding: 6px;
}

.td1, .td2, .td3, .td4 {
	vertical-align: middle;
}

.td2 {
	border-left: 3px solid #eee; 
}

#deposit {
	margin-bottom: 10px;
}

#submit, #deposit, #cancel, #deliveryTracking, #review, #buyConfirmButton {
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

#submit:hover, #deposit:hover, #cancel:hover, #deliveryTracking:hover, #review:hover, #buyConfirmButton:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}

footer#footer {
	background: #e7e7e7;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	height: 190px;
	padding: 7px 0;
	text-align: center;
}

footer#footer div {
	display: inline-block;
	margin-right: 10px;
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

		<article>
			<section id="container">
				<aside>
					<%@ include file="../include/Aside.jsp"%>
				</aside>

				<div id="containerBox">
					<h4>마이페이지</h4>
				</div>

				<div id="filterBox">
					<form action="myPage" id="submitInfo" onsubmit="return false">
						<input type="date" name="firstDate" id="firstDate">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
						<input type="hidden"> <input type="date" name="secondDate"
							id="secondDate">
						<!-- <input type="submit" value="검색"> -->
						<!-- </form>
      <form action="myPage"> -->
						<input type="text" id="keywordO" name="keywordO"
							placeholder="키워드를 입력하세요." value="${keywordO}" />
						<!-- <input type="submit" value="검색"> -->
						<!-- </form>
      <form action="myPage" name="sort" id="sort"> -->
						<select name="state" id="state">
							<option value="전체 주문 상태"
								${state == "전체 주문 상태" ? "selected" : "" }>전체 주문 상태</option>
							<option value="입금 대기" ${state == "입금 대기" ? "selected" : "" }>입금
								대기</option>
							<option value="결제 완료" ${state == "결제 완료" ? "selected" : "" }>결제
								완료</option>
							<option value="배송 준비중" ${state == "배송 준비중" ? "selected" : "" }>배송
								준비중</option>
							<option value="배송 중" ${state == "배송 중" ? "selected" : "" }>배송
								중</option>
							<option value="배송 완료" ${state == "배송 완료" ? "selected" : "" }>배송
								완료</option>
							<option value="구매 확정" ${state == "구매 확정" ? "selected" : "" }>구매
								확정</option>
							<option value="주문 취소" ${state == "주문 취소" ? "selected" : "" }>주문
								취소</option>
							<option value="반품 완료" ${state == "반품 완료" ? "selected" : "" }>반품
								완료</option>
							<option value="교환 완료" ${state == "교환 완료" ? "selected" : "" }>교환
								완료</option>
						</select> <input type="button" id="submit" value="검색">
					</form>
				</div>


				<div id="hiddenSubmitInfo">
					<form id="hiddenSubmit" action="myPage">
						<input type="hidden" id="hiddenState" name="state"> <input
							type="hidden" id="hiddenKeywordO" name="keywordO">
					</form>
				</div>

				<table>
					<thead>
						<tr>
							<th>주문일</th>
							<th>상품명/주문옵션/주문번호</th>
							<th>판매자</th>
							<th>주문상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty ordersJsonArray}">
							<tr>
								<td colspan="4">해당하는 상품이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty ordersJsonArray}">
							<c:forEach var="order" items="${ordersJsonArray}"
								varStatus="status">

								<c:forEach var="orderList" items="${order.orderLists}"
									varStatus="status2">
									<tr class="tr">
										<c:if
											test="${order.payNum != order.prePayNum || status.index == 0}">
											<td rowspan="${order.payNumCount}" class="td1">
												${order.orderData}<br> 
												결제 금액 : ${order.payPrice}<br>
												결제번호 : ${order.payNum}
											</td>
										</c:if>
										<td class="td2"><img src="opload/${orderList.productThumb}" style="width: 50px;"><br>
											상품명 : <a href="#" onclick="productView(${orderList.productNum})">${orderList.productName}</a><br> 
											주문 옵션 : ${orderList.optionName}<br> 
											주문 번호 : ${order.orderNum}
										</td>
										<td class="td3">${orderList.storeName}</td>
										<td class="td4">${order.state}
											<c:if test="${order.state == '입금 대기'}">
												<form action="insertMoney">
													<input type="hidden" name="payNum" value="${order.payNum}">
													<input type="submit" id="deposit" value="입금">
												</form>
												<form action="orderCancle" name="cancleInfo" method="post">
													<input type="hidden" name="orderNum" value="${order.orderNum}"> 
													<input type="submit" id="cancel" value="주문 취소">
												</form>
											</c:if> 
											<c:if test="${order.state == '배송 중'}">
												<button type="button" id="deliveryTracking" class="deliveryTracking" value="${order.orderNum}">배송조회</button>
											</c:if>
											<c:if test="${order.state == '배송 완료'}">
												<br>
												<button type="button" id="deliveryTracking" class="deliveryTracking" value="${order.orderNum}">배송조회</button>
												<form id="buyConfirm${order.orderNum}" action="buyConfirm">
												<input type="hidden" name="orderNum" value="${order.orderNum}">
												<button type="button" id="buyConfirmButton" class="buyConfirm" value="${order.orderNum}">구매확정</button>
												</form>
											</c:if>
											<c:if test="${order.state == '구매 확정'}">
												<br>
												<button type="button" id="review" class="review" value="${order.orderNum}">상품후기</button>
												<input type="hidden" id="on" value=""> 
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:forEach>
						</c:if>
					</tbody>
				</table>

			</section>
		</article>

		<footer id="footer">
			<div id=footerBox>
				<%@ include file="../include/Footer.jsp"%>
			</div>
		</footer>

	</div>

	<script>

<%-- $('#state').change(function(){
   var frmData = document.sort;
   frmData.action = "<%=request.getContextPath()%>/myPage";
   frmData.submit();
}); --%>

<%-- $(document).ready(function(){
   var state = "<%=request.getParameter("state")%>";
   if(state == "null") {
      $('#state').val("전체 주문 상태").prop("selected", true);
   }else {
   $('#state').val(state).prop("selected", true);
   }
}) --%>

function productView(productNum){
	var url = "${pageContext.request.contextPath}"+"/product";
	url = url + "?productNum=" + productNum;
	location.href = url;
}

$(document).ready(function() {
    $("#keywordO").keydown(function(key) {
        if (key.keyCode == 13) {
           if($('#firstDate').val() == "" && $('#secondDate').val() == "") {
              var f = $('#hiddenSubmit');
  
              f.submit();
           }
           
           else{
              var f = $('#submitInfo');
              f.removeAttr("onsubmit");
              f.submit();
           }
        }
    });
});


$('#submit').click(function(){
   
   if($('#firstDate').val() == "" && $('#secondDate').val() == "") {
      var f = $('#hiddenSubmit');
      f.submit();
   }
   
   else{
      var f = $('#submitInfo');
      f.removeAttr("onsubmit");
      f.submit();
   }
   
})

$('#state').change(function(){
   $('#hiddenState').val($(this).val());
})

$('#keywordO').change(function(){
   $('#hiddenKeywordO').val($(this).val());
})

$('.deliveryTracking').click(function(){
   
   var popTitle = "popupOpener"
      window.open("",popTitle, "width=800, height=500");
   
   var f = document.createElement("form");
   
   f.name="deliveryTracking";
   f.action="<%=request.getContextPath()%>/deliveryTracking";
   f.method="post";
   f.target=popTitle;
   
   var elem = document.createElement("input");
   
   elem.setAttribute("type", "hidden");
   elem.setAttribute("name", "orderNum");
   elem.setAttribute("value", $(this).val());
   
   f.appendChild(elem);
   
   document.body.appendChild(f);
   
   f.submit();
})

$('.buyConfirm').click(function(){
	
	var confirmResult = confirm("구매를 확정 하시겠습니까? 구매를 확정 하시면 주문 취소가 불가능 합니다!");
	
	if(confirmResult == true) {
		var str = "#buyConfirm" + $(this).val();
		$(str).submit();
	}
	
	else if (confirmResult == false) {
		
		alert("구매 확정이 취소 되었습니다!");
	}
	
})

	/* 해당 주문건에 대한 후기가 작성되어있는지 확인 */
 	$('.review').click(function(){
 		$("#on").val($(this).val());
 		var on = $(this).val();
	 	$.ajax({
	        url : "<%=request.getContextPath()%>/reviewChk",
	           type : "post",
	           data : {
	              orderNum : on
	           }, 
	           success: function(result) {
	              if(result == 1){
	            	  alert('이미 후기가 등록되어있습니다.');
	            	  return false;
	              } else {
	           		/* 해당 주문에 대한 후기가 없다면 */
            	  /* 상품 후기 팝업창 */
            	  	var pop;
           	   		var url = "review";
           	   		var name = "review";
           	   		var option = "width = 600, height = 550, top = 100, left = 800";
           	   		pop = window.open(url, name, option);
	              }
	           }
	     });
 	});

</script>

	<script src="${pageContext.request.contextPath}/asset/js/bootstrap.js"></script>
</body>
</html>