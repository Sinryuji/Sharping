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

<style>
	
		table{
		    border-collapse: collapse;
		    line-height: 1.5;
			width:800px;
			margin:auto;
		}
		
		.table1{
			margin-top: 100px;
		}
		
		.img{
			width:50px; 
			height:50px;
			float:left;
		}
		
		.proInfo{
			float:left;
			margin-left:10px;
		}
		
		.mainhead{
			text-align:left;
		}
		
		.head1{
			border:1px solid black;
			border-left:0;
			border-right:0;
			background: #EAEAEA;
		}
		
		.table1 tbody tr{
			border-bottom:3px solid gray;
		}
		
		.table1 tbody td{
			text-align:center;
		}
		
		.t1_td{
			border-right: 0.2px solid gray;
			border-left: 0.2px solid gray;
		}
		
		.table2{
			border:0.2px solid gray;
		}
		
		.table2 thead tr{
			text-align: left;
			border:0.2px solid gray;
			background: #EAEAEA;
		}
		
		.table2 thead tr span{
			font-size: 13px;
			color: #F15F5F;
		}
		
		.table2 td span{
			font-size: 13px;
			color: #F15F5F;
		}
		
		.table2 thead th{
			padding: 10px;
		}
		
		.table2 tbody tr, .table2 tbody td{
			padding: 10px;
			/* border: 0.2px solid gray; */
		}
		
		.td1{
			background: #EAEAEA;
			/* border-right:0; */
		}
		
		.td2{
			/* border-left:0; */
		}
		
		#dc{
			border-bottom: 0.2px solid gray;
		}
		
		#dm{
			border-top: 0.2px solid gray;
		}
		
		.table3{
			border:0.2px solid gray;
		}
		
		.table3 thead tr{
			text-align: left;
			border:0.2px solid gray;
			background: #EAEAEA;
		}
		
		.table3 tr{
			border:0.2px solid gray;
		}
		
		.right{
			border-right: 0.2px solid gray
		}
		
		#rowspan{
			text-align:center;
		}
		
		.s1{
			color:red;
			font-size:30px
		}
		
		.s2{
			font-size:26px;
		}
		
		.div1, .div2{
			float:left;
			display:inline-block;
		}
		
		.boss{
			clear:both;
			margin-left:510px;
			display:block;
			padding:40px;
			width:50%;
		}
		
		#no1, #no2{
			width:400px;	
		}
		
		#no1{
			border-right:0;
		}
		
		#no1 thead tr{
			border-right:0;
		}
		
		#no2 thead tr{
			border-left:0;
		}
		
 		#no1 td{
			padding:19px;
		}
		
		.tb3{
			padding:30px;
			display:inline-block;
			margin-left: 520px;;
		}
		
		.t {
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
		    margin:5px;
		}

		.t:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		.a {
		    width: 70px;
		    height: 20px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 11px;
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

		.a:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		.b {
		    width: 120px;
		    height: 20px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 11px;
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

		.b:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
	
</style>

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
	<form name="orderForm" id="orderForm" action="orderResult" method="post">
	<table class="table1">
		<colgroup>
			<col style="width:auto;" />
			<col style="width:15%;" />
			<col style="width:15%;" />
		</colgroup>
		<thead>
			<tr>
				<th class="mainhead">주문상품</th>
			</tr>
			<tr class="head1">
				<th>상품정보</th>
				<th>판매자</th>
				<th>배송비</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<div class="img">
					<img src="opload/${product.productThumb}" width="50" height="50">
				</div>
				<div class="proInfo">
					<b>${product.productName}</b>
				</div>
				</td>
				<td class="t1_td">${seller.storeName}</td>
				<td>${product.deliveryPrice}</td>
			</tr>
		</tbody>
	</table>
	<br><br>
	<!-- 회원 -->
	<c:if test="${authInfo != null }">
	<table class="table2">
		<colgroup>
			<col style="width:25%;" />
			<col style="width:auto%;" />
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
					<label>
						<input type="radio" name="deliveryCheck" id="default" value="${member.name}" checked>${member.name}
					</label>
					<label>
						<input type="radio" id="new" name="deliveryCheck" value="">새로운 배송지
					</label>
					<input type="button" class="b" id="myDeliveryAddress" value="나의 배송 주소록">
				</td>
			</tr>
			<tr>
				<td class="td1">
					<span>*</span>이름<br><br>
					<span>*</span>주소<br><br>
					<span>*</span>연락처
				</td>
				<td class="td2">
					<p id="deliveryInfo">
					<input type="text" id="toName" name="toName" value="${member.name}" readonly><br><br>
					<input type="text" id="toPost" name="toPost" value="${member.post}" readonly>
					<input type="text" id="toAddress" name="toAddress" value="${member.address} ${member.addressEtc}" style="width : 300px" readonly><br><br>
					<input type="text" id="toPhone" name="toPhone" value="${member.phone}" readonly>
						<%-- <input type="text" id="toName" name="toName" value="${member.name}" readonly><br><br>
						<input type="text" id="toPost" name="toPost" value="${member.post}" readonly>
						<input type="text" id="toAddress" name="toAddress" value="${member.address} ${member.addressEtc}" style="width: 300px" readonly><br>
						<input type="text" id="toPhone" name="toPhone" value="${member.phone}" readonly> --%>
					<p>
				</td>
			</tr>
			<%-- <tr>
				<td class="td1"><span>*</span>주소</td>
				<td class="td2">
					<input type="text" id="toPost" name="toPost" value="${member.post}" readonly>
					<input type="text" id="toAddress" name="toAddress" value="${member.address} ${member.addressEtc}" style="width: 300px" readonly>
				</td>
			</tr>
			<tr>
				<td class="td1"><span>*</span>연락처</td>
				<td class="td2">
					<input type="text" id="toPhone" name="toPhone" value="${member.phone}" readonly>
				</td>
			</tr> --%>
			<tr id="dm">
				<td class="td1">배송 메시지</td>
				<td class="td2">
					<input type="text" id="deliveryMessage" name="deliveryMessage" maxlength="50">
				</td>
			</tr>
		</tbody>
	</table>
	</c:if>
	
	<!-- 비회원 -->
	<c:if test="${member.id == '비회원'}">
	<div class="boss">
		<div class="div1">
			<table class="table2" id="no1">
				<colgroup>
					<col style="width:35%;" />
					<col style="width:auto%;" />
				</colgroup>
				<thead>
					<tr>
						<th>주문회원정보<br><span>(*필수입력)</span></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="td1">
							<span>*</span>이름
						</td>
						<td class="td2">
							<input type="text" id="guestName" name="guestName" value="${guest.guestName }">
						</td>
					</tr>
					<tr>
						<td class="td1">
							<span>*</span>연락처
						</td>
						<td class="td2">
							<input type="text" id="guestPhone" name="guestPhone" value="${guest.guestPhone }">
						</td>
					</tr>
					<tr>
						<td class="td1">
							<span>*</span>비밀번호
						</td>
						<td class="td2">
							<input type="text" id="guestPassword" name="guestPassword" value="${guest.guestPassword }">
						</td>
					</tr>
					<tr>
						<td class="td1">
						</td>
						<td class="td2">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="div2">
			<table class="table2" id="no2">
				<colgroup>
					<col style="width:35%;" />
					<col style="width:auto%;" />
				</colgroup>
				<thead>
					<tr>
						<th>배송지정보<br>입력<span>(*필수입력)</span></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="td1">
							<span>*</span>이름
						</td>
						<td class="td2">
							<input type="text" id="toName" name="toName" value="">
						</td>
					</tr>
					<tr>
						<td class="td1">
							<span>*</span>주소
						</td>
						<td class="td2">
							<input type="text" id="toPost" name="toPost" value="" readonly>&nbsp;<input type="button" class="a" onClick="openDaumZipAddress();" value="주소 찾기" />
							<input type="text" id="toAddress" name="toAddress" value="" style="width: 250px" readonly><input type="text" name="toAddressEtc" id="toAdressEtc" style="width: 250px" placeholder="상세주소를 입력해주세요."> 
						</td>
					</tr>
					<tr>
						<td class="td1">
							<span>*</span>비밀번호
						</td>
						<td class="td2">
							<input type="text" id="guestPassword" name="guestPassword" value="${guest.guestPassword }">
						</td>
					</tr>
					<tr>
						<td class="td1">
							배송 메시지
						</td>
						<td class="td2">
							<input type="text" id="deliveryMessage" name="deliveryMessage" maxlength="50">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</c:if>
	
	<br><br>
	<div class="tb3">
		<table class="table3">
			<colgroup>
				<col style="width:70%;" />
				<col style="width:auto%;" />
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
					<td rowspan="2" id="rowspan">
						<b><span class="s1">${payPrice}</span></b><span class="s2">원</span><br><br>
						<input type="button" class="t" id="payment" value="결제하기">
					</td>
				</tr>
				<tr>
					<td class="right">
						<label>
							<input type="radio" name="payingSelect" class="payingSelect" id="payBank" checked>무통장 입금
						</label>&nbsp;&nbsp;&nbsp;
						<label>
							<input type="radio" name="payingSelect" class="payingSelect" id="payCard">신용카드 결제
						</label><br> 
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
		<input type="hidden" id="payPrice" name="payPrice" value="${payPrice}">
		<input type="hidden" id="productNum" name="productNum" value="${product.productNum}"> 
		<input type="hidden" id="memberEmail" name="memberEmail" value="${member.email}">
		<input type="hidden" id="memberName" name="memberName" value="${member.name}"> 
		<input type="hidden" id="memberPhone" name="memberPhone" value="${member.phone}"> 
		<input type="hidden" id="memberAddress" name="memberAddress" value="${member.address} ${member.addressEtc}"> 
		<input type="hidden" id="memberPost" name="memberPost" value="${member.post}">
		<input type="hidden" id="id" name="id" value="${member.id}"> 
		<input type="hidden" id="productName" name="productName" value="${product.productName}"> 
		<input type="hidden" id="productThumb" name="productThumb" value="${product.productThumb}">
		<input type="hidden" id="optionOneNum" name="optionOneNum" value="${option.optionOneNum}"> 
		<input type="hidden" id="optionTwoNum" name="optionTwoNum" value="${option.optionTwoNum}">
		<input type="hidden" id="optionThreeNum" name="optionThreeNum" value="${option.optionThreeNum}"> 
		<input type="hidden" id="optionNum" name="optionNum" value="${option.optionNum}">
		<input type="hidden" id="productPrice" name="productPrice" value="${payPrice}"> 
		<input type="hidden" id="cnt" name="cnt" value="${cnt}"> 
	</form>
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
});

$('input[name=deliveryCheck]').click(function(){
	if($('#default').is(':checked') == true) {
		defaultInfo = $('#deliveryInfo').html();
		$('#deliveryInfo').html('<input type="text" id="toName" name="toName" value="${member.name}" readonly><br><br>	<input type="text" id="toPost" name="toPost" value="${member.post}" readonly>&nbsp;<input type="text" id="toAddress" name="toAddress" value="${member.address}${member.addressEtc}" style="width : 300px" readonly><br><br><input type="text" id="toPhone" name="toPhone" value="${member.phone}" readonly><br>');
	}
	if($('#new').is(':checked') == true) {
		newInfo = $('#deliveryInfo').html();
		$('#deliveryInfo').html('<input type="text" id="toName" name="toName" value="" ><br><br> <input type="text" id="toPost" name="toPost" value="" readonly>&nbsp;<input type="button" class="a" onClick="openDaumZipAddress();" value = "주소 찾기" /><br> <input type="text" id="toAddress" name="toAddress" value="" style="width : 300px" readonly>&nbsp; <input type="text" name="toAddressEtc" id="toAdressEtc" placeholder="상세주소를 입력해주세요."><br><br> <input type="text" id="toPhone" name="toPhone" value="" ><br>');
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