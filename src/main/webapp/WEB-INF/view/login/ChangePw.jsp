<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ChangePw</title>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />
	
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script>

var phoneChk = false;
var idChk = false;

/* 인증번호 발송 */
function sendSms() {
	
	
	
	$.ajax({
		url : "<%=request.getContextPath()%>/sendSms",
		data : {
			receiver : $("#phone").val(),
			random : $("#random").val(),
			id : $("#id").val()
		},
		type : "post",
		success : function(result) {
			if (result == "true") {
				alert("인증번호 전송!")
			} 
			else if(result == "noReciver") {
				alert("존재하지 않는 번호 입니다!");
			}
			else if(result == "noMatch") {
				alert("입력하신 아이디와 휸대폰 번호가 일치하지 않습니다!");
			}
			else if(result == "noMember") {
				alert("존재하지 않는 회원입니다!");
			}
			else {
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
					$("#changePwPhone").removeAttr("disabled");
					}
					
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}

	
/* 아이디 확인 */
function idCheck(){
	 var query = {id : $("#id").val()};
	 
	 $.ajax({
	  url : "/Sharping/idCheck",
	  type : "post",
	  data : query,
	  dataType : "json",
	  success : function(data) {
	  
		if(data == 1){
		   alert("확인 되었습니다.");
		   idChk = true;
		   $('.in').slideToggle("slow");
		   /* $('#id').val(''); */
		   if(phoneChk == true && idChk == true){
		   $("#changePwPhone").removeAttr("disabled");
		   }
	   	} else if(data == 0){
		   alert("아이디가 존재하지 않습니다.");
		   $("#id").val('');
		   $("#id").focus();
	   	}
	  }
	 });  // ajax 끝
	};

//이메일인증	

$(function(){
	$(document).on("click","#emailBtn",function(){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/sendEmail",
			data:"email="+ $("#email").val() + "&random=" + $("#random").val() + "&idd=" +$("#id").val(),
			success : function(data){
				if(data == "false"){
					alert("존재하지 않는 이메일입니다.");
				}
				else if(data == "noMatch") {
					alert("입력하신 아이디와 이메일이 일치하지 않습니다!");
				}
				else if(data == "noMember") {
					alert("존재하지 않는 회원입니다!");
				}
				else {
				alert("사용가능한 이메일입니다. 인증번호를 입력하세요");
				}
			},
		error: function(data){
			alert("에러발생");
			return false;
		}
	})
	})
	
	$(document).on("click","#emailCheckBtn",function(){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/emailCheck",
						data : "authCode=" + $('#emailCheck').val()
								+ "&random=" + $("#random").val(),
						success : function(data) {
							alert(data);
							if (data == "complete") {
								alert("인증되었습니다.");
								$("#changePwEmail").removeAttr("disabled");
							} else if (data == "false") {
								alert("인증번호를 잘못 입력하였습니다.")
							}
						},
						error : function(data) {
							alert("에러가 발생했어요");
						}
					});
				});
	});
	
	$(document).on("click", "#e_btn", function(){
		$('.p_slide').slideUp("fast");
		$('#email').val('');
		$('#emailCheck').val('');
		$('#phone').val('');
		$('#confirmNumber').val('');
		$('#newPassword1').val('');
		$('#newPassword2').val('');
		$('.e_slide').slideToggle("slow");
		
	});
	
	$(document).on("click", "#p_btn", function(){
		$('.e_slide').slideUp("fast");
		$('#phone').val('');
		$('#confirmNumber').val('');
		$('#email').val('');
		$('#emailCheck').val('');
		$('#newPassword1').val('');
		$('#newPassword2').val('');
		$('.p_slide').slideToggle("slow");
		
	});

</script>
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

#containerBox h2 {
	text-align: center;
	padding-bottom: 10px;	
}

.blank {
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle;
}

.in{
	display:none;
	text-align: center;
}

#e_btn, #p_btn {
	width: 200px;
	height: 150px;
	font-family: 'Roboto', sans-serif;
	font-size: 18px;
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
	margin-left: 15px;
}

#e_btn:hover, #p_btn:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}
		
#b, #emailBtn, #emailCheckBtn,
#changePwEmail, #changePwPhone {
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

#b:hover, #emailBtn:hover, #emailCheckBtn:hover,
#changePwEmail:hover, #changePwPhone:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}
		
table{
	margin-top: 30px;
    border-collapse: collapse;
	width:600px;
}

table thead th {
    padding: 10px;
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
		
.e_slide{
	display:none;
}

.p_slide{
	display:none;
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
		<h2>비밀번호를 재설정 할 아이디를 입력해주세요</h2>		
			<input type="text" id="id" name="id"/>
			<input type="button" onClick="idCheck();" id="b" value="확인">
			
			<div class="in">
				<h2>비밀번호 재설정 방법을 선택해주세요</h2>
				<input type="button" class="t" id="e_btn" value="이메일">
				<input type="button" class="t" id="p_btn" value="문자 인증">
			</div>
			
	<div class="e_slide">
		<form action="changePwEmail" method="post">
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
			    		<td class="td1">이메일</td>
			    		<td class="td2">
			    			<input type="text" id="email" name="email" />
							<button type="button" class="a" id="emailBtn">발송</button>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td class="td1">인증번호</td>
			    		<td class="td2">
			    			<input type="text" id="emailCheck">
							<button type="button" class="a" id="emailCheckBtn">인증</button>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td class="td1">새 비밀번호</td>
			    		<td class="td2">
			    			<input type="password" id="newPassword1" name="newPassword">
							<input type="hidden" path="random" id="random" value="${random}" /> 
							<input type="submit" class="a" id="changePwEmail" name="changePwEmail" value="변경" disabled="true">
			    		</td>
			    	</tr>
			    </tbody>
			</table>
		</form>
	</div>
	
	<div class="p_slide">
		<form action="changePwPhone" method="post">
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
			    		<td class="td1">휴대폰번호</td>
			    		<td class="td2">
			    			<input type="text" name="phone" id="phone" />
							<button type="button" id="b" onclick="sendSms();">전송</button>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td class="td1">인증번호</td>
			    		<td class="td2">
			    			<input type="text" name="confirmNumber" id="confirmNumber" />
							<button type="button" id="b" onclick="phoneCheck();">인증</button>
							<input type="hidden" path="random" id="random" value="${random }"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td class="td1">새 비밀번호</td>
			    		<td class="td2">
			    			<input type="password" id="newPassword2" name="newPassword">
							<input type="submit" class="a" value="변경" id="changePwPhone" name="changePwPhone" disabled="true">
			    		</td>
			    	</tr>
			    </tbody>
			</table>
		</form>
	</div>
				
					
		</div>
		<span class="blank"></span>
	</section>


</body>
</html>