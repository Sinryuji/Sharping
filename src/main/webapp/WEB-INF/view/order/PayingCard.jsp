<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String a = request.getParameter("money");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp07183727'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '${payingCard.productName}',
    amount : '${payingCard.payPrice}',
    buyer_email : '${payingCard.memberEmail}',
    buyer_name : '${payingCard.memberName}',
    buyer_tel : '${payingCard.memberPhone}',
    buyer_addr : '${payingCard.memberAddress}',
    buyer_postcode : '${payingCard.memberPost}',
    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        alert(msg);
      /*   document.body.impId.value = rsp.imp_uid;
        document.body.buyerInfo.submit(); */
        $('#impId').val(rsp.imp_uid);
        $('#buyerInfo').submit();
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        alert(msg);
    }
   
    
});
</script>
<form id="buyerInfo" name="buyerInfo" action="orderCardResult">
<input type="hidden" id="id" name="id" value="${order.id}">
<input type="hidden" id="toName" name="toName" value="${order.toName}">
<input type="hidden" id="toPhone" name="toPhone" value="${order.toPhone}">
<input type="hidden" id="toPost" name="toPost" value="${order.toPost}">
<input type="hidden" id="toAddress" name="toAddress" value="${order.toAddress}">
<input type="hidden" id="deliveryMessage" name="deliveryMessage" value="${order.deliveryMessage}">
<input type="hidden" id="impId" name="impId" value="">
<input type="hidden" id="productName" name="productName" value="${orderList.productName}">
<input type="hidden" id="productThumb" name="productThumb" value="${orderList.productThumb}">
<input type="hidden" id="optionOneNum" name="optionOneNum" value="${orderList.optionOneNum}">
<input type="hidden" id="optionTwoNum" name="optionTwoNum" value="${orderList.optionTwoNum}">
<input type="hidden" id="optionThreeNum" name="optionThreeNum" value="${orderList.optionThreeNum}">
<input type="hidden" id="payPrice" name="payPrice" value="${orderList.payPrice}">
<input type="hidden" id="cnt" name="cnt" value="${orderList.cnt}">
alert(${orderList.optionNum});
<input type="text" id="optionNum" name="optionNum" value="${orderList.optionNum}">
</form>
</body>
</html>