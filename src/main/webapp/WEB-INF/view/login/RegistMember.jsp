<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RegistMember</title>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />

<!-- 카카오 주소 찾기 api -->
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-1.7.min.js"></script>
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
			$(document).click();
		}
	</script>

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

#idCheck, #regist, #cancel, #a, #phoneCheck, #emailCheck {
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

#idCheck:hover, #regist:hover, #cancel:hover, #a:hover, #phoneCheck:hover, #emailCheck:hover
	{
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
			<form action="registCompleteMember" method="post" id="registCompleteMember">
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
							<td class="td2"><input type="text" name="name" id="name" required /></td>
						</tr>
						<tr>
							<td class="td1">아이디</td>
							<td class="td2"><input type="text" id="id" name="id" required />
							<button class="idCheck" id="idCheck" type="button">중복확인</button></td>
						</tr>
						<tr>
							<td class="td1">비밀번호</td>
							<td class="td2"><input type="password" name="password" id="pw" required /> <span id="pwChk1"></span></td>
						</tr>
						<tr>
							<td class="td1">비밀번호 재입력</td>
							<td class="td2"><input type="password" name="passwordCheck" id="pwc" required /> <span id="pwChk2"></span> <span id="yes">O</span>
							</td>
						</tr>
						<tr>
							<td class="td1">휴대폰 번호</td>
							<td class="td2"><input type="text" name="phone" id="ph" required />
							<button class="phoneCheck" id="phoneCheck" type="button">중복확인</button>
							<span id="regZone2"></span></td>
						</tr>
						<tr>
							<td class="td1">이메일</td>
							<td class="td2" id="tdEmail"><input type="email" name="email" id="email" required />
							<button class="emailCheck" id="emailCheck" type="button">중복확인</button>
							<span id="regZone"></span>
							</td>
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
					</tbody>
				</table>

					<input type="button" class="submit" id="regist" value="회원가입">&nbsp;
					<input type="button" value="취소" id="cancel" onclick="location.href = '<c:url value='/main'/>'">

			</form>
		</div>
	</section>


	<script> 
	
	var count1 = 0;
	var count2 = 0;
	var count3 = 0;
	var count4 = 0;
	var count5 = 0;


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
	  

$(".idCheck").click(function(){
	
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
	   $(".submit").attr("disabled", "disabled");
	   $("#id").val('');
	   $("#id").focus();
	   count1 = 0;
   	} else if(data == 0){
	   alert("사용가능한 아이디입니다.");
	   count1 = 1;
   	}
	
	disabledCheck();
  }
 });  // ajax 끝
})

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

$(".submit").click(function(){
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
		alert("이메일 형식이 올바르지 않습니다!");
		$("#email").focus();
	}
	
	else {
		$("#registCompleteMember").submit();
	}
})

$(document).on("keyup", "#email", function(){
	
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = $("#email").val();
	
	if(email.match(regExp) != null) {
		count4 = 1;
		$("#regZone").html("올바른 이메일 형식입니다!");
	}
	else {
		$("#regZone").html("이메일 형식이 올바르지 않습니다!");
		count4 = 0;
	}
	
})



</script>
</body>
</html>