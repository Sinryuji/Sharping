<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button id="btn">클릭</button>
</body>
<script>
$(document).ready(function(){
	
	$("#btn").bind("click", function(){
		alert("클릭!");
	});
	
	$("#btn").trigger("click");
		
});
	
</script>
</html>