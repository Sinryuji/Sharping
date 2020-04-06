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
    	
    	.a {
		    width: 120px;
		    height: 75px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 16px;
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
		    width: 80px;
		    height: 30px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 12px;
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
		
		.c {
		    width: 100px;
		    height: 30px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 12px;
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

		.c:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		.deliveryTracking {
		    width: 100px;
		    height: 30px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 12px;
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

		.deliveryTracking:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
    	
    	a{
   	  		text-decoration:none;
   	  		color:black;
   	  	}

	table{
        text-align: center;
        line-height: 1.5;
        vertical-align: middle;
        border-top:1px solid black;
        border-spacing:0;
        width: 1000px;
        margin:auto;
    }

    thead th{
        border-bottom: 3px solid black;
    }
    
    tbody td{
       border-bottom:1px solid black;
    }
    
    .td2{
       border-right:1px solid gray;
       border-left:1px solid gray;
       /* border-bottom:1px solid black; */
    }
    
    .td3{
       border-right:1px solid gray;
       /* border-bottom:1px solid black; */
    }
    
    
    .filterBox{
       text-align:center;
       margin-right:285px;
    }


</style>
</head>
<body>
   <div id="mm">
      <h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
   </div>

   <input type="button" class="a"
      onclick="location.href='${pageContext.request.contextPath}/infoChange'"
      value="회원정보수정">
   <br>
   <br>
   <c:if test="${authInfo.sellerCheck == 'false' }">
      <input type="button" class="a"
         onclick="location.href='${pageContext.request.contextPath}/changeSeller'"
         value="판매자 전환">
      <br>
      <br>
   </c:if>
   <input type="button" class="a"
      onclick="location.href='${pageContext.request.contextPath}/deliveryAddress'"
      value="배송주소록">
   <br>
   <br>
   <div class="filterBox">
      <form action="myPage" id="submitInfo" onsubmit="return false">
         <input type="date" name="firstDate" id="firstDate">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
         <input type="hidden">
         <input type="date" name="secondDate" id="secondDate">
         <!-- <input type="submit" value="검색"> -->
      <!-- </form>
      <form action="myPage"> -->
         <input type="text" id="keywordO" name="keywordO" placeholder="키워드를 입력하세요." value="${keywordO}" />
         <!-- <input type="submit" value="검색"> -->
      <!-- </form>
      <form action="myPage" name="sort" id="sort"> -->
         <select name="state" id="state">
            <option value="전체 주문 상태" ${state == "전체 주문 상태" ? "selected" : "" }>전체 주문 상태</option>
            <option value="입금 대기" ${state == "입금 대기" ? "selected" : "" }>입금 대기</option>
            <option value="결제 완료" ${state == "결제 완료" ? "selected" : "" }>결제 완료</option>
            <option value="배송 준비중" ${state == "배송 준비중" ? "selected" : "" }>배송 준비중</option>
            <option value="배송 중" ${state == "배송 중" ? "selected" : "" }>배송 중</option>
            <option value="배송 완료" ${state == "배송 완료" ? "selected" : "" }>배송 완료</option>
            <option value="구매 확정" ${state == "구매 확정" ? "selected" : "" }>구매 확정</option>
            <option value="주문 취소" ${state == "주문 취소" ? "selected" : "" }>주문 취소</option>
            <option value="반품 완료" ${state == "반품 완료" ? "selected" : "" }>반품 완료</option>
            <option value="교환 완료" ${state == "교환 완료" ? "selected" : "" }>교환 완료</option>
         </select>
         <input type="button" class="b" id="submit" value="검색">
      </form>
      <br>
   </div>
   <div id="hiddenSubmitInfo">
      <form id="hiddenSubmit" action="myPage">
         <input type="hidden" id="hiddenState" name="state">
         <input type="hidden" id="hiddenKeywordO" name="keywordO">
      </form>
   </div>
   <table>
      <colgroup>
         <col style="width: auto;" />
         <col style="width: 27%;" />
         <col style="width: 10%;" />
         <col style="width: 13%;" />
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
         <td colspan="4">해당하는 상품이 없습니다.</td>
      </tr>
      </c:if>
      <c:if test="${!empty ordersJsonArray}">
         <c:forEach var="order" items="${ordersJsonArray}" varStatus="status">
            
               <c:forEach var="orderList" items="${order.orderLists}" varStatus="status2">
               <tr class="tr">
               <c:if test="${order.payNum != order.prePayNum || status.index == 0}">
               <td rowspan="${order.payNumCount}" class="td1">
                  ${order.orderData}<br>
                  결제 금액 : ${order.payPrice}<br>
                  결제번호 : ${order.payNum}
               </td>
               </c:if>
                  <td class="td2">
                     <img src="opload/${orderList.productThumb}" style="width:50px;"><br>
                     상품명 : ${orderList.productName}<br>
                     주문 옵션 : ${orderList.optionName}<br>
                     주문 번호 : ${order.orderNum}<br>
                  </td>
                  <td class="td3">
                     ${orderList.storeName}
                  </td>
                  <td class="td4">
                     ${order.state}<br><br>
                     <c:if test="${order.state == '입금 대기'}">
                     <form action="insertMoney">
                     <input type="hidden" name="payNum" value="${order.payNum}">
                     <input type="submit" class="b" value="입금">
                     </form>
                     <form action="orderCancle" name="cancleInfo" method="post">
                     <input type="hidden" name="orderNum" value="${order.orderNum}">
                     <input type="submit" class="c" value="주문 취소">
                     </form>
                     </c:if>
                     <c:if test="${order.state == '배송 중' || order.state == '배송 완료'}">
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

<%-- $('#state').change(function(){
   var frmData = document.sort;
   frmData.action = "<%=request.getContextPath()%>/myPage";
   frmData.submit();
}); --%>

<%-- $(document).ready(function(){
   var state = "<%=request.getParameter("state")%>";
   if(state == "null") {
      $('#state').val("전체 주문 상태").prop("selected", true);
   }else {
   $('#state').val(state).prop("selected", true);
   }
}) --%>

$(document).ready(function() {
    $("#keywordO").keydown(function(key) {
        if (key.keyCode == 13) {
           if($('#firstDate').val() == "" && $('#secondDate').val() == "") {
              var f = $('#hiddenSubmit');
  
              f.submit();
           }
           
           else{
              var f = $('#submitInfo');
              f.removeAttr("onsubmit");
              f.submit();
           }
        }
    });
});


$('#submit').click(function(){
   
   if($('#firstDate').val() == "" && $('#secondDate').val() == "") {
      var f = $('#hiddenSubmit');
      f.submit();
   }
   
   else{
      var f = $('#submitInfo');
      f.removeAttr("onsubmit");
      f.submit();
   }
   
})

$('#state').change(function(){
   $('#hiddenState').val($(this).val());
})

$('#keywordO').change(function(){
   $('#hiddenKeywordO').val($(this).val());
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