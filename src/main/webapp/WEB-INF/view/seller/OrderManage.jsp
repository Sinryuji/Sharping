<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주문관리</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />

<style>
html {
	height: 100%;
}

body {
	/* background-image: url('https://images.pexels.com/photos/1470589/pexels-photo-1470589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'); */
	background-size: cover;
	padding: 0;
	margin: 0;
	height: 100%;
}

.navbar-nav {
	width: 100%;
	text-align: center;
}

.navbar-nav>li {
	float: none;
	display: inline-block;
}

.navbar-nav>li>a {
	padding-top: 30px;
}

.navbar-nav>li.navbar-right {
	float: right !important;
}

#container {
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	padding: 20px 0;
}

#containerBox {
	display: inline-block;
	vertical-align: middle;
}

#searchOrder {
	margin-bottom: 15px;
	text-align: left;
}

th {
	border-bottom: 4px solid silver;
}

td {
	border-bottom: 2px solid silver;
}

table {
	text-align: center;
	line-height: 1.5;
	vertical-align: middle;
	border-collapse: separate;
	border-spacing: 0 10px;
	width: 1000px;
	margin: auto;
}

table td {
	vertical-align: middle;
	padding-left: 10px;
}

#searchBox {
	display: inline
}

select {
	border: 1px solid #ccc;
	border-radius: 50px;
	color: #666;
	text-align: center;
	padding: 6px;
}

#ser {
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

#ser:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}

.delivery {
	width: 130px;
	height: 30px;
	font-family: 'Roboto', sans-serif;
	font-size: 13px;
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

.delivery:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}

