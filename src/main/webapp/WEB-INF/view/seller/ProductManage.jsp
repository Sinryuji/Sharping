<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">   
   <title>상품관리</title>
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

#btnUpload {
	float: left;
	margin-bottom: 10px;
	margin-left: 15px;
}


   	  
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
		

		
#btnUpload, .sellP {
    width: 100px;
    height: 40px;
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

#btnUpload:hover, .sellP:hover {
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

   		<input type="button" id="btnUpload" onclick="location.href='${pageContext.request.contextPath}/uploadProduct'" value="신규등록">

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
      <tbody id="tbody">
         <c:choose>
            <c:when test="${empty productList }" >
               <tr><td colspan="10" align="center"><b>등록된 상품이 없습니다.</b></td></tr>
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
                     <td><c:out value="${list.buyCount}"/></td>
                     <td><c:out value="매출총액 : ${list.sales}원"/></td>
                     <td><label class="switch">
                          <input type="hidden" id="dis${status.index}" value="${status.index}" >
                          <input type="checkbox" class="display" data-productNum="${list.productNum}" ${list.productDisplay == "TRUE" ? "checked" : ""}>
                          <span class="slider round"></span>
                        </label>
                     </td>
                     <td><%--<input type="hidden" id="productNum${status.index}" value="${list.productNum}"> --%>
                     <button type="button" class="updateProduct" value="${list.productNum}">수정</button>&nbsp;<button type="button" class="deleteProduct" value="${list.productNum}">삭제</button></td>
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
		        	page : page
		        	},
		        url : '<%=request.getContextPath()%>/productManageScroll',
		        success : function(data) {
		        	console.log("되냐1.5");
		            /* var data = returnData.rows; */
		            var html = "";
		            /* if (page==1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
		                  $("#tbody").html(""); 
		            } */
		            
		            if (data.startNum<=data.totCnt){
		            	console.log("되냐2");
		                if(data.productList.length>0){
		                	console.log("되냐3");
		                	// for문을 돌면서 행을 그린다.
		                	for(var i = 0 ; i < data.productList.length ; i++) {
		                		var product = data.productList[i];
		                		var deliveryPrice;
		                		var checked = "";
		                		if(product.deliveryPrice == 0) {
		                			deliveryPrice = "무료배송";
		                		} else {
		                			deliveryPrice = product.deliveryPrice;
		                		}
		                		
		                		if(product.productDisplay == 'TRUE') {
		                			checked = 'checked';
		                		} else {
		                			checked = '';
		                		}
		                		
		                		html += "<tr><td><input type='checkbox' class='select' data-productNum='" + product.productNum + "'></td><td><span style='float:left'><img src='opload/" + product.productThumb  + "' style='width:50px;'>&nbsp;&nbsp;</span><span style='float:left'>" + product.productName + "<br>상품번호 : " + product.productNum + "&nbsp;&nbsp;</span></td><td>" + product.productPrice + "</td><td>" + deliveryPrice + "</td><td>" + product.buyCount + "</td><td>매출총액 : " + product.sales + "</td><td><label class='switch'><input type='checkbox' class='display' data-productNum='" + product.productNum + "' " + checked + "> <span class='slider round'></span></label></td><td><button type='button' class='updateProduct' value='" + product.productNum + "'>수정</button>&nbsp;<button type='button' class='deleteProduct' value='" + product.productNum  + "'>삭제</button></td></tr>";
		                             	
		                	}
		                }else{
		                //데이터가 없을경우
		                }
		            }
		           /*  html = html.replace(/%20/gi, " "); */
		            if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
		            	if(data.productList.length != 0){
		                	$("#tbody").html(html); 
		                } else {
		                	$("#tbody").html("<tr><td colspan='10' align='center'><b>등록된 상품이 없습니다.</b></td></tr>"); 
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

	$(document).on("click", ".updateProduct", function(){
      var productNum = $(this).val();
      
      var f = document.createElement("form");
      
      f.action="<%=request.getContextPath()%>/updateProduct";
      f.method="post";
      
      var elem = document.createElement("input");
      
      elem.setAttribute("type", "hidden");
      elem.setAttribute("name", "productNum");
      elem.setAttribute("value", productNum);
      
      f.appendChild(elem);
      
      document.body.appendChild(f);
      
      f.submit();
      
   });
	
	$(document).on("click", ".deleteProduct", function(){
      var productNum = $(this).val();
      
      $.ajax({
         url : "<%=request.getContextPath()%>/deleteProduct",
            type : "post",
            data : {
               productNum : productNum
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
   
   
   $(document).on("click", ".display", function(){
   	   var productNum = $(this).attr("data-productNum");
      if($(this).is(":checked")){
         $(this).val('TRUE');
      } else {
    	  $(this).val('FALSE');
      }
      
      $.ajax({
         url : "<%=request.getContextPath()%>/updateProductDisplay",
            type : "post",
            data : {
               productNum : productNum,
               productDisplay : $(this).val(),
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