<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<colgroup>
		<col style="width:20%;"/>
        <col style="width:auto;"/>
	</colgroup>
	<thead>
		<tr>
			<th colspan="2">공지사항</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>제목</td>
			<td><%=request.getParameter("noticeSubject") %></td>
		</tr>
		<tr>
			<td>등록일</td>
			<td><%=request.getParameter("noticeDate") %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=request.getParameter("noticeText") %></td>
		</tr>
	</tbody>
</table>
<input type="button" value="닫기" onclick="window.close()">
</body>
</html>