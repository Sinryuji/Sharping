<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style>
		
		h4 {
			display: inline;
		}
	
		.a {
		    width: 80px;
		    height: 30px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 12px;
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

		.a:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		div{
			text-align:center;
		}
		
		table{
			margin: auto;
			border-collapse:separate;
         	border-spacing:0 10px;
         	width:400px;
		}
		
		th{
			border-bottom: 3px solid black;
		}
		
		td{
			border-bottom: 1px solid black;
			padding:10px;
		}
		
		.line{
			border-top: 2px solid black;
			border-bottom: 2px solid black;
		}
		
		
</style>
</head>
<body>
<br>
<div>
	<div class="line">
		<span id="step1">
		입금 대기
		</span>
		~
		<span id="step2">
		결제 완료
		</span>
		~
		<span id="step3">
		배송 준비중
		</span>
		~
		<span id="step4">
		배송 중
		</span>
		~
		<span id="step5">
		배송 완료
		</span>
		~
		<span id="step6">
		구매 확정
		</span>
	</div>
<br>
<form id="changeStateComlete" action="changeStateComlete">
<input type="hidden" value="${order.orderNum}" name="orderNum">
<input type="hidden" value="${order.state}" name="state">
<c:if test="${order.state == '결제 완료' || order.state == '배송 준비중'}">
<c:if test="${order.state == '배송 준비중'}">
<br>
<table>
	<colgroup>
		<col style="width:30%;" />
	    <col style="width:auto;" />
	</colgroup>
	<thead>
		<tr>
			<th colspan="3"></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>배송사<td>
			<td>
				<select name="trackingCode">
					<option value="null">==택배사를 선택해주세요==</option>
			  		<option value="01">우체국 택배</option>
			  		<option value="05">한진 택배</option>
			  		<option value="04">CJ 대한통운</option>
			  		<option value="08">롯데 택배</option>
			  		<option value="06">로젠 택배</option>
			  		<option value="46">CU 편의점 택배</option>
			  		<option value="24">CVSnet 편의점 택배</option>
			   </select>
			<td>
		</tr>
		<tr>
			<td>운송장 번호<td>
			<td>
				<input type="text" name="trackingNum">
			<td>
		</tr>
	</tbody>	
<!-- 배송사 : <select name="trackingCode">
			<option value="null">==택배사를 선택해주세요==</option>
	  		<option value="01">우체국 택배</option>
	  		<option value="05">한진 택배</option>
	  		<option value="04">CJ 대한통운</option>
	  		<option value="08">롯데 택배</option>
	  		<option value="06">로젠 택배</option>
	  		<option value="46">CU 편의점 택배</option>
	  		<option value="24">CVSnet 편의점 택배</option>
	   </select><br>
운송장 번호 : <input type="text" name="trackingNum"> -->
</table>
<br>
</c:if>
<br>
<button type="button" class="a" id="changeState">다음</button>
</c:if>
</form>
</div>
<script>

	var orderNum = "";
	var state = "";

	$(document).ready(function(){
		orderNum = "${order.orderNum}";
		state = "${order.state}";
		
		if(state == '입금 대기') {
			$('#step1').html('<h4>입금 대기</h4>');
		}
		if(state == '결제 완료') {
			$('#step2').html('<h4>결제 완료</h4>');
		}
		if(state == '배송 준비중') {
			$('#step3').html('<h4>배송 준비중</h4>');
		}
		if(state == '배송 중') {
			$('#step4').html('<h4>배송 중</h4>');
		}
		if(state == '배송 완료') {
			$('#step5').html('<h4>배송 완료</h4>');
		}
		if(state == '구매 확정') {
			$('#step6').html('<h4>구매 확정</h4>');
		}
	})
	
	$('#changeState').click(function(){
		if($('select[name=trackingCode]').val() == 'null') {
			alert("택배사를 선택 해 주십시오!");
		}
		else if($('select[name=trackingNum]').val() == '') {
			alert("송장 번호를 입력 해 주십시오!");
		}
		else {
			$('#changeStateComlete').submit();
		}
	})
</script>
</body>
</html>