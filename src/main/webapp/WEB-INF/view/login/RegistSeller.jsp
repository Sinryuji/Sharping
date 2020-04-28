<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-1.7.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>RegistSeller</title>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous">
</script>
<!-- 문자 인증 -->

<style>
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

table {
	border-collapse: collapse;
	line-height: 1.5;
	width: 700px;
	margin: auto;
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

.td1 {
	background: silver;
	text-align: center;
	vertical-align: middle;
}

.td2 {
	text-align: left;
}

.submit {
	margin-top: 20px;;
}

#idChk, #regist, #cancel, #check, #send, #a, #phoneCheck, #emailCheck {
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

#idChk:hover, #regist:hover, #cancel:hover,
#check:hover, #send:hover, #a:hover, #phoneCheck:hover , #emailCheck:hover {
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
			<form action="registCompleteSeller" id="registCompleteSeller" method="post">
				<table>
					<colgroup>
						<col style="width: 30%;" />
						<col style="width: auto;" />
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
							<td class="td2">
								<input type="text" name="name" id="name" required></td>
						</tr>
						<tr>
							<td class="td1">아이디</td>
							<td class="td2">
								<input type="text" id="id" name="id" required />
								<input type="button" id="idChk" onClick="idCheck();" value="중복확인"></td>
						</tr>
						<tr>
							<td class="td1">비밀번호</td>
							<td class="td2">
								<input type="password" name="password" id="pw" required /> 
								<span id="pwChk1"></span></td>
						</tr>
						<tr>
							<td class="td1">비밀번호 재입력</td>
							<td class="td2">
								<input type="password" name="passwordCheck" id="pwc" required /> 
								<span id="pwChk2"></span> 
								<span id="yes">O</span>
							</td>
						</tr>
						<tr>
							<td class="td1">휴대폰 번호</td>
							<td class="td2">
								<input type="text" name="phone" id="ph" required />
								<div class="phoneArea" id="phoneArea" style="display:inline">
								<button class="phoneCheck" id="phoneCheck" type="button">중복확인</button>
								<!-- <button type="button" id="send" onclick="sendSms();">전송</button> -->
								</div>
							</td>
						</tr>
						<tr>
							<td class="td1">인증 번호</td>
							<td class="td2">
								<input type="text" name="confirmNumber" id="confirmNumber" required />
								<button type="button" id="check" onclick="phoneCheck();">인증</button>
								<input type="hidden" path="random" id="random" value="${random }" /></td>
						</tr>
						<tr>
							<td class="td1">이메일</td>
							<td class="td2">
							
							<input type="email" name="email" id="email" required />
							<button class="emailCheck" id="emailCheck" type="button">중복확인</button>
							<span id="regZone"></span>
							</td>
						</tr>
						<tr>
							<td class="td1">스토어 이름</td>
							<td class="td2"><input type="text" name="storeName" id="storeName" required /></td>
						</tr>
						<tr>
							<td class="td1">스토어 주소</td>
							<td class="td2"><input type="text" name="storeAddress" id="storeAddress" required /></td>
						</tr>
						<tr>
							<td class="td1">스토어 소개글</td>
							<td class="td2"><input type="text" name="storeText" id="storeText" /></td>
						</tr>
						<tr>
							<td class="td1">주소</td>
							<td class="td2">
								<input type="text" name="post" id="post" readonly required /> 
								<input type="button" id="a" onClick="openDaumZipAddress();" value="주소 찾기" /> 
								<input type="text" name="address" id="address" style="margin-top:10px;margin-bottom:10px; width:250px;" readonly required />
								<input type="text" name="addressEtc" id="adressEtc" placeholder="상세주소를 입력해주세요." style="width:200px;" required>
							</td>
						</tr>
						<tr>
							<td class="td1">계좌번호</td>
							<td class="td2"><input type="text" name="bankAccount" id="bankAccount" required /></td>
						</tr>
						<tr>
							<td class="td1">은행코드</td>
							<td class="td2"><select name="bankCode">
								<option value="none">은행을 선택해 주세요</option>
								<c:forEach var="bankCode" items="${bankInfo}" varStatus="status">
									<option value="${bankCode.bankCode}">${bankCode.bankName}</option>
								</c:forEach>
							</select></td>
						</tr>
					</tbody>
				</table>
				
					<input type="button" class="submit" id="regist" value="회원가입">
					<input type="button" id="cancel" value="취소" onclick="location.href = '<c:url value='/main'/>'">
			</form>

		</div>
	</section>

<script>

var count1 = 0;
var count2 = 0;
var count3 = 0;
var count4 = 0;
var count5 = 0;

var phoneChk = false;
var idChk = false;

/* 인증번호 발송 */
function sendSms() {
	
	$.ajax({
		url : "<%=request.getContextPath()%>/sendSms",
		data : {
			receiver : $("#ph").val(),
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
					phoneChk = true;
					if(phoneChk == true && idChk == true){
					$("#regist").removeAttr("disabled");
					count4 = 1;
					}
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}


function idCheck(){
	
	if($("#id").val() == "") {
		alert("아이디를 입력하세요!");
		$("#id").focus();
		return;
	}

	 var query = {id : $("#id").val()};
	 
	 $.ajax({
	  url : "/Sharping/idCheck",
	  type : "post",
	  data : query,
	  dataType : "json",
	  success : function(data) {
	  
		if(data == 1){
		   alert("중복된 아이디입니다.");
		  /*  $(".submit").attr("disabled", "disabled"); */
		   $("#id").val('');
		   $("#id").focus();
		   count1 = 0;
	   	} else if(data == 0){
		   alert("사용가능한 아이디입니다.");
		   count1 = 1;
		   idChk = true;
		   if(phoneChk == true && idChk == true){
		   $("#regist").removeAttr("disabled");
		   }
	   	}
	  }
	 });  // ajax 끝
	};
	
	$('#pw').blur(function(){
	    if($('#pw').val() == ""){
	    	$('#pwChk1').css("color","red")
	    	$('#pwChk1').html('  비밀번호를 입력 해주세요.');
	    	$('#pw').focus();
	    }else if($('#pwc').val() == ""){
	    	$('#pwChk1').html('');
	    	$('#pwc').focus();
	    	$('#pwChk1').css("color","black")
	    	$('#pwChk2').html('  비밀번호를 확인 해주세요.');
	    }else{
	    	$('#pwChk1').html('');
	    }
	});

	$('#pwc').blur(function(){
	    if($('#pwc').val() == ""){
	    	$('#pwChk2').css("color","red")
	    	$('#pwChk2').html('  비밀번호를 확인 해주세요.');
	    	$('#pwc').focus();
	    }else{
	    	$('#pwChk2').html('');
	    }
	});

	var pw1;
	var pw2;
	$(function(){
	    $('#yes').hide();
	    $('#pwc').blur(function(){
	    	pw1 = $('#pw').val();
	        pw2 = $('#pwc').val();
	        if(pw1 != "" && pw2 != "") {
	            if(pw1 == pw2) {
	                $('#yes').css("color","blue");
	                $('#yes').show();
	                $('#pwChk2').html('');
	            }else{
	                $('#yes').hide();
	                $('#pwc').val('');
	                $('#pwChk2').css("color","red")
	                $('#pwChk2').html('  비밀번호가 일치하지 않습니다. 비밀번호를 확인 해주세요.');
	            	$('#pwc').focus();
	            }
	        }
	    });
	});	
	
	
	$(".phoneCheck").click(function(){
		
		if($("#ph").val() == "") {
			alert("휴대폰 번호 입력하세요!");
			$("#ph").focus();
			return;
		}
		
	 
	 var query = {phone : $("#ph").val()};
	 
	 $.ajax({
	  url : "/Sharping/phoneOverlapCheck",
	  type : "post",
	  data : query,
	  dataType : "json",
	  success : function(data) {
	  
		if(data ==  -1){
		   alert("중복된 핸드폰 번호입니다");
		   $(".submit").attr("disabled", "disabled");
		   $("#ph").val('');
		   $("#ph").focus();
		   count2 = 0;
	   	} else if(data == 1){
		   alert("사용가능한 핸드폰 번호 입니다.");
		   count2 = 1;
		   $("#phoneArea").html('<button type="button" id="send" onclick="sendSms();">전송</button>');
	   	}
		
		disabledCheck();
	  }
	 });  // ajax 끝
	})

	$(".emailCheck").click(function(){
		
		if($("#email").val() == "") {
			alert("이메일을 입력하세요!");
			$("#email").focus();
			return;
		}
		
		if(count5 == 0) {
			alert("이메일 형식이 올바르지 않습니다!");
			$("#email").focus();
			return;
		}
		
	 
	 var query = {email : $("#email").val()};
	 
	 $.ajax({
	  url : "/Sharping/emailOverlapCheck",
	  type : "post",
	  data : query,
	  dataType : "json",
	  success : function(data) {
	  
		if(data ==  -1){
		   alert("중복된 이메일입니다");
		   $(".submit").attr("disabled", "disabled");
		   $("#email").val('');
		   $("#email").focus();
		   count3 = 0;
	   	} else if(data == 1){
		   alert("사용가능한 이메일 입니다.");
		   count3 = 1;
	   	}
		
		disabledCheck();
	  }
	 });  // ajax 끝
	})

	function disabledCheck() {
		if(count1 == 1 && count2 == 1 && count3 == 1) {
			$(".submit").removeAttr("disabled");
		}
		else {
			$(".submit").attr("disabled", "disabled");
		}
	}
	
	$(document).on("click", ".submit", function(){
		if($("#name").val() == "") {
			alert("이름을 입력하세요!");
			$("#name").focus();
		}
		else if($("#id").val() == "") {
			alert("아이디를 입력하세요!");
			$("#id").focus();
		}
		else if($("#pw").val() == "") {
			alert("비밀번호를 입력하세요!");
			$("#pw").focus();
		}
		else if($("#pwc").val() == "") {
			alert("비밀번호 재입력을 입력하세요!");
			$("#pwc").focus();
		}
		else if($("#ph").val() == "") {
			alert("전화번호를 입력하세요!");
			$("#ph").focus();
		}
		else if($("#email").val() == "") {
			alert("이메일을 입력하세요!");
			$("#email").focus();
		}
		else if($("#post").val() == "") {
			alert("주소를 입력하세요!");
			$("#post").focus();
		}
		else if($("#storeName").val() == "") {
			alert("스토어 이름을 입력하세요!");
			$("#storeName").focus();
		}
		else if($("#sotreAddress").val() == "") {
			alert("스토어 주소를 입력하세요!");
			$("#sotreAddress").focus();
		}
		else if($("#storeText").val() == "") {
			alert("주소를 입력하세요!");
			$("#").focus();
		}
		else if($("#bankAccount").val() == "") {
			alert("계좌번호를 입력하세요!");
			$("#bankAccount").focus();
		}
		else if(count1 == 0) {
			alert("아이디 중복을 확인하세요!")
			$("#id").focus();
		}
		else if(count2 == 0) {
			alert("휴대폰 번호 중복을 확인하세요!");
			$("#ph").focus();
		}
		else if(count3 == 0) {
			alert("이메일 중복을 확인하세요!");
			$("#email").focus();
		}
		else if(count4 == 0) {
			alert("휴대폰 번호 인증을 진행하세요!");
			$("#confirmNumber").focus();
		}
		else if(count5 == 0) {
			alert("이메일 형식이 올바르지 않습니다!");
			$("#email").focus();
		}
		else {
			$("#registCompleteSeller").submit();
		}
	})
	
	$(document).on("keyup", "#email", function(){
	
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = $("#email").val();
	
	if($("#email").val() == "") {
		$("#regZone").html("");
		return;
	}
	
	if(email.match(regExp) != null) {
		count5 = 1;
		$("#regZone").html("올바른 이메일 형식입니다!");
	}
	else {
		$("#regZone").html("이메일 형식이 올바르지 않습니다!");
		count5 = 0;
	}
	
})

</script>
<!-- 카카오 주소 찾기 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	</script>
</body>
</html>