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
<c:if test="${cnt > option.stock}">
<script>
alert("상품의 재고 보다 선택한 수량이 많습니다. 재고 : " + ${option.stock});
history.go(-1);
</script>
</c:if>
<form name="frmData" id="frmData" method="post">
	<input type="hidden" name="id" id="id" value="${authInfo.id}">
</form>
<h1>OrderResult</h1>
<h1>DeliveryAddress</h1>
상품 이미지 : ${product.productImage}<br>
상품명 : ${product.productName}<br>
개수 : ${cnt}<br>
가격 : ${product.productPrice}<br>
판매자 : ${seller.storeName}<br>
배송비 : ${product.deliveryPrice}<br>
최종 결제 금액 : ${payPrice}<br>
<h3>배송주소록,배송정보</h3>
<h4>배송지 정보 입력</h4>
<%-- 배송지 선택 : <label><input type="checkbox" class="deliveryCheck" id="default" value="${member.name}" checked>${member.name}</label>&nbsp;&nbsp;&nbsp;<label><input type="checkbox" id="new" class="deliveryCheck" value="">새로운 배송지</label><br> --%>
배송지 선택 : <label><input type="radio" name="deliveryCheck" id="default" value="${member.name}" checked>${member.name}</label>&nbsp;&nbsp;&nbsp;
<label><input type="radio" id="new" name="deliveryCheck" value="">새로운 배송지</label><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="myDeliveryAddress" value="나의 배송 주소록">
<p id="deliveryInfo">
이름 : <input type="text" id="name" name="name" value="${member.name}" readonly><br>
주소 : <input type="text" id="post" name="post" value="${member.post}" readonly>&nbsp;<input type="text" id="address" name="address" value="${member.address}" style="width : 300px" readonly><br>
연락처 : <input type="text" id="phone" name="phone" value="${member.phone}" readonly><br>
배송 메시지 : <input type="text" id="deliveryMessage" name="deliveryMessage" maxlength="50"><br>
<p>
<h3>결제정보</h3>
<h3>결제하기 버튼</h3>
<script>
var defaultInfo;
var newInfo;
$('input[name=deliveryCheck]').click(function(){
	if($('#default').is(':checked') == true) {
		defaultInfo = $('#deliveryInfo').html();
		$('#deliveryInfo').html('이름 : <input type="text" id="name" name="name" value="${member.name}" readonly><br>	주소 : <input type="text" id="post" name="post" value="${member.post}" readonly>&nbsp;<input type="text" id="address" name="address" value="${member.address}" style="width : 300px" readonly><br> 연락처 : <input type="text" id="phone" name="phone" value="${member.phone}" readonly><br> 배송 메시지 : <input type="text" id="deliveryMessage" name="deliveryMessage" maxlength="50"><br>');
	}
	if($('#new').is(':checked') == true) {
		newInfo = $('#deliveryInfo').html();
		$('#deliveryInfo').html('이름 : <input type="text" id="name" name="name" value="" ><br> 주소 : <input type="text" id="post" name="post" value="" readonly>&nbsp; <input type="text" id="address" name="address" value="" style="width : 300px" readonly>&nbsp; 상세주소:<input type="text" name="addressEtc" id="adressEtc"> &nbsp;<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /><br> 연락처 : <input type="text" id="phone" name="phone" value="" ><br> 배송 메시지 : <input type="text" id="deliveryMessage" name="deliveryMessage" maxlength="50"><br>');
	}
});

$('#myDeliveryAddress').click(function(){
	var popTitle = "popupOpener"
	window.open("",popTitle, "width=800, height=500");
	
	var frmData = document.frmData;
	frmData.target = popTitle;
	frmData.action = "<%=request.getContextPath()%>/deliveryAddressInOrder";
	frmData.submit();
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