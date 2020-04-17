<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관심상품</title>
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
	
table{
       text-align: center;
       border-collapse:separate;
       border-spacing:0 10px;
       width: 800px;
       margin:auto;
}

table td, table th {
	vertical-align: middle;
	padding-left: 10px;
}
 
th{
 	border-bottom: 3px solid silver;
}
 
td{
 	border-bottom: 2px solid silver;
}
    
#selDelete{
    width: 90px;
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

#selDelete:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}
 	
.cen{
	float:right;
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
	<table>
		<colgroup>
         <col style="width:5%;" />
         <col style="width:20%;" />
         <col style="width:auto;" />
         <col style="width:20%;" />
         <col style="width:20%;" />
      </colgroup>
      <thead>
         <tr>
            <th><input type="checkbox" id="allSelect"></th>
            <th>판매자</th>
            <th>상품명</th>
            <th>가격</th>
            <th>배송비</th>
         </tr>
      </thead>
      
      <tbody>
      	<c:choose>
      		<c:when test="${empty productList }">
      			<tr><td colspan="10" align="center"><b>추가된 관심 상품이 없습니다.</b></td></tr>
      		</c:when>
      		<c:when test="${!empty productList}">
      			<c:forEach var="list" items="${productList}" varStatus="status">
      				<tr>
      					<td><input type="checkbox" class="select" id="chk${status.index}" data-productNum="${list.productNum}"></td>
      					<td><c:out value="${list.id }"/></td>
      					<td>
      						<span style="float:left">
      							<img src="opload/${list.productThumb}" style="width:50px;">&nbsp;&nbsp;
      						</span>
      						<span style="float:left">
      							<a href="#" onClick="productView(<c:out value="${list.productNum}"/>)">
      							<c:out value="${list.productName }"/>
      							</a>
      						</span>
      					</td>
      					<td><c:out value="${list.productPrice }"/></td>
      					<td>
      						<c:if test="${list.deliveryPrice eq 0}">
      							<c:out value="무료"/>
      						</c:if>
      						<c:if test="${list.deliveryPrice ne 0}">
      							<c:out value="${list.deliveryPrice}"/>
      						</c:if>
      					</td>
      				</tr>
      			</c:forEach>
      		</c:when>
      	</c:choose>
      </tbody>
	</table>
	<br>
	<div class="cen">
		<button type="button" id="selDelete">삭제</button>
	</div>		
		</div>
	</section>
	
	

<script>
/* 체크박스 전체 선택 / 해제 */
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
 
 /* 관심상품 선택 삭제 */
 $("#selDelete").click(function(){
	 if($("#allSelect").is(":checked") || $(".select").is(":checked")){
	     var sDel = confirm('선택된 상품을 관심상품 목록에서 삭제합니다.\n삭제 이후에는 복구가 불가능 합니다.\n 정말 삭제 하시겠습니까?');
	     if(sDel == true){
	        var selArr = new Array();
	        
	        $("input[class='select']:checked").each(function(){
	           selArr.push($(this).attr("data-productNum"));
	        });
	        
	        $.ajax({
	           url : "<%=request.getContextPath()%>/deleteSelectWishByProductNum",
	              type : "post",
	              data : { 
					chk : selArr 		  
	              }, 
	              
	              success: function(data) {
	                 setTimeout(function() {
	                    history.go(0);
	                 }, 800);
	              }
	        });
	     } else {
	        return false;
	     }
	 } else {
		 alert('선택된 상품이 없습니다.')
	 }
  });
 
 function productView(productNum){
		var url = "${pageContext.request.contextPath}"+"/product";
		url = url + "?productNum=" + productNum;
		location.href = url;
	}
 
</script>
</body>
</html>