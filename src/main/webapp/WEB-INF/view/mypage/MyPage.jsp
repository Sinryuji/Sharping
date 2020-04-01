<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous">
</script>
<style>
td{
		border: 2px solid hotpink;
		}
</style>
</head>
<body>
	<h1>WishList</h1>
	<input type="button"
		onclick="location.href='${pageContext.request.contextPath}/infoChange'"
		value="회원정보수정">
	<br>
	<br>
	<c:if test="${authInfo.sellerCheck == 'false' }">
		<input type="button"
			onclick="location.href='${pageContext.request.contextPath}/changeSeller'"
			value="판매자 전환하기">
	</c:if>
	<input type="button"
		onclick="location.href='${pageContext.request.contextPath}/deliveryAddress'"
		value="배송주소록">
	<br>
	<br>
	<h1>CS</h1>
	<h1>MyReviewList</h1>
	<h1>SellerDetail</h1>
	<h1>Store</h1>
	<h1>ProductQa</h1>
	<h1>ChangeProduct</h1>
	<h1>ReturnProduct</h1>
	<form action="myPage">
		<input type="date" name="firstDate" id="firstDate">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
		<input type="date" name="secondDate" id="secondDate">
		<input type="submit" value="검색">
	</form>
	<form action="myPage">
		<input type="text" name="keywordO" placeholder="키워드를 입력하세요." value="${keywordO}" />
		<input type="submit" value="검색">
	</form>
	<form action="myPage" name="sort" id="sort">
		<select name="state" id="state">
			<option value="전체 주문 상태">전체 주문 상태</option>
			<option value="입금 대기">입금 대기</option>
			<option value="결제 완료">결제 완료</option>
			<option value="배송 준비중">배송 준비중</option>
			<option value="배송 중">배송 중</option>
			<option value="배송 완료">배송 완료</option>
			<option value="구매 확정">구매 확정</option>
			<option value="주문 취소">주문 취소</option>
			<option value="반품 완료">반품 완료</option>
			<option value="교환 완료">교환 완료</option>
		</select>
	</form>
	<table>
		<colgroup>
			<col style="width: auto;" />
			<col style="width: 10%;" />
			<col style="width: 10%;" />
			<col style="width: 10%;" />
		</colgroup>
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
			<td>해당하는 상품이 없습니다.</td>
		</tr>
		</c:if>
		<c:if test="${!empty ordersJsonArray}">
			<c:forEach var="order" items="${ordersJsonArray}" varStatus="status">
				
					<c:forEach var="orderList" items="${order.orderLists}" varStatus="status2">
					<tr>
					<c:if test="${order.payNum != order.prePayNum || status.index == 0}">
					<td rowspan="${order.payNumCount}">
						${order.orderData}<br>
						결제 금액 : ${order.payPrice}<br>
						결제번호 : ${order.payNum}
					</td>
					</c:if>
						<td>
							상품 썸네일 : ${orderList.productThumb}<br>
							상품명 : ${orderList.productName}<br>
							주문 옵션 : ${orderList.optionName}<br>
							주문 번호 : ${order.orderNum}<br>
						</td>
						<td>
							${orderList.storeName}
						</td>
						<td>
							${order.state}<br>
							<c:if test="${order.state == '입금 대기'}">
							<form action="orderCancle" name="cancleInfo" id="cancleInfo" method="post">
							<input type="hidden" name="orderNum" value="${order.orderNum}">
							<input type="submit" value="주문 취소">
							</form>				
							</c:if>
							<c:if test="${order.state == '배송 중'}">
							<button type="button" class="deliveryTracking" value="${order.orderNum}">배송 조회</button>
							</c:if>
						</td>
						</tr>
					</c:forEach>

			</c:forEach>
		</c:if>
		</tbody>
	</table>
<script>

$('#state').change(function(){
	var frmData = document.sort;
	frmData.action = "<%=request.getContextPath()%>/myPage";
	frmData.submit();
});

$(document).ready(function(){
	var state = "<%=request.getParameter("state")%>";
	if(state == "null") {
		$('#state').val("전체 주문 상태").prop("selected", true);
	}else {
	$('#state').val(state).prop("selected", true);
	}
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
</script>
</body>
</html>