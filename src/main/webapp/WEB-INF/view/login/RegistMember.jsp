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

#idCheck, #regist, #cancel, #a {
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

#idCheck:hover, #regist:hover, #cancel:hover, #a:hover
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
			<form action="registCompleteMember" method="post">
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
							<td class="td2"><input type="text" name="phone" id="ph" required /></td>
						</tr>
						<tr>
							<td class="td1">이메일</td>
							<td class="td2"><input type="email" name="email" id="email" required /></td>
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

					<input type="submit" class="submit" id="regist" value="회원가입">&nbsp;
					<input type="button" value="취소" id="cancel" onclick="location.href = '<c:url value='/main'/>'">

			</form>

		</div>
	</section>


	<script> 

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
   	} else if(data == 0){
	   alert("사용가능한 아이디입니다.");
   	}
  }
 });  // ajax 끝
})

</script>
</body>
</html>