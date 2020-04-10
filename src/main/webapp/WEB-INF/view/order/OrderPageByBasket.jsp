<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OrderPage</title>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>
<script src="//code.jquery.com/jquery.min.js"></script>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />
	
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous">
</script>
<!-- 카카오 주소 찾기 api -->
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					$("#toPost").val(data.zonecode);
					$("#toAddress").val(data.address);
					$("#toAddressEtc").focus();
					console.log(data);
				}
			}).open();
		}
	</script>

<style>

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
}

.mainhead {
	font-weight: bold;
	font-size: 30px;
}

.img {
	float: left;
	padding-left: 10px;
	vertical-align: middle;
}

.proInfo {
	float: center;
	vertical-align: middle;
}

.t1_td {
	border-right: 0.2px solid gray;
	border-left: 0.2px solid gray;
	padding-left: 10px;
	vertical-align: middle;
}

.pricetd {
	vertical-align: middle;
	border-rigth : 1px solid black;
}

.table1 tbody tr {
	border-bottom: 3px solid gray;
}

.table2 {
	border: 0.2px solid gray;
}

.table2 thead tr {
	text-align: left;
	border: 0.2px solid gray;
	background: #EAEAEA;
}


.table2 thead tr span {
	font-size: 13px;
	color: #F15F5F;
}

.table2 td span {
	font-size: 13px;
	color: #F15F5F;
}

.table2 thead th {
	padding: 10px;
}

.table2 tbody tr, .table2 tbody td {
	padding: 10px;
}

.td1 {
	background: #EAEAEA;
	vertical-align: middle;
}

.td2 {
	text-align: left;
}

#toPost {
	margin-bottom: 10px;
}

#dc {
	border-bottom: 0.2px solid gray;
}

#dm {
	border-top: 0.2px solid gray;
}

#deliveryMessage {
	width: 300px;
}

.table3 {
	border: 0.2px solid gray;
}

.table3 thead tr {
	text-align: left;
	border: 0.2px solid gray;
	background: #EAEAEA;
}

.table3 tr {
	border: 0.2px solid gray;
}

.right {
	border-right: 0.2px solid gray;
	text-align: center;
	vertical-align: middle;
}

#rowspan {
	text-align: center;
	padding-left: 10px;
}

.s1 {
	color: red;
	font-size: 30px
}

.s2 {
	font-size: 26px;
}

.tb3 {
	padding-top: 30px;
	display: inline-block;
}

select {
	border: 1px solid #ccc;
	border-radius: 50px;
	color: #666;
	text-align: center;
	padding: 6px;
}

#payment {
	width: 220px;
	height: 80px;
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
	margin: 5px;
}

#payment:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}

#myDeliveryAddress {
	width: 150px;
	height: 30px;
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

#myDeliveryAddress:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}

</style>
</head>
<body>
	<c:forEach var="product" items="${orderListArray}" varStatus="status">
		<c:if test="${product.cnt > product.stock} ">
			<script>
				alert("상품의 재고 보다 선택한 수량이 많습니다. 재고 : " + ${product.stock});
			</script>
		</c:if>
	</c:forEach>
	<nav class="navbar navbar-default">
		<div id="navBox">
			<%@ include file="../include/Nav.jsp"%>
		</div>
	</nav>
	
	<section id="container">
		<div id="containerBox">
		
	<form name="deliveryAddress" id="deliveryAddress" method="post">
		<input type="hidden" name="id" id="id" value="${authInfo.id}">
	</form>
	
	<form name="orderForm" id="orderForm" action="orderResultByBasket" method="post">
 			<input type="hidden" id="payPrice${stats.index}" name="payPrice"value="${totalPrice}">
			
			<span class="mainhead">주문상품</span>
			
			<table class="table1">
 				<colgroup>
					<col style="width: auto;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
				</colgroup> 
				<thead>

					<tr class="head1">
						<th>상품정보</th>
						<th>판매자</th>
						<th>배송비</th>
						<th>금액</th>
					</tr>
					
				</thead>
				
				<tbody>
				<c:forEach var="product" items="${orderListArray}" varStatus="status">
					<input type="hidden" name="productName" value="${product.productName}">
					
					<tr>
						<td>
							<div class="img">
								<img src="opload/${product.productThumb}" width="50" height="50">
							</div>
							<div class="proInfo">
								<b>${product.productName}&nbsp;&nbsp;${product.optionName}&nbsp;&nbsp;${product.cnt}개&nbsp;&nbsp;${product.productPrice}원</b>
							</div>
						</td>
						<td class="t1_td">${product.storeName}</td>
						<td class="pricetd">${product.deliveryPrice}</td>
						<td class="pricetd">${product.cnt * product.productPrice + product.deliveryPrice}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>

		<table class="table2">
			<colgroup>
				<col style="width: 25%;" />
				<col style="width: auto;" />
			</colgroup>
			<thead>
				<tr>
					<th>배송지 정보 입력</th>
					<th><span>(*필수입력)</span></th>
				</tr>
			</thead>
			<tbody>
				<tr id="dc">
					<td class="td1"><span>*</span>배송지 선택</td>
					<td class="td2">
						<label> <input type="radio"name="deliveryCheck" id="default" value="${member.name}" checked>${member.name}</label>
						<label> <input type="radio" id="new" name="deliveryCheck"value="">새로운 배송지</label> 
						<input type="button" class="b" id="myDeliveryAddress"value="나의 배송 주소록">
					</td>
				</tr>
				
				<tr>
					<td class="td1"><span>*</span>이름
					<td class="td2"><input type="text" id="toName" name="toName"value="${member.name}" readonly>
				</tr>
				<tr>	
					<td class="td1"><span>*</span>주소
					<td class="td2"><input type="text" id="toPost" name="toPost"value="${member.post}" readonly>
									<input type="text"id="toAddress" name="toAddress"value="${member.address} ${member.addressEtc}"style="width: 300px" readonly>
				</tr>					
				<tr>
					<td class="td1"><span>*</span>연락처
					<td class="td2"><input type="text" id="toPhone" name="toPhone"value="${member.phone}" readonly>
				</tr>

				<tr id="dm">
					<td class="td1">배송 메시지</td>
					<td class="td2"><input type="text" id="deliveryMessage" name="deliveryMessage" maxlength="50"></td>
				</tr>
			</tbody>
		</table>
		
		
		<div class="tb3">
			<table class="table3">
				<colgroup>
					<col style="width: 70%;" />
					<col style="width: auto%;" />
				</colgroup>
				<thead>
					<tr>
						<th class="right">결제정보 입력</th>
						<th>결제하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="right">결제 수단</td>
						<td rowspan="2" id="rowspan"><b><span class="s1">
							${totalPrice}</span></b>
							<span class="s2">원</span>
							<br>
							<input type="hidden" name="orderJson"value='${orderJson}' /> 
							<input type="hidden"name="orderListJsonArray" value='${orderListJsonArray}' /> 
							<input type="button" class="t" id="payment" value="결제하기"></td>
					</tr>
					<tr>
						<td class="right">
							<label> 
								<input type="radio"name="payingSelect" class="payingSelect" id="payBank" checked>무통장 입금
							</label>&nbsp;&nbsp;&nbsp; 
							<label> 
								<input type="radio"name="payingSelect" class="payingSelect" id="payCard">신용카드 결제
							</label>

							<p id="payBankInfo">
								입금 은행 <select name="bankCode">
											<option value="none">은행을 선택해 주세요</option>
												<c:forEach var="bankCode" items="${bankInfo}" varStatus="status">
											<option value="${bankCode.bankCode}">${bankCode.bankName}</option>
												</c:forEach>
										</select>
							</p>
							</td>
					</tr>
				</tbody>
			</table>
		</div>

	</form>		
		</div>
	</section>
	
	
	
	
	

	
