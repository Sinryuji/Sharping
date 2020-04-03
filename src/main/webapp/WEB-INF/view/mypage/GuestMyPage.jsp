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
</head>
<body>
	<h1>비회원 쇼핑내역</h1>
	<table>
			<c:if test="${!empty orderListBankJson }">
					<tr>
						<th><h1>무통장 입금주문</h1></th>
					</tr>
					<tr>
						<th>입금은행</th>
						<th>계좌번호</th>
						<th>입금기간</th>
						<th>입금하실 금액</th>
					</tr>
				<c:forEach var="orderListBankJson" items="${orderListBankJson}"
					varStatus="status">
					<tr>
						<td>${orderListBankJson.bankName }</td>
						<td>${orderListBankJson.vaNum }</td>
						<td></td>
						<td>${orderListBankJson.payPrice }</td>
					</tr>
					<tr>
						<th>주문일</th>
						<th>상품명/선택옵션/주문번호</th>
						<th>주문상태</th>
					</tr>
					<tr>
						<td>${orderListBankJson.orderDate}</td>
						<td>${orderListBankJson.productName}/${orderListBankJson.optionOneName}.${orderListBankJson.optionTwoName}.${orderListBankJson.optionThreeName}/${orderListBankJson.orderNum}</td>
						<td>${orderListBankJson.state}</td>
						<c:if test="${orderListBankJson.state == '입금 대기'}">
						<td>
						<form action="orderCancle" name="cancleInfo" method="post">
						<input type="hidden" name="orderNum" value="${orderListBankJson.orderNum}">
						<input type="submit" name="cancle" class="cancle" id="cancleProduct${status.index}" value="주문 취소">
						</form>
						</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${!empty orderListCardJson }">
					<tr>
						<th><h1>카드주문</h1>
					</th>
					<tr>
						<th>주문일</th>
						<th>상품명/선택옵션/주문번호</th>
						<th>주문상태</th>
					</tr>
			<c:forEach var="orderListCardJson" items="${orderListCardJson }" varStatus="status">
					<tr>
						<td>${orderListCardJson.orderDate}</td>
						<td>${orderListCardJson.productName}/${orderListCardJson.optionOneName}.${orderListCardJson.optionTwoName}.${orderListCardJson.optionThreeName}/${orderListCardJson.orderNum}</td>
						<td>${orderListCardJson.state}</td>
						<c:if test="${orderListCardJson.state == '입금 대기'}">
						<td>
						<form action="orderCancle" name="cancleInfo" method="post">
						<input type="hidden" name="orderNum" value="${orderListCardJson.orderNum}">
						<input type="submit" name="cancle" class="cancle" id="cancleProduct${status.index}" value="주문 취소">
						</form>
						</td>
						</c:if>
					</tr>
			</c:forEach>
			</c:if>
	 
	</table>

</body>
</html>