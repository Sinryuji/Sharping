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
		
		.b {
		    width: 90px;
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

		.b:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}

</style>
</head>
<body>
   <table>
      <colgroup>
         <col style="width:30%;" />
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
			<td class="td1">수취인</td>
			<td class="td2"><%= request.getParameter("toName") %></td>
        </tr>
        <tr>
			<td class="td1">수취인 연락처</td>
			<td class="td2"><%= request.getParameter("toPhone") %></td>
        </tr>
        <tr>
			<td class="td1">우편 번호</td>
			<td class="td2"><%= request.getParameter("toPost") %></td>
        </tr>
        <tr>
			<td class="td1">배송지 주소</td>
			<td class="td2"><%= request.getParameter("toAddress") %></td>
        </tr>
        <tr>
			<td class="td1">운송장 번호</td>
			<td class="td2"><%= request.getParameter("trackingNum") %></td>
        </tr>
      </tbody>
   </table>
   <br><div align="center"><input type="button" class="b" value="닫기" onclick="window.close()"></div>
</body>
</html>