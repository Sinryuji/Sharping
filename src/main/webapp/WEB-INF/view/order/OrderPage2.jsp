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
<%-- <script>

 var idLogin = <%=session.getAttribute("authInfo")%>;

</script> --%>
</head>
<body>
	<c:if test="${cnt > option.stock}">
		<script>
alert("상품의 재고 보다 선택한 수량이 많습니다. 재고 : " + ${option.stock});
history.go(-1);
</script>
	</c:if>
	<form name="deliveryAddress" id="deliveryAddress" method="post">
		<input type="hidden" name="id" id="id" value="${authInfo.id}">
	</form>

	<form name="orderForm" id="orderForm" action="orderResult"
		method="post">

		<h1>OrderResult</h1>
		<h1>DeliveryAddress</h1>
		상품 이미지 : ${product.productImage}<br> 상품명 : ${product.productName}<br>
		개수 : ${cnt}<br> 가격 : ${payPrice}<br> 판매자 :
		${seller.storeName}<br> 배송비 : ${product.deliveryPrice}<br>
		최종 결제 금액 : ${payPrice}<br>
		<c:if test="${member.id == '비회원'}">
			<h3>비회원 정보입력</h3>
이름 : <input type="text" id="guestName" name="guestName"
				value="${guest.guestName }">
			<br>
연락처 : <input type="text" id="guestPhone" name="guestPhone"
				value="${guest.guestPhone }">
			<br>
비밀번호 : <input type="text" id="guestPassword" name="guestPassword"
				value="${guest.guestPassword }">
			<br>
			<h3>배송주소록,배송정보</h3>
			<h4>배송지 정보 입력</h4>
			<label><input type="radio" id="new" name="deliveryCheck"
				value=""> 배송지 입력</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<p id="deliveryInfo">
				이름 : <input type="text" id="toName" name="toName" value=""><br>
				주소 : <input type="text" id="toPost" name="toPost" value="" readonly>&nbsp;<input
					type="text" id="toAddress" name="toAddress" value=""
					style="width: 300px" readonly> &nbsp; <input type="button"
					onClick="openDaumZipAddress();" value="주소 찾기" /><br> 연락처 : <input
					type="text" id="toPhone" name="toPhone" value=""><br>
				배송 메시지 : <input type="text" id="deliveryMessage"
					name="deliveryMessage" maxlength="50"><br>
			<p>
		</c:if>
		<c:if test="${authInfo != null }">
			<h3>배송주소록,배송정보</h3>
			<h4>배송지 정보 입력</h4>
			<%-- 배송지 선택 : <label><input type="checkbox" class="deliveryCheck" id="default" value="${member.name}" checked>${member.name}</label>&nbsp;&nbsp;&nbsp;<label><input type="checkbox" id="new" class="deliveryCheck" value="">새로운 배송지</label><br> --%>
배송지 선택 : <label><input type="radio" name="deliveryCheck"
				id="default" value="${member.name}" checked>${member.name}</label>&nbsp;&nbsp;&nbsp;
<label><input type="radio" id="new" name="deliveryCheck"
				value="">새로운 배송지</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="button" id="myDeliveryAddress" value="나의 배송 주소록">
			<p id="deliveryInfo">
				이름 : <input type="text" id="toName" name="toName"
					value="${member.name}" readonly><br> 주소 : <input
					type="text" id="toPost" name="toPost" value="${member.post}"
					readonly>&nbsp;<input type="text" id="toAddress"
					name="toAddress" value="${member.address} ${member.addressEtc}"
					style="width: 300px" readonly><br> 연락처 : <input
					type="text" id="toPhone" name="toPhone" value="${member.phone}"
					readonly><br> 배송 메시지 : <input type="text"
					id="deliveryMessage" name="deliveryMessage" maxlength="50"><br>
			<p>
		</c:if>
		<h3>결제정보</h3>
		결제방법 선택 : <label><input type="radio" name="payingSelect"
			class="payingSelect" id="payBank" checked>무통장 입금</label>&nbsp;&nbsp;&nbsp;
		<label><input type="radio" name="payingSelect"
			class="payingSelect" id="payCard">신용카드 결제</label><br> <input
			type="text" id="payPrice" name="payPrice" value="${payPrice}">
		<input type="text" id="productNum" name="productNum"
			value="${product.productNum}"> <input type="text"
			id="memberEmail" name="memberEmail" value="${member.email}">
		<input type="text" id="memberName" name="memberName"
			value="${member.name}"> <input type="text" id="memberPhone"
			name="memberPhone" value="${member.phone}"> <input
			type="text" id="memberAddress" name="memberAddress"
			value="${member.address} ${member.addressEtc}"> <input
			type="text" id="memberPost" name="memberPost" value="${member.post}">
		<input type="text" id="id" name="id" value="${member.id}"> <input
			type="text" id="productName" name="productName"
			value="${product.productName}"> <input type="text"
			id="productThumb" name="productThumb" value="${product.productThumb}">
		<input type="text" id="optionOneNum" name="optionOneNum"
			value="${option.optionOneNum}"> <input type="text"
			id="optionTwoNum" name="optionTwoNum" value="${option.optionTwoNum}">
		<input type="text" id="optionThreeNum" name="optionThreeNum"
			value="${option.optionThreeNum}"> <input type="text"
			id="productPrice" name="productPrice" value="${payPrice}"> <input
			type="text" id="cnt" name="cnt" value="${cnt}"> <input
			type="text" id="optionNum" name="optionNum"
			value="${option.optionNum}">
		<%-- <input type="text" id="optionNum" name="optionNum" value="${basketSelect.optionNum}">
<input type="text" name="${status.index}"class="checkboxs" id="checkedProduct${status.index}"value="${basket.basketNum}" checked /> --%>
		<p id="payBankInfo">
			입금 은행 <select name="bankCode">
				<option value="none">은행을 선택해 주세요</option>
				<c:forEach var="bankCode" items="${bankInfo}" varStatus="status">
					<option value="${bankCode.bankCode}">${bankCode.bankName}</option>
				</c:forEach>
			</select>
		</p>
		<h3>결제하기 버튼</h3>
		<input type="submit" id="payment" value="결제하기">
	</form>
	<script>
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
		$('#orderForm').attr("action", "orderResult");
	}
	if($('#payCard').is(":checked")){
		$("#orderForm").attr("action", "payingCard");
	}
});


</script>
	<!-- 이름 : <input type="text" id="name" name="name" value="" ><br>
주소 : <input type="text" id="post" name="post" value="" readonly>&nbsp;
<input type="text" id="address" name="address" value="" style="width : 300px" readonly>&nbsp;
상세주소:<input type="text" name="addressEtc" id="adressEtc"> &nbsp;<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /><br>
연락처 : <input type="text" id="phone" name="phone" value="" ><br>
배송 메시지 : <input type="text" id="deliveryMessage" name="deliveryMessage" maxlength="50"><br> -->
</body>
</html>