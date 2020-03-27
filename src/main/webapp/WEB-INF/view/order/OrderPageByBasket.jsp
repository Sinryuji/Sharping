<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderPage</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous">
</script>
<!-- 카카오 주소 찾기 api -->
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					$("#post").val(data.zonecode);
					$("#address").val(data.address);
					$("#addressEtc").focus();
					console.log(data);
				}
			}).open();
		}
	</script>
</head>
<body>

<form name="deliveryAddress" id="deliveryAddress" method="post">
	<input type="hidden" name="id" id="id" value="${authInfo.id}">
</form>
<form name="orderForm" id="orderForm" action="orderResultByBasket" method="post">

<table>
<c:forEach var="product" items="${product}" varStatus="status">
상품 이미지 : ${product.productImage}<br>
상품명 : ${product.productName}<br>
개수 : ${cnt}<br>
가격 : ${product.productPrice}<br>
판매자 : ${seller[status.index].storeName}<br>
배송비 : ${product.deliveryPrice}<br>
최종 결제 금액 : ${totalPrice}<br>

<input type="text" id="payPrice${stats.index}" name="payPrice"  value="${totalPrice}">
<input type="text" id="memberEmail${stats.index}" name="memberEmail" value="${member.email}">
<input type="text" id="memberName${stats.index}" name="memberName" value="${member.name}">
<input type="text" id="memberPhone${stats.index}" name="memberPhone" value="${member.phone}">
<input type="text" id="memberAddress${stats.index}" name="memberAddress" value="${member.address} ${member.addressEtc}">
<input type="text" id="memberPost${stats.index}" name="memberPost" value="${member.post}">
<input type="text" id="id${stats.index}" name="id" value="${member.id}">
<!--일단 주석 orderList에 들어갈 정보  -->
<input type="text" id="productName${stats.index}" name="productName" value="${product.productName}">
<input type="text" id="productThumb${stats.index}" name="productThumb" value="${product.productThumb}">
<input type="text" id="optionOneNum${stats.index}" name="optionOneNum" value="${option[status.index].optionOneNum}">
<input type="text" id="optionTwoNum${stats.index}" name="optionTwoNum" value="${option[status.index].optionTwoNum}">
<input type="text" id="optionThreeNum${stats.index}" name="optionThreeNum" value="${option[status.index].optionThreeNum}">
<input type="text" id="productPrice${stats.index}" name="productPrice" value="${product.productPrice}">
<input type="text" id="cnt${stats.index}" name="cnt" value="${cnt}">
<input type="text" id="optionNum${stats.index}" name="optionNum" value="${option[status.index].optionNum}">
</c:forEach>
</table>

<h3>배송주소록,배송정보</h3>
<h4>배송지 정보 입력</h4>

배송지 선택 : <label><input type="radio" name="deliveryCheck" id="default" value="${member.name}" checked>${member.name}</label>&nbsp;&nbsp;&nbsp;
<label><input type="radio" id="new" name="deliveryCheck" value="">새로운 배송지</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="myDeliveryAddress" value="나의 배송 주소록">
<p id="deliveryInfo">
이름 : <input type="text" id="toName" name="toName" value="${member.name}" readonly><br>
주소 : <input type="text" id="toPost" name="toPost" value="${member.post}" readonly>&nbsp;<input type="text" id="toAddress" name="toAddress" value="${member.address} ${member.addressEtc}" style="width : 300px" readonly><br>
연락처 : <input type="text" id="toPhone" name="toPhone" value="${member.phone}" readonly><br>
배송 메시지 : <input type="text" id="deliveryMessage" name="deliveryMessage" maxlength="50"><br> 

<h3>결제정보</h3>

결제방법 선택 : <label><input type="radio" name="payingSelect" class="payingSelect" id="payBank" checked>무통장 입금</label>&nbsp;&nbsp;&nbsp;
<label><input type="radio" name="payingSelect" class="payingSelect" id="payCard">신용카드 결제</label><br>

<p id="payBankInfo">
입금 은행 <select name="bankCode"> <option value="none">은행을 선택해 주세요</option> <c:forEach var="bankCode" items="${bankInfo}" varStatus="status"><option value="${bankCode.bankCode}">${bankCode.bankName}</option></c:forEach></select>
</p> 
<h3>결제하기 버튼</h3>
<input type="hidden" name="orderJson" value='${orderJson}'/>
<input type="hidden" name="orderListJsonArray" value='${orderListJsonArray}'/>
<input type="submit" value="결제하기">
</form>
<script>

/* $(function(){
	var orderVOList = new Array();
	
	for(var i = 0 ; i <)
	
}) */


var defaultInfo;
var newInfo;
$('input[name=deliveryCheck]').click(function(){
	if($('#default').is(':checked') == true) {
		defaultInfo = $('#deliveryInfo').html();
		$('#deliveryInfo').html('이름 : <input type="text" id="toName" name="toName" value="${member.name}" readonly><br>	주소 : <input type="text" id="toPost" name="toPost" value="${member.post}" readonly>&nbsp;<input type="text" id="toAddress" name="toAddress" value="${member.address}" style="width : 300px" readonly><br> 연락처 : <input type="text" id="toPhone" name="toPhone" value="${member.phone}" readonly><br> 배송 메시지 : <input type="text" id="deliveryMessage" name="deliveryMessage" maxlength="50"><br>');
	}
	if($('#new').is(':checked') == true) {
		newInfo = $('#deliveryInfo').html();
		$('#deliveryInfo').html('이름 : <input type="text" id="toName" name="toName" value="" ><br> 주소 : <input type="text" id="toPost" name="toPost" value="" readonly>&nbsp; <input type="text" id="toAddress" name="toAddress" value="" style="width : 300px" readonly>&nbsp; 상세주소:<input type="text" name="toAddressEtc" id="toAdressEtc"> &nbsp;<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /><br> 연락처 : <input type="text" id="toPhone" name="toPhone" value="" ><br> 배송 메시지 : <input type="text" id="deliveryMessage" name="deliveryMessage" maxlength="50"><br>');
	}
});

$('#myDeliveryAddress').click(function(){
	var popTitle = "popupOpener"
	window.open("",popTitle, "width=800, height=500");
	
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
})


</script>
<!-- 이름 : <input type="text" id="name" name="name" value="" ><br>
주소 : <input type="text" id="post" name="post" value="" readonly>&nbsp;
<input type="text" id="address" name="address" value="" style="width : 300px" readonly>&nbsp;
상세주소:<input type="text" name="addressEtc" id="adressEtc"> &nbsp;<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /><br>
연락처 : <input type="text" id="phone" name="phone" value="" ><br>
배송 메시지 : <input type="text" id="deliveryMessage" name="deliveryMessage" maxlength="50"><br> -->
</body>
</html>