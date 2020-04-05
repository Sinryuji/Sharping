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
    #mm {
    	text-align: center;
 		margin: 0 950px;
	}
    	
    	
    	
    a{
   		text-decoration:none;
   		color:black;
   	}

	table{
        text-align: center;
        line-height: 1.5;
        vertical-align: middle;
        border-spacing:0 10px;
        width: 1000px;
        margin:auto;
    }

    .bot th{
        border-top: 3px solid black;
        border-bottom: 3px solid black;
    }

    td{
        padding-bottom: 30px;
    }

    .cancle {
		    width: 130px;
		    height: 30px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 14px;
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

		.cancle:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}


</style>
</head>
<body>
	<h1>비회원 쇼핑내역</h1>
	<div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div>
	<table>
			<c:if test="${!empty orderListBankJson }">
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 15%;" />
			        </colgroup>
			        <thead>
			            <tr>
			                <th colspan="4"><h1>무통장 입금주문</h1></th>
			            </tr>
						<tr class="bot">
							<th>입금은행</th>
							<th>계좌번호</th>
							<th>입금기간</th>
							<th>입금하실 금액</th>
						</tr>
					</thead>
				<c:forEach var="orderListBankJson" items="${orderListBankJson}"
					varStatus="status">
					<tr>
						<td>${orderListBankJson.bankName }</td>
						<td>${orderListBankJson.vaNum }</td>
						<td></td>
						<td>${orderListBankJson.payPrice }</td>
					</tr>
					<tr class="bot">
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
					<colgroup>
                    <col style="width: 20%;" />
                    <col style="width: auto;" />
                    <col style="width: 20%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th colspan="4"><h1>카드주문</h1></th>
                    </tr>
                    <tr class="bot">
                        <th>주문일</th>
						<th>상품명/선택옵션/주문번호</th>
						<th colspan="2">주문상태</th>
                    </tr>
                </thead>
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