<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>DeliveryAddress</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
	
	<link rel='stylesheet' href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>
	<link rel='stylesheet'
		href='${pageContext.request.contextPath}/resources/css/woocommerce-layout.css'
		type='text/css' media='all' />
	<link rel='stylesheet'
		href='${pageContext.request.contextPath}/resources/css/woocommerce-smallscreen.css'
		type='text/css' media='only screen and (max-width: 768px)' />
	<link rel='stylesheet'
		href='${pageContext.request.contextPath}/resources/css/woocommerce.css'
		type='text/css' media='all' />
	<link rel='stylesheet'
		href='${pageContext.request.contextPath}/resources/css/font-awesome.min.css'
		type='text/css' media='all' />
	<link rel='stylesheet'
		href='${pageContext.request.contextPath}/resources/css/styleSB.css'
		type='text/css' media='all' />
	<link rel='stylesheet'
		href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
		type='text/css' media='all' />
	<link rel='stylesheet'
		href='${pageContext.request.contextPath}/resources/css/easy-responsive-shortcodes.css'
		type='text/css' media='all' />
	
<style>
html {
	height: 100%;
}

body {
/* 	background-image: url('${pageContext.request.contextPath}/resources/images/신세경1.jpg'); */
	background-size: cover;
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
	height: 100%;
}

.wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 190px; /* footer height */
}

.navbar-nav {
    width: 100%;
    text-align: center;
}

.navbar-nav > li {
    float: none;
    display: inline-block;
}

.navbar-nav > li.navbar-right {
    float: right !important;
} 

section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
	margin-bottom: 50px;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

div#containerBox {
	float: right;
	width: calc(100% - 200px - 20px);
	padding-bottom: 10px;
}

footer#footer {
	background: #e7e7e7;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	height:190px;
	padding: 7px 0;
	text-align: center;
}

footer#footer div {
	display: inline-block;
	margin-right: 10px;
}

.deliveryAddressUpdate, .deliveryAddressDelete, #btnUpload {
	    width: 100px;
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

.deliveryAddressUpdate:hover, .deliveryAddressDelete:hover, #btnUpload:hover {
     background-color: #FFB2F5;
     box-shadow: 0px 15px 20px hotpink;
     color: #fff;
     transform: translateY(-7px);
}

</style>
		
</head>
<body>

<div class="wrap">

	<nav class="navbar navbar-default">
		<div id="navBox">
			<%@ include file="../include/Nav.jsp"%>
		</div>
	</nav>

<article>
	<section id="container">
		<div id="containerBox">
			<h4>배송주소록</h4>
			<button type="button" id="btnUpload">신규등록</button>
		</div>
<table>
		<thead>
			<tr>
				<th>배송지</th>
				<th>이름</th>
				<th>연락처</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty deliveryList }" >
					<tr><td colspan="10" align="center"><b>저장된 배송주소가 없습니다.</b></td></tr>
				</c:when> 
				<c:when test="${!empty deliveryList}">
					<c:forEach var="list" items="${deliveryList}" varStatus="status">
						<tr>
							<td><c:out value="${list.daaName}"/></td>
							<td><c:out value="${list.daName}"/></td>
							<td><c:out value="${list.daPhone}"/></td>
							<td><c:out value="${list.daPost}"/></td>
							<td><c:out value="${list.daAddress} ${list.daAddressEtc}"/></td>
							<td>
								<input type="hidden" id="daaName${status.index}" value="${list.daaName }">
								<input type="hidden" id="id${status.index}" value="${authInfo.id}">
								<button class="deliveryAddressUpdate" value="${status.index}">수정</button>&nbsp;
								<button class="deliveryAddressDelete" value="${status.index}">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
		
	</section>
</article>


	<footer id="footer">
		<div id=footerBox>
			<%@ include file="../include/Footer.jsp"%>
		</div>
	</footer>
	
	
</div>
	
	<script>
		$('.deliveryAddressDelete').click(function(){
			
			var delDa = confirm("주소록을 삭제하시겠습니까?");
				if(delDa == true){
					var daaNameStr = '#daaName' + $(this).val();
					var idStr = '#id' + $(this).val();
					$.ajax({
						url : "<%=request.getContextPath()%>/deliveryAddressDelete",
							type : "post",
							data : {
								daaName : $(daaNameStr).val(),
								id : $(idStr).val()
								
							},
							
							success: function(data) {
								
								setTimeout(function() {
									history.go(0);
									}, 800);
							}
						})
						return true;
				}else if(delDa == false){
					return false;
				}
		});
		
		$('.deliveryAddressUpdate').click(function(){
			window.name = "DeliveryAddress";
			
			var popupp = window.open("deliveryAddressUpdate", "배송주소록 수정",
					"width = 700, height = 450, resizable = no, scrollbars = no, status = no")
			
			var daaNameStr = '#daaName' + $(this).val();
			var idStr = '#id' + $(this).val();
			
			var f = document.createElement("form");
			
			f.name="updateInfo";
			f.action="<%=request.getContextPath()%>/deliveryAddressUpdate";
			f.method="post";
			f.target="배송주소록 수정";
			
			var elem = document.createElement("input");
			
			elem.setAttribute("type", "hidden");
			elem.setAttribute("name", "daaName");
			elem.setAttribute("value", $(daaNameStr).val());
			
			var elem2 = document.createElement("input");
			
			elem2.setAttribute("type", "hidden");
			elem2.setAttribute("name", "id");
			elem2.setAttribute("value", $(idStr).val());
			
			f.appendChild(elem);
			f.appendChild(elem2);
			
			document.body.appendChild(f);
			
			f.submit();
			
	    	var timer = setInterval(function(){
		        if(popupp.closed) {
					clearInterval(timer);
					window.location.reload();
					
		        } 
		    },300)
			
		});
		
		$(document).on('click', '#btnUpload', function(){
			window.name="DeliveryAddress";
			
			var popup = window.open("deliveryAddressUpload", "배송주소록",
					"width = 700, height = 450, resizable = no, scrollbars = no, status = no");
		
	    	var timer = setInterval(function(){
		        if(popup.closed) {
					clearInterval(timer);
					window.location.reload();
					
		        } 
		    },300)
			
		});
			
	</script>
</body>
</html>