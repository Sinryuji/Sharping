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
      
	    table{
		    border-collapse: collapse;
		    line-height: 1.5;
			width:500px;
			margin:auto;
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
		
		.td1{
			background: silver;
			text-align:center;
			vertical-align:middle;
		}
		
		.td2{
			text-align:left;
		}

</style>
</head>
<body>
   <table>
      <colgroup>
         <col style="width:50%;" />
         <col style="width:auto;" />
      </colgroup>
      <thead>
         <tr>
            <th>항목</th>
            <th>내용</th>
         </tr>
      </thead>
      <tbody>
      	<tr>
			<td class="td1">이름</td>
			<td class="td2">${member.name}</td>
        </tr>
        <tr>
			<td class="td1">연락처</td>
			<td class="td2">${member.phone}</td>
        </tr>
        <tr>
			<td class="td1">우편번호</td>
			<td class="td2">${member.post}</td>
        </tr>
        <tr>
			<td class="td1">상세 주소</td>
			<td class="td2">${member.address}</td>
        </tr>
      </tbody>
   </table>
   <br><div align="center"><input type="button" value="닫기" onclick="window.close()"></div>
</body>
</html>