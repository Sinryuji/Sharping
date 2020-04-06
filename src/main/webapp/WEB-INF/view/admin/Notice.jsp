<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		table{
		    border-collapse: collapse;
		    line-height: 1.5;
		}

		table thead th {
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    color: #369;
		    border-bottom: 3px solid #036;
		}
		table tbody th {
		    width: 150px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    border-bottom: 1px solid #ccc;
		    background: #f3f6f7;
		}
		table td {
		    width: 350px;
		    padding: 10px;
		    vertical-align: top;
		    border-bottom: 1px solid #ccc;
		}
		
		.btn{
			margin-left:168px;
		}
		
	</style>
	
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
<br>

<input type="button" class="btn" value="닫기" onclick="window.close()">
</body>
</html>