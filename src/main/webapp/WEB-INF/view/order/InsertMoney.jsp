<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertMoney</title>
</head>
<body>
<form action="payMoney">
입금 은행 <select name="bankCode"> 
<option value="none">은행을 선택해 주세요</option> 
<c:forEach var="bankCode" items="${bankInfo}" varStatus="status">
<option value="${bankCode.bankCode}">${bankCode.bankName}
</option>
</c:forEach>
</select><br>
계화번호 <input type="text" id="vaNum" name="vaNum" value=""><br>
금액  <input type="text" id="paytPrice" name="payPrice" value=""><br>
<input type="submit" value="입금하기">
</form>
</body>
</html>