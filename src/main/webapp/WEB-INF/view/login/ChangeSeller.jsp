<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangeSeller</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous">
</script>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<!-- 문자 인증 -->
<script>
/* 인증번호 발송 */
function sendSms() {
	$.ajax({
		url : "<%=request.getContextPath()%>/sendSms",
		data : {
			receiver : $("#phone").val(),
			random : $("#random").val()
		},
		type : "post",
		success : function(result) {
			if (result == "true") {
				alert("인증번호 전송!")
				console.log(result);
			} else {
				alert("인증번호 전송 실패");
			}
		}
	});
}

/* 인증번호 체크 */
function phoneCheck() {
	$.ajax({
		url : "<%=request.getContextPath()%>/smsCheck",
			type : "post",
			data : {
				authCode : $("#confirmNumber").val(),
				random : $("#random").val()
			},
			success : function(result) {
				if (result == "ok") {
					alert("번호 인증 성공");
					$("#changeSeller").removeAttr("disabled");
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}
</script>

<!-- 카카오 주소 찾기 api -->
<!-- <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					$("#post").val(data.zonecode);
					$("#address").val(data.address);
					$("#addressEtc").focus();
					console.log(data);
				}
			}).open();
		}
	</script> -->
	
	<style>
		table{
		    border-collapse: collapse;
		    line-height: 1.5;
			width:600px;
			margin:auto;
			margin-top:90px;
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
		
		.submit{
			margin-left:900px;;
		}
		
		#mm {
    		text-align: center;
 			margin: 0 950px;
    	}
    	
		a{
   	  		text-decoration:none;
   	  		color:black;
   	  	}
   	  	
   	  	h1{
   	  		display:inline;
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
		
		.submit {
		    width: 130px;
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

		.submit:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
	</style>
	
</head>
<body>
	<div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div>
	<form action="changeSellerComplete">
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
	    			<td class="td1">아이디</td>
	    			<td class="td2">
	    				<input type="text" name="id" value="${authInfo.id}" readonly>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="td1">휴대폰 인증</td>
	    			<td class="td2">
	    				<input type="text" name="phone" id="phone" placeholder="휴대폰 번호" />
						<button type="button" class="b" onclick="sendSms();">전송</button><br><br> 
						<input type="text" name="confirmNumber" id="confirmNumber" placeholder="인증번호"/>
						<button type="button" class="b" onclick="phoneCheck();">인증</button>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="td1">스토어 이름</td>
	    			<td class="td2">
	    				<input type="text" name="storeName" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="td1">스토어 주소</td>
	    			<td class="td2">
	    				<input type="text" name="storeAddress" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="td1">스토어 소개글</td>
	    			<td class="td2">
	    				<input type="text" name="storeText" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="td1">계좌번호</td>
	    			<td class="td2">
	    				<input type="text" name="bankAccount" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="td1">은행코드</td>
	    			<td class="td2">
	    				 <select name="bankCode">
								<option value="none">은행을 선택해 주세요</option>
								<c:forEach var="bankCode" items="${bankInfo}" varStatus="status">
									<option value="${bankCode.bankCode}">${bankCode.bankName}</option>
								</c:forEach>
							</select>
	    			</td>
	    		</tr>
	    	</tbody>
		</table>
		<br>
		<input type="hidden" path="random" id="random" value="${random}"/>
		<input type="submit" class="submit" id="changeSeller" value="전환하기" disabled="true">
	</form>

<%-- <form action="changeSellerComplete">
아이디:<input type="text" name="id" value="${authInfo.id}" readonly>
<h4>휴대폰 인증</h4>
휴대폰번호:<input type="text" name="phone" id="phone" />
<button type="button" onclick="sendSms();">전송</button><br> 
인증번호:<input type="text" name="confirmNumber" id="confirmNumber" />
<button type="button" onclick="phoneCheck();">인증</button><br>
<input type="hidden" path="random" id="random" value="${random }"/>
스토어이름:<input type="text" name="storeName" /><br> 
스토어주소:<input type="text" name="storeAddress" /><br>
스토어소개글:<input type="text" name="storeText" /><br>
<!-- 우편번호:<input type="text" name="post" id="post" readonly /> &nbsp;
주소:<input type="text" name="address" id="address" readonly /> &nbsp;
상세주소:<input type="text" name="addressEtc" id="adressEtc"> &nbsp; <input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /> <br>  -->
계좌번호:<input type="text" name="bankAccount" /><br> 
은행코드:<input type="number" name="bankCode" /><br> 
<input type="submit" id="changeSeller" value="전환하기" disabled="true">
</form> --%>
</body>
</html>