<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>주문관리</title>
   <script src="https://code.jquery.com/jquery-2.2.4.min.js"
      integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
      crossorigin="anonymous"></script>
   <style>
   
   	  th{
   	  	border-bottom: 4px solid silver;
   	  }	
   
      td{
      	border-bottom: 2px solid silver;
      }
      
      table{
         text-align: center;
         line-height: 1.5;
         vertical-align: middle;
         border-collapse:separate;
         border-spacing:0 10px;
         width: 1000px;
         margin:auto;
      }
      
      td span{
      	vertical-align: middle;
      }
      
      #searchOrder{
      	position: relative;
      	left: 450px;
      }
      
      #search{
      	height:24px;
      	border:0px;
      	text-align:left;
      	outline: 0;
      }
      
      #dSearch{
      	height:30px;
      }
      
      #searchBox{
      	border: 1px solid white;
      	background: white;
      }
      
	</style>
</head>
<body>
	<h1 style="text-align:center;"><a href="<c:url value='/main'/>"> 메인 </a></h1><br><br>
	<form action="orderManage" id="searchOrder" name="searchOrder">
		<select class="dSearch" name="dSearch" id="dSearch" class="s" >
			<option value="">-----선택-----</option>
			<option value="입금 대기" ${currentState == "입금 대기" ? "selected" : "" } >입금 대기</option>
			<option value="결제 완료" ${currentState == "결제 완료" ? "selected" : "" } >결제 완료</option>
			<option value="배송 준비중" ${currentState == "배송 준비중" ? "selected" : "" } >배송 준비중</option>
			<option value="배송 중" ${currentState == "배송 중" ? "selected" : "" } >배송 중</option>
			<option value="배송 완료" ${currentState == "배송 완료" ? "selected" : "" } >배송 완료</option>
			<option value="구매 확정" ${currentState == "구매 확정" ? "selected" : "" } >구매 확정</option>
			<option value="주문 취소" ${currentState == "주문 취소" ? "selected" : "" } >주문 취소</option>
			<option value="반품 완료" ${currentState == "반품 완료" ? "selected" : "" } >반품 완료</option>
			<option value="교환 완료" ${currentState == "교환 완료" ? "selected" : "" } >교환 완료</option>
		</select>
		<div id="searchBox" style="display:inline">
			<input type="text" name="search" id="search" class="s" placeholder="키워드를 입력하세요." value="${search}"/>
			<input type="submit" value="검색" style="height:30px;">
		</div>
		<hr color="black" width="11.5%" size="2px" style="margin-left:100px;" noshade>
	</form>
   <table>
      <colgroup>
         <col style="width:5%;" />
         <col style="width:10%;" />
         <col style="width:auto;" />
         <col style="width:10%;" />
         <col style="width:10%;" />
         <col style="width:15%;" />
         <col style="width:15%;" />
         <col style="width:15%;" />
      </colgroup>
      <thead>
         <tr>
            <th><input type="checkbox" id="allSelect"></th>
            <th>주문번호</th>
            <th>상품정보</th>
            <th>구매자</th>
            <th>가격</th>
            <th>결제방법</th>
            <th>배송정보</th>
            <th>상태</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${empty orderList }" >
               <tr>
               	<td colspan="10" align="center">
               		<b>주문 정보가 없습니다.</b>
               	</td>
               </tr>
            </c:when> 
            <c:when test="${!empty orderList}">
               <c:forEach var="list" items="${orderList}" varStatus="status">
                  <tr>
                     <td><input type="checkbox" class="select" id="chk${status.index}"></td>
                     <td><c:out value="${list.orderNum}"/></td>
                     <td>
                     	<span style="float:left"><img src="opload/${list.productThumb}" style="width:50px;">&nbsp;&nbsp;</span>
                        <span style="float:left"><c:out value="${list.productName}"/></span>
                    </td>
                     <td>
                     	<a href="javascript:void(0);" onClick="javascript:buyerInfo('<c:out value="${list.id }"/>')">
                     		<c:out value="${list.id }"/>
                     	</a>
                     </td>
                     <td><c:out value="${list.payPrice}"/></td>
                     <td><c:out value="${list.payCase}"/></td>
                     <td><button type="button" class="delivery" data-id="${list.id}">배송정보열람</button></td>
                     <td><a href="#" class="changeState" data-state="${list.state}" data-orderNum="${list.orderNum}"><c:out value="${list.state}"/></a></td>
                  </tr>
               </c:forEach>
            </c:when>
         </c:choose>
      </tbody>
   </table>
   <script>
   
   	// 주문 상태 변경하기
   	
   	$('.changeState').click(function(){
   		var orderNum = $(this).attr("data-orderNum");
   		var state = $(this).attr("data-state");
   		
   		var popTitle = "popupOpener"
   		var popup = window.open("",popTitle, "width=800, height=500");
   			
   		var f = document.createElement("form");
		
		f.action="<%=request.getContextPath()%>/updateOrderState";
		f.method="post";
		f.target=popTitle;
		
		var elem = document.createElement("input");
		
		elem.setAttribute("type", "hidden");
		elem.setAttribute("name", "orderNum");
		elem.setAttribute("value", orderNum);
		
		var elem2 = document.createElement("input");
		
		elem2.setAttribute("type", "hidden");
		elem2.setAttribute("name", "state");
		elem2.setAttribute("value", state);
		
		f.appendChild(elem);
		f.appendChild(elem2);
		
		document.body.appendChild(f);
		
		f.submit();
		
		var timer = setInterval(function(){
	        if(popup.closed) {
				clearInterval(timer);
				window.location.reload();
				
		
	        } 
	    },300)
	
   	})
   
   
     $("#allSelect").click(function(){
        if($("#allSelect").is(":checked")){
           $(".select").prop("checked",true);
        }else {
           $(".select").prop("checked",false);
        }
     });
     
     
     $(".select").click(function(){
       $("#allSelect").prop("checked", false);
      });
     
     
     $(".delivery").click(function(){
    	 var i = $(this).attr("data-id");
            $.ajax({
               url : "<%=request.getContextPath()%>/selectDeliveryInfoById",
                  type : "post",
                  data : { id : i },
                  
                  success: function(data) {
                	  var url = "deliveryInfo?toName=" + data.order.toName + "&toPhone=" + data.order.toPhone + "&toPost=" + data.order.toPost + "&toAddress=" + data.order.toAddress + "&trackingNum=" + data.order.trackingNum ;
                	  var name = "popup";
                	  var option = "width = 500, height = 350, left = 700, top = 200";
                 	 window.open(url, name, option);
                  }
            });
     });
     
     function buyerInfo(id){   
         window.name = "buyerInfo";   
     var popup = window.open("buyerInfo" + "?id=" + id , "회원상세정보",
                 "width = 500, height = 310, resizable = no, , left = 700, top = 200");
	}
     
    $('#dSearch').change(function(){
    	
    })
     
   </script>
</body>
</html>