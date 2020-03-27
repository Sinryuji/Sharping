<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeliveryAddress</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
</head>
<body>
<input type="button" onclick="location.href='${pageContext.request.contextPath}/deliveryAddressUpload'" value="신규등록">
<table>
		<colgroup>
			<col style="width:5%;" />
			<col style="width:auto;" />
			<col style="width:15%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />
		</colgroup>
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
					<tr><td colspan="5" align="center"><b>저장된 배송주소가 없습니다.</b></td></tr>
				</c:when> 
				<c:when test="${!empty deliveryList}">
					<c:forEach var="list" items="${deliveryList}" varStatus="status">
						<tr>
							<td><c:out value="${list.daaName}"/></td>
							<td><c:out value="${list.daName}"/></td>
							<td><c:out value="${list.daPhone}"/></td>
							<td><c:out value="${list.daPost}"/></td>
							<td><c:out value="${list.daAddress} ${list.daAddressEtc}"/></td>
							<td><input type="hidden" id="daaName${status.index}" value="${list.daaName }"><input type="hidden" id="id${status.index}" value="${authInfo.id}">
							<button class="deliveryAddressUpdate" value="${status.index}">수정</button>&nbsp;<button class="deliveryAddressDelete" value="${status.index}">삭제</button></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>
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
			
			
			
			
		<%-- 	$.ajax({
				url : "<%=request.getContextPath()%>/deliveryAddressUpdate",
					type : "post",
					data : {
						daaName : $(daaNameStr).val(),
						id : $(idStr).val()
						
					},
					
					success: function(data) {
						window.location.href="<%=request.getContextPath()%>/deliveryAddressUpdate?daaName=$(daaNameStr).val()&id=$(idStr).val()";
					}
				
				
				
					
				});

			

		}) --%>
		
		<%-- $('.deliveryAddressUpdate').click(function(){
			var daaNameStr = '#daaName' + $(this).val();
			var idStr = '#id' + $(this).val();
			$.ajax({
				url : "<%=request.getContextPath()%>/deliveryAddressUpdate",
					type : "post",
					data : {
						daaName : $(daaNameStr).val(),
						id : $(idStr).val()
						
					},
					
					success: function(data) {
						window.location.href="<%=request.getContextPath()%>/deliveryAddressUpdate?daaName=$(daaNameStr).val()&id=$(idStr).val()";
					}
				
				
				
					
				});

			

		}) --%>
		
		<%-- $('.deliveryAddressUpdate').click(function(){
			var daaNameStr = '#daaName' + $(this).val();
			var idStr = '#id' + $(this).val();
			var daNameStr = '#daName' + $(this).val();
			var daPhoneStr = '#daPhone' + $(this).val();
			var daPostStr = '#daPost' + $(this).val();
			var daAddressStr = '#daAddress' + $(this).val();
			var da
			$.ajax({
				url : "<%=request.getContextPath()%>/deliveryAddressUpdate",
					type : "post",
					data : {
						daaName : $(daaNameStr).val(),
						id : $(idStr).val()
						
					}
				
				
					
				});
		}) --%>
	</script>
</body>
</html>