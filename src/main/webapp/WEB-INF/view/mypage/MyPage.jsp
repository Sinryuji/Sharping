<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
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
			<c:forEach var="order" items="${ordersJsonArray}" varStatus="status">
				
					<c:forEach var="orderList" items="${order.orderLists}" varStatus="status2">
					<tr>
					<c:if test="${status2.index == 0 }">
					<td rowspan="${order.orderListsSize}">
						${order.orderData}<br>
						결제 금액 : ${order.payPrice}<br>
						주문번호 : ${order.orderNum}
					</td>
					</c:if>
						<td>
							상품 썸네일 : ${orderList.productThumb}<br>
							상품명 : ${orderList.productName}<br>
							주문 옵션 : ${orderList.optionName}<br>
							주문 번호 : ${orderList.olNum}<br>
						</td>
						<td>
							${orderList.storeName}
						</td>
						<td>
							${order.state}
						</td>
						</tr>
					</c:forEach>

					<%-- <td><input type="checkbox" class="select" id="chk${status.index}" data-productNum="${list.productNum}"></td>
							<td><span style="float:left"><img src="upload/${list.productThumb}" style="width:50px;">&nbsp;&nbsp;</span>
								<span style="float:left"><c:out value="${list.productName}"/><br>
								<c:out value="상품번호 : ${list.productNum}"/>&nbsp;&nbsp;</span></td>
							<td><c:out value="${list.productPrice}"/></td>
							<td><c:out value="${list.deliveryPrice}"/></td>
							<td><c:out value="?"/></td>
							<td><c:out value="매출총액 : ?"/></td>
							<td><label class="switch">
								  <input type="hidden" id="dis${status.index}" value="${status.index}" >
								  <input type="checkbox" class="display" id="chk${status.index}" ${list.productDisplay == "TRUE" ? "checked" : ""}>
								  <span class="slider round"></span>
								</label>
							</td>
							<td><input type="hidden" id="productNum${status.index}" value="${list.productNum}">
							<button class="updateProduct" value="${status.index}">수정</button>&nbsp;<button class="deleteProduct" value="${status.index}">삭제</button></td> --%>
				
			</c:forEach>
		</tbody>
	</table>
</body>
</html>