<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
td{
		border: 2px solid hotpink;
		}
</style>
</head>
<body>
<table>
		<colgroup>
			<col style="width: auto;" />
			<col style="width: 10%;" />
			<col style="width: 10%;" />
			<col style="width: 10%;" />
		</colgroup>
		<thead>
			<tr>
				<th>상품명</th>
				<th>결제 금액</th>
				<th>배송비</th>
				<th>판매자</th>
				<th>주문상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					${orderList.productName}<br>
					${orderList.productPrice} / ${orderList.cnt}<br>
					주문번호 : ${order.orderNum}
				</td>
				<td>
					<c:out value="${orderList.productPrice * orderList.cnt}"></c:out>
				</td>
				<td>
					${product.deliveryPrice}
				</td>
				<td>
					${seller.storeName}
				</td>
				<td>
					${order.state}
				</td>
			</tr>
		</tbody>
	</table>
	
	<form action="orderCancleComplete">
	<input type="hidden" name="orderNum" value="${orderList.orderNum}">
	<input type="submit" value="주문취소 요청">
	</form>
</body>
</html>