<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
      integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
      crossorigin="anonymous"></script>
      
<style>
	#mm {
		text-align: center;
		margin: 0 910px;
	}
   	
	a{
		text-decoration:none;
		color:black;
	}
	
	.menu{
		margin-top: 20px;
		margin-left: 20px;
	}
	
	.my {
	    width: 140px;
	    height: 50px;
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

	.my:hover {
  		background-color: #FFB2F5;
  		box-shadow: 0px 15px 20px hotpink;
  		color: #fff;
  		transform: translateY(-7px);
	}
	
	table{
        text-align: center;
        border-collapse:separate;
        border-spacing:0 10px;
        width: 700px;
        margin:auto;
    }
     
     th{
  	  	border-bottom: 3px solid silver;
  	 }
  	  
     td{
     	border-bottom: 2px solid silver;
     }
     
     #selDelete{
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

	#selDelete:hover {
 		background-color: #FFB2F5;
 		box-shadow: 0px 15px 20px hotpink;
 		color: #fff;
 		transform: translateY(-7px);
 	}
 	
 	.cen{
 		width: 100px;
 		margin: auto;
 	}
     
</style>
      
</head>
<body>
	<div class="menu">
		<input type="button" class="my" onclick="location.href='${pageContext.request.contextPath}/myPage'" value="마이 페이지"><br>
	</div>
	<div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div>
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