<script>

var defaultInfo;
var newInfo;

$(document).on("click", "#payment", function(){
	if($("select[name=bankCode]").val() == "none") {
		alert("입금 할 은행을 선택 해 주세요!")
	}
	else if($('#toName').val() == '' ) {
		alert("받으실 분의 이름을 입력 해 주세요!")
	}
	else if($('#toPost').val() == '') {
		alert("주소를 선택해 주십시오!")
	}
	else if($('#toPhone').val() == '') {
		alert("받으실 분의 연락처를 입력 해 주세요!")
	}
	else {
		$('#orderForm').submit();
	}
	
})

$('input[name=deliveryCheck]').click(function(){
	if($('#default').is(':checked') == true) {
		defaultInfo = $('#deliveryInfo').html();
		$('#deliveryInfo').html('<input type="text" id="toName" name="toName" value="${member.name}" readonly><br><br>	<input type="text" id="toPost" name="toPost" value="${member.post}" readonly>&nbsp;<input type="text" id="toAddress" name="toAddress" value="${member.address}${member.addressEtc}" style="width : 300px" readonly><br><br><input type="text" id="toPhone" name="toPhone" value="${member.phone}" readonly><br>');
	}
	if($('#new').is(':checked') == true) {
		newInfo = $('#deliveryInfo').html();
		$('#deliveryInfo').html('<input type="text" id="toName" name="toName" value="" ><br><br> <input type="text" id="toPost" name="toPost" value="" readonly>&nbsp;<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /><br> <input type="text" id="toAddress" name="toAddress" value="" style="width : 300px" readonly>&nbsp; <input type="text" name="toAddressEtc" id="toAdressEtc" placeholder="상세주소를 입력해주세요."><br><br> <input type="text" id="toPhone" name="toPhone" value="" ><br>');
	}
});


$('#myDeliveryAddress').click(function(){
	var popTitle = "popupOpener"
	window.open("",popTitle, "width=1500, height=500");
	
	var frmData = document.deliveryAddress;
	frmData.target = popTitle;
	frmData.action = "<%=request.getContextPath()%>/deliveryAddressInOrder";
	frmData.submit();
});

var payBankInfo
$('#payBank').click(function(){
	payBankInfo = $('#payBank').html();
	$('#payBankInfo').html('입금 은행 <select name="bankCode"> <option value="none">은행을 선택해 주세요</option> <c:forEach var="bankCode" items="${bankInfo}" varStatus="status"><option value="${bankCode.bankCode}">${bankCode.bankName}</option></c:forEach></select>');
});

$('#payCard').click(function(){
	$('#payBankInfo').html(" ");
});

$('.payingSelect').click(function(){
	if($('#payBank').is(":checked")){
		$('#orderForm').attr("action", "orderResultByBasket");
	}
	if($('#payCard').is(":checked")){
		$("#orderForm").attr("action", "payingCardByBasket");
	}
});

</script>


	<script src='${pageContext.request.contextPath}/resources/js/jquery.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/js/plugins.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/js/scripts.js'></script>
	<script
		src='${pageContext.request.contextPath}/resources/js/masonry.pkgd.min.js'></script>
</body>
</html>