</style>
</head>
<body>

	<nav class="navbar navbar-default">
		<div id="navBox">
			<%@ include file="../include/Nav.jsp"%>
		</div>

	</nav>

	<section id="container">
		<div id="containerBox">
		
			<form action="orderManage" id="searchOrder" name="searchOrder">
			
				<select class="dSearch" name="dSearch" id="dSearch" class="s">
					<option value="">-----선택-----</option>
					<option value="입금 대기" ${currentState == "입금 대기" ? "selected" : "" }>입금
						대기</option>
					<option value="결제 완료" ${currentState == "결제 완료" ? "selected" : "" }>결제
						완료</option>
					<option value="배송 준비중"
						${currentState == "배송 준비중" ? "selected" : "" }>배송 준비중</option>
					<option value="배송 중" ${currentState == "배송 중" ? "selected" : "" }>배송
						중</option>
					<option value="배송 완료" ${currentState == "배송 완료" ? "selected" : "" }>배송
						완료</option>
					<option value="구매 확정" ${currentState == "구매 확정" ? "selected" : "" }>구매
						확정</option>
					<option value="주문 취소" ${currentState == "주문 취소" ? "selected" : "" }>주문
						취소</option>
					<option value="반품 완료" ${currentState == "반품 완료" ? "selected" : "" }>반품
						완료</option>
					<option value="교환 완료" ${currentState == "교환 완료" ? "selected" : "" }>교환
						완료</option>
				</select>
				
				<div id="searchBox">
					<input type="text" name="search" id="search" class="s" placeholder="키워드를 입력하세요." value="${search}" /> 
					<input type="submit" id="ser" class="a" value="검색">
				</div>
				
				<input type="hidden" name="page" value="1">
			</form>
			
			<table>
				<colgroup>
					<col style="width: 5%;" />
					<col style="width: 10%;" />
					<col style="width: auto;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="allSelect"></th>
						<th>주문번호</th>
						<th>상품정보</th>
						<th>구매자</th>
						<th>금액</th>
						<th>결제방법</th>
						<th>배송정보</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:choose>
						<c:when test="${empty orderList }">
							<tr>
								<td colspan="10" align="center"><b>주문 정보가 없습니다.</b></td>
							</tr>
						</c:when>
						<c:when test="${!empty orderList}">
							<c:forEach var="list" items="${orderList}" varStatus="status">
								<tr>
									<td><input type="checkbox" class="select"></td>
									<td><c:out value="${list.orderNum}" /></td>
									<td><span style="float: left"><img
											src="opload/${list.productThumb}" style="width: 50px;">&nbsp;&nbsp;</span>
										<span style="float: left"><c:out
												value="${list.productName}" /></span></td>
									<td><a href="javascript:void(0);"
										onClick="javascript:buyerInfo('<c:out value="${list.id }"/>')">
											<c:out value="${list.id }" />
									</a></td>
									<td><c:out value="${list.payPrice}" /></td>
									<td><c:out value="${list.payCase}" /></td>
									<td><button type="button" class="delivery"
											data-id="${list.id}" data-orderNum="${list.orderNum}">배송정보열람</button></td>
									<td><a href="#" class="changeState"
										data-state="${list.state}" data-orderNum="${list.orderNum}"><c:out
												value="${list.state}" /></a></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
	</section>


	<script>
   
   history.scrollRestoration = "manual";

   var page = 1;

   $(function(){
   	getList(page);
   	page++;
   })

   $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
        if($(window).scrollTop() >= $(document).height() - $(window).height()){
       	 getList(page);
       	 console.log(page);
       	 page++; 
        } 
   });
   
   function getList(page) {
		
		console.log("되냐");
		
		 $.ajax({
		        type : 'POST',  
		        dataType : 'json', 
		        data : {
		        	page : page,
		        	search : $("#search").val(),
		        	dSearch : $("#dSearch").val()
		        	},
		        url : '<%=request.getContextPath()%>/orderManageScroll',
		        success : function(data) {
		        	console.log("되냐1.5");
		            /* var data = returnData.rows; */
		            var html = "";
		            /* if (page==1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
		                  $("#tbody").html(""); 
		            } */
		            
		            if (data.startNum<=data.totCnt){
		            	console.log("되냐2");
		                if(data.orderList.length>0){
		                	console.log("되냐3");
		                	// for문을 돌면서 행을 그린다.
		                	for(var i = 0 ; i < data.orderList.length ; i++) {
		                		var order = data.orderList[i];
		                		html += "<tr><td><input type='checkbox' class='select'></td><td>" + order.orderNum + "</td><td><span style='float:left'><img src='opload/" + order.productThumb  + "' style='width:50px;'>&nbsp;&nbsp;</span><span style='float:left'>" + order.productName + "</span></td><td><a class='buyerInfo' href='#'>" + order.id + "</a></td><td>" + order.payPrice + "</td><td>" + order.payCase + "</td><td><button type='button' class='delivery' data-id='" + order.id + "' data-orderNum='" + order.orderNum + "'>배송정보열람</button></td><td><a href='#' class='changeState' data-state='" + order.state + "' data-orderNum='" + order.orderNum + "'>" + order.state + "</a></td></tr>";
		                		  	
		                	}
																																																																																																																																					                	
		                }else{
		                //데이터가 없을경우
		                }
		            }
		           /*  html = html.replace(/%20/gi, " "); */
		            if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
		            	if(data.orderList.length != 0) {
		                	$("#tbody").html(html); 
		            	} else {
		            		$("#tbody").html("<tr><td colspan='10' align='center'><b>주문 정보가 없습니다.</b></td></tr>")
		            	}
		            }else{
		            	console.log("안함?");
		                $("#tbody").append(html);
		            }
		       },error:function(e){
		           if(e.status==300){
		               alert("데이터를 가져오는데 실패하였습니다.");
		           };
		       }
		    }); 

	}
   
   	// 주문 상태 변경하기
   	
   	$(document).on("click", ".changeState", function(){
   		var orderNum = $(this).attr("data-orderNum");
   		var state = $(this).attr("data-state");
   		
   		var popTitle = "popupOpener"
   		var popup = window.open("",popTitle, "width=700, height=320");
   			
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
   
     $(document).on("click", "#allSelect", function(){
        if($("#allSelect").is(":checked")){
           $(".select").prop("checked",true);
        }else {
           $(".select").prop("checked",false);
        }
     });
     
	$(document).on("click", ".select", function(){
       $("#allSelect").prop("checked", false);
      });
     
     
	
	$(document).on("click", ".delivery", function(){
    	 var i = $(this).attr("data-id");
    	 var orderNum = $(this).attr("data-orderNum");
            $.ajax({
               url : "<%=request.getContextPath()%>/selectDeliveryInfoById",
										type : "post",
										data : {
											id : i,
											orderNum : orderNum

										},

										success : function(data) {
											var url = "deliveryInfo?toName="
													+ data.order.toName
													+ "&toPhone="
													+ data.order.toPhone
													+ "&toPost="
													+ data.order.toPost
													+ "&toAddress="
													+ data.order.toAddress
													+ "&trackingNum="
													+ data.order.trackingNum;
											var name = "popup";
											var option = "width = 520, height = 350, left = 700, top = 200";
											window.open(url, name, option);
										}
									});
						});

		function buyerInfo(id) {
			window.name = "buyerInfo";
			var popup = window
					.open("buyerInfo" + "?id=" + id, "회원상세정보",
							"width = 520, height = 310, resizable = no, , left = 700, top = 200");
		}

		$('#dSearch').change(function() {

		})
	</script>
</body>
</html>