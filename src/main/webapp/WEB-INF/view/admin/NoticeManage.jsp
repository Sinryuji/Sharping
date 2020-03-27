<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <style>
    	#mm {
    		 text-align: center;
 			 margin: 0 auto;
    	}
    </style>

<meta charset="UTF-8">
<title>NoticeManage</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
</head>
<body>
	<div id="mm">	
	<a href="<c:url value='/admin'/>"> <h1>관리자메인</h1> </a>
	</div>


<b><h2>공지사항 관리</h2></b>

<a href='<c:url value='/admin/writeNotice'/>'>글쓰기</a>

<div class="container">
			<div class="table-responsive">
				<table class="table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>작성관리자</th>
							<th>제목</th>
							<th>작성날짜</th>
							<th>게시여부</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty noticeList }">
								<tr>
									<td colspan="5" align="center"><b>검색결과가 없습니다.</b></td>
								</tr>
							</c:when>
							<c:when test="${!empty noticeList}">
								<c:forEach var="list" items="${noticeList}">
									<tr>		
										<td><c:out value="${list.noticeNum}" /></td>
										<td><c:out value="${list.adminId}" /></td>							
										<td><a href="javascript:void(0);" onClick="javascript:noticeView('<c:out value="${list.noticeNum}"/>')"   >
										<c:out value="${list.noticeSubject}" />
										</a></td>
										
										<td><c:out value="${list.noticeDate}" /></td>
										<td><c:out value="${list.noticePost}" /></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>

<script>
	
	function noticeView(noticeNum){
		window.name="NoticeManage";
		
		var popup = window.open("noticeContent" + "?noticeNum=" + noticeNum, "공지사항내용", 
				"width = 450, height = 350, resizable = no, scrollbars = no, status = no");
		
    	var timer = setInterval(function(){
	        if(popup.closed) {
				clearInterval(timer);
				window.location.reload();
				
	        } 
	    },300)
		
	}
	
</script>

</body>
</html>