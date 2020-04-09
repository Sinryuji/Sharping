<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeclContent</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

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
	
	#hi{
		background: #CEFBC9;	
	}
	
	textarea{
			min-width: 490px;
			min-height: 150px;
			resize: none;
			overflow: hidden;
			outline: none;
	}
	
	div{
		margin:auto;
		width: 500px;
		text-align: center;
	}
	
	span{
		float: left;
	}

</style>
</head>
<body>
	<table>
		<colgroup>
			<col style="width:20%;" />
			<col style="width:auto;" />
		</colgroup>
		<thead>
			<tr>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="td1">상품명</td>
				<td class="td2">${product.productName}</td>
			</tr>
			<tr>
				<td class="td1">판매자</td>
				<td class="td2">${decl.sellerId}</td>
			</tr>
			<tr>
				<td class="td1">신고자</td>
				<td class="td2">${decl.declId}</td>
			</tr>
			<tr>
				<td class="td1">신고 사유</td>
				<td class="td2">${decl.declReason}</td>
			</tr>
		</tbody>
	</table>
	<br>
	<div>
		<b><span>접수 내용</span></b><br>
		<textarea rows="" cols="" readonly>${decl.declText}</textarea>
	</div>
   <br><div align="center"><input type="button" class="b" value="닫기" onclick="window.close()"></div>
</body>
<script>
	
</script>
</body>
</html>