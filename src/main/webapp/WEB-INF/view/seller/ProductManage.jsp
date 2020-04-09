<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>상품관리</title>
   <script src="https://code.jquery.com/jquery-2.2.4.min.js"
      integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
      crossorigin="anonymous"></script>
   <style>
   	  
   	  th{
   	  	border-bottom: 3px solid silver;
   	  }
   	  
      td{
      border-bottom: 2px solid silver;
      }
      
      table{
         text-align: center;
         border-collapse:separate;
         border-spacing:0 10px;
         width: 1000px;
         margin:auto;
      }
      
      .del{
      	float:right;
      	margin-right: 455px;
      }		
      
      #upload{
      	margin-left: 450px;
      }
      
      .switch {
        position: relative;
        display: inline-block;
        width: 52px;
        height: 25px;
        vertical-align:middle;
      }

      /* Hide default HTML checkbox */
      .switch input {display:none;}
      
      /* The slider */
      .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
      }
      
      .slider:before {
        position: absolute;
        content: "";
        height: 18px;
        width: 18px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
      }
      
      input:checked + .slider {
        background-color: #2196F3;
      }
      
      input:focus + .slider {
        box-shadow: 0 0 1px #2196F3;
      }
      
      input:checked + .slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
      }
      
      /* Rounded sliders */
      .slider.round {
        border-radius: 34px;
      }
      
      .slider.round:before {
        border-radius: 50%;
      }
      
      #mm {
    		text-align: center;
 			margin: 0 910px;
    	}
    	
    	a{
   	  		text-decoration:none;
   	  		color:black;
   	  	}
   	  	
   	  	.updateProduct {
		    width: 60px;
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

		.updateProduct:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		.deleteProduct {
		    width: 60px;
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

		.deleteProduct:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		#selDelete {
		    width: 60px;
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
		
		.a {
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

		.a:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		.sellP {
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

		.sellP:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		.menu{
			margin-top: 20px;
			margin-left: 20px;
		}
      
</style>
</head>
<body>
	<div class="menu">
		<input type="button" class="sellP" onclick="location.href='${pageContext.request.contextPath}/sellerPage'" value="판매자 페이지"><br>
	</div>
	<br>
	<div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div>
	<div id="upload">
   		<input type="button" class="a" onclick="location.href='${pageContext.request.contextPath}/uploadProduct'" value="신규등록">
	</div>
   <table>
      <colgroup>
         <col style="width:5%;" />
         <col style="width:auto;" />
         <col style="width:10%;" />
         <col style="width:10%;" />
         <col style="width:10%;" />
         <col style="width:20%;" />
         <col style="width:10%;" />
      </colgroup>
      <thead>
         <tr>
            <th><input type="checkbox" id="allSelect"></th>
            <th>상품명</th>
            <th>가격</th>
            <th>배송비</th>
            <th>구매수</th>
            <th>매출총액</th>
            <th>진열여부</th>
            <th></th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${empty productList }" >
               <tr><td colspan="5" align="center"><b>등록된 상품이 없습니다.</b></td></tr>
            </c:when> 
            <c:when test="${!empty productList}">
               <c:forEach var="list" items="${productList}" varStatus="status">
                  <tr>
                     <td><input type="checkbox" class="select" id="chk${status.index}" data-productNum="${list.productNum}"></td>
                     <td><span style="float:left"><img src="opload/${list.productThumb}" style="width:50px;">&nbsp;&nbsp;</span>
                        <span style="float:left"><c:out value="${list.productName}"/><br>
                        <c:out value="상품번호 : ${list.productNum}"/>&nbsp;&nbsp;</span></td>
                     <td><c:out value="${list.productPrice}"/></td>
                     <td>
                        <c:if test="${list.deliveryPrice eq 0}">
                           <c:out value="무료"/>
                        </c:if>                        
                        <c:if test="${list.deliveryPrice ne 0}">
                           <c:out value="${list.deliveryPrice}"/>
                        </c:if>
                     </td>
                     <td><c:out value="${list.butCount}"/></td>
                     <td><c:out value="매출총액 : ${list.sales}원"/></td>
                     <td><label class="switch">
                          <input type="hidden" id="dis${status.index}" value="${status.index}" >
                          <input type="checkbox" class="display" id="chk${status.index}" ${list.productDisplay == "TRUE" ? "checked" : ""}>
                          <span class="slider round"></span>
                        </label>
                     </td>
                     <td><input type="hidden" id="productNum${status.index}" value="${list.productNum}">
                     <button class="updateProduct" value="${status.index}">수정</button>&nbsp;<button class="deleteProduct" value="${status.index}">삭제</button></td>
                  </tr>
               </c:forEach>
            </c:when>
         </c:choose>
      </tbody>
   </table>
   <br>
   <div class="del">
      <input type="hidden" id="id" value="${authInfo.id}">
      <button id="selDelete">삭제</button>
   </div>
   <script>
   
   $('.updateProduct').click(function(){
      var productNumStr = '#productNum' + $(this).val();
      
      var f = document.createElement("form");
      
      f.action="<%=request.getContextPath()%>/updateProduct";
      f.method="post";
      f.target="";
      
      var elem = document.createElement("input");
      
      elem.setAttribute("type", "hidden");
      elem.setAttribute("name", "productNum");
      elem.setAttribute("value", $(productNumStr).val());
      
      f.appendChild(elem);
      
      document.body.appendChild(f);
      
      f.submit();
      
   });
   
   $('.deleteProduct').click(function(){
      var productNumStr = '#productNum' + $(this).val();
      
      $.ajax({
         url : "<%=request.getContextPath()%>/deleteProduct",
            type : "post",
            data : {
               productNum : $(productNumStr).val()
            },
            
            success: function(data) {
               
               setTimeout(function() {
                  history.go(0);
               }, 800);
            }
      });
   });
   
   
   
   $(function(){
      if(document.getElementsByClassName("display").checked == true){
         document.getElementsByClassName("display").value = 'TRUE';
      } else {
         document.getElementsByClassName("display").value = 'FALSE';
      }               
   });
   
   
   
     $(".display").click(function(){
       var productNumStr = '#productNum' + $(this).prev().val();
       var chk = '#chk' + $(this).prev().val();
       var chkk = 'chk' + $(this).prev().val();
      if($(this).is(":checked")){
         document.getElementById(chkk).value = 'TRUE';
      } else {
         document.getElementById(chkk).value = 'FALSE';
      }
      
      $.ajax({
         url : "<%=request.getContextPath()%>/updateProductDisplay",
            type : "post",
            data : {
               productNum : $(productNumStr).val(),
               productDisplay : $(chk).val(),
            }, 
            success: function(data) {
               
            }
      });
   });
     
     
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
     
     
     $("#selDelete").click(function(){
    	if($("#allSelect").is(":checked") || $(".select").is(":checked")){
	        var sDel = confirm('선택된 상품을 삭제합니다.\n삭제 이후에는 복구가 불가능 합니다.\n 정말 삭제 하시겠습니까?');
	        if(sDel == true){
	           var selArr = new Array();
	           
	           $("input[class='select']:checked").each(function(){
	              selArr.push($(this).attr("data-productNum"));
	           });
	           
	           $.ajax({
	              url : "<%=request.getContextPath()%>/deleteSelectProductByProductNum",
	                 type : "post",
	                 data : { chk : selArr }, 
	                 
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
   
   </script>
</body>
</html>