<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangePw</title>
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
		   $('#id').val('');
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
			data:"email="+ $("#email").val() + "&random=" + $("#random").val(),
			success : function(data){
				if(data == false){
					alert("존재하지 않는 이메일입니다.");
				}
				alert("사용가능한 이메일입니다. 인증번호를 입력하세요");
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
		#mm {
    		 text-align: center;
 			 margin: 0 910px;
    	}
    	
    	body{
   	  		background-image:url('https://images.pexels.com/photos/1470589/pexels-photo-1470589.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');
   	  		overflow:hidden;
   	  	}
   	  	
   	  	a{
   	  		text-decoration:none;
   	  		color:black;
   	  	}
   	  	
   	  	h1{
   	  		display:inline;
   	  	}
   	  	
   	  	._id{
   	  		text-align:center;
   	  		margin-left:100px;
   	  	}
   	  	
   	  	#id{
   	  		border:0;
   	  		outline:0;
   	  	}
   	  	
   	  	.t {
		    width: 200px;
		    height: 100px;
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
		}

		.t:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		.reg{
			text-align: center;
			/* background: white; */
			margin: 0 650px;;
			width: 600px;
			height: 300px;
			/* background-color: rgba( 255, 255, 255, 0.6 ); */
			margin-top: 55px;
		}
		
		.in{
			position: absolute;
			left:38.5%;
			top:35%;
			display:none;
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
		
		/* value에 문자열이 5~6글자 정도인 버튼 */
		.a {
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

		.a:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		table{
		    border-collapse: collapse;
		    line-height: 1.5;
			width:600px;
			margin-left:680px;
			margin-top:100px;
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
		
		.btn{
			text-align:center;
			margin-left: 50px;
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

	<div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div>
	<br><br>
	<div class="reg">
		<h2>비밀번호를 재설정 할 아이디를 입력해주세요</h2>
		<input type="text" id="id" name="id"/>&nbsp&nbsp&nbsp<input type="button" onClick="idCheck();"  class="b" value="확인">
		<div class="in">
		<h2>비밀번호 재설정 방법을 선택해주세요</h2>
			<input type="button" class="t" id="e_btn" value="이메일">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="t" id="p_btn" value="문자 인증">
		</div>
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
			    			<input type="text" id="email" name="email" placeholder="이메일을 입력하세요" />
							<button type="button" class="a" id="emailBtn">발송</button>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td class="td1">인증번호</td>
			    		<td class="td2">
			    			<input type="text" id="emailCheck" placeholder="인증번호입력">
							<button type="button" class="a" id="emailCheckBtn">인증</button>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td class="td1">새 비밀번호</td>
			    		<td class="td2">
			    			<input type="password" id="newPassword1" name="newPassword">
							<input type="hidden" path="random" id="random" value="${random}" /> 
							<input type="submit" class="a" id="changePwEmail" name="changePwEmail" value="변경" disabled="ture">
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
							<button type="button" class="a" onclick="sendSms();">전송</button>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td class="td1">인증번호</td>
			    		<td class="td2">
			    			<input type="text" name="confirmNumber" id="confirmNumber" />
							<button type="button" class="a" onclick="phoneCheck();">인증</button>
							<input type="hidden" path="random" id="random" value="${random }"/>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td class="td1">새 비밀번호</td>
			    		<td class="td2">
			    			<input type="password" id="newPassword2" name="newPassword">
							<input type="submit" class="a" value="변경" id="changePwPhone" name="changePwPhone" disabled="ture">
			    		</td>
			    	</tr>
			    </tbody>
			</table>
		</form>
	</div>
	

<%-- <h1> 비밀번호 재설정 하고자 하는 아이디를 입력해주세요</h1>

<br>
아이디 : <input type="text" id="id" name="id"/>&nbsp&nbsp&nbsp<input type="button" onClick="idCheck();" value="확인">
<br>

<h1> 비밀번호 재설정 방법을 선택해주세요</h1>

<br>
<br>

<h1>가입시 입력한 이메일로 비밀번호 재설정</h1>
	<form action="changePwEmail" method="post">

		<input type="text" id="email" name="email" placeholder="이메일을 입력하세요" />
		<button type="button" id="emailBtn">이메일발송</button>
		<input type="text" id="emailCheck" placeholder="인증번호입력">
		<button type="button" id="emailCheckBtn">이메일인증</button>
		<br> 새 비밀번호:<input type="text" name="newPassword">
		<input type="hidden" path="random" id="random" value="${random}" /> <input
			type="submit" id="changePwEmail" name="changePwEmail" value="이메일로변경하기" disabled="ture">
	</form>
<br>
<br>
<h1>문자 인증으로 비밀번호 재설정</h1>
<form action="changePwPhone" method="post">
	휴대폰번호:<input type="text" name="phone" id="phone" />
	<button type="button" onclick="sendSms();">전송</button><br> 
	인증번호:<input type="text" name="confirmNumber" id="confirmNumber" />
	<button type="button" onclick="phoneCheck();">인증</button><br>
	<input type="hidden" path="random" id="random" value="${random }"/>
	새 비밀번호:<input type="text" name="newPassword">
	<input type="submit" value="폰번호로 변경하기!" id="changePwPhone" name="changePwPhone" disabled="ture">
</form> --%>

</body>
</html>