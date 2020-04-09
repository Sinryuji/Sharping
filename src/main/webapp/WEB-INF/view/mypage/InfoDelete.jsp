<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>InfoDelete</title>

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
	background-image: url('https://images.pexels.com/photos/1470589/pexels-photo-1470589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');
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

.blank {
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle;
}

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
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

#submit{
	margin-top:20px;;
}

#submit {
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

#submit:hover {
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
	<form action="infoDeleteComplete" method="post">
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
					<td>아이디</td>
					<td><input type="text" name="id"  id="id" value="${authInfo.id}"/></td>				
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" id="pw1" required /></td>				
				</tr>
			</tbody>
		</table>
		<input type="submit" id="submit" value="회원 탈퇴">
	</form>
	<%-- <form action="infoDeleteComplete" method="post">
		아이디 : <input type="text" name="id"  id="id" value="${authInfo.id}"/><br><br>
		비밀번호 : <input type="text" name="password" id="pw1" required /><br><br>
		<input type="submit" class="submit" value="회원 탈퇴">
	</form> --%>		
		</div>
		<span class="blank"></span>
	</section>

</body>
</html>