<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DeliveryAddress</title>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />
	
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
	
<style>

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

.deliveryAddressUpdate, .deliveryAddressDelete, .deliveryInfoPass {
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

.deliveryAddressUpdate:hover, .deliveryAddressDelete:hover, .deliveryInfoPass:hover {
     background-color: #FFB2F5;
     box-shadow: 0px 15px 20px hotpink;
     color: #fff;
     transform: translateY(-7px);
}


</style>
</head>
<body>
<%-- <input type="button" onclick="location.href='${pageContext.request.contextPath}/deliveryAddressUpload'" value="신규등록"> --%>
	<section id="container">
		<div id="containerBox">
			<h4>배송주소록</h4>
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
								<input type="hidden" id="daaName${status.index}" value="${list.daaName}">
								<input type="hidden" id="id${status.index}" value="${authInfo.id}">
								<input type="hidden" id="daName${status.index}" value="${list.daName}">
								<input type="hidden" id="daPhone${status.index}" value="${list.daPhone}">
								<input type="hidden" id="daPost${status.index}" value="${list.daPost}">
								<input type="hidden" id="daAddress${status.index}" value="${list.daAddress}">	
							    <button class="deliveryInfoPass" value="${status.index}">선택</button>&nbsp;															
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


	<script>
		$('.deliveryAddressDelete').click(function(){
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
				});
		})
		
		$('.deliveryAddressUpdate').click(function(){
			var daaNameStr = '#daaName' + $(this).val();
			var idStr = '#id' + $(this).val();
			
			var f = document.createElement("form");
			
			f.name="updateInfo";
			f.action="<%=request.getContextPath()%>/deliveryAddressUpdate";
			f.method="post";
			f.target="";
			
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
			
		});
		
		$('.deliveryInfoPass').click(function(){
			var daaNameStr = '#daaName' + $(this).val();
			var idStr = '#id' + $(this).val();
			var daNameStr = '#daName' + $(this).val();
			var daPhoneStr = '#daPhone' + $(this).val();
			var daPostStr = '#daPost' + $(this).val();
			var daAddressStr = '#daAddress' + $(this).val();
			
			window.opener.document.getElementById("new").checked = true;
			
			window.opener.document.getElementById("toName").value = $(daNameStr).val();
			window.opener.document.getElementById("toPost").value = $(daPostStr).val();
			window.opener.document.getElementById("toAddress").value = $(daAddressStr).val();
			window.opener.document.getElementById("toPhone").value = $(daPhoneStr).val();
	/* 		window.opener.document.getElementById("daaNameStr").value = $(daaNameStr).val();
			window.opener.document.getElementById("fromInput").value = $(daaNameStr).val(); */
			
			close();
		})
			
	
	</script>
</body>
</html>