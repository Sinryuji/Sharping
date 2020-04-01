<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>RegistSeller</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous">
</script>
<!-- 문자 인증 -->
<script>

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
					}
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}


function idCheck(){

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
	   	} else if(data == 0){
		   alert("사용가능한 아이디입니다.");
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

</script>
<!-- 카카오 주소 찾기 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	</style>
</head>
<body>
	<div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div>
	<form action="registCompleteSeller" method="post">
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
				<td class="td1">이름</td>
				<td class="td2">
					<input type="text" name="name" id="name" required>
				</td>
	        </tr>
	        <tr>
				<td class="td1">아이디</td>
				<td class="td2">
					<input type="text" id="id" name="id" required/>&nbsp&nbsp&nbsp
					<input type="button" class="idCheck" onClick="idCheck();" value="중복확인">
				</td>
	        </tr>
	        <tr>
				<td class="td1">비밀번호</td>
				<td class="td2">
					<input type="password" name="password" id="pw" required/>
					<span id="pwChk1"></span>
				</td>
	        </tr>
	        <tr>
				<td class="td1">비밀번호 재입력</td>
				<td class="td2">
					<input type="password" name="passwordCheck" id="pwc" required/>
					<span id="pwChk2"></span>
					<span id="yes">O</span>
				</td>
	        </tr>
	        <tr>
				<td class="td1">휴대폰 번호</td>
				<td class="td2">
					<input type="text" name="phone" id="ph" required/>
					<button type="button" onclick="sendSms();">전송</button>
				</td>
	        </tr>
	        <tr>
				<td class="td1">인증 번호</td>
				<td class="td2">
					<input type="text" name="confirmNumber" id="confirmNumber" required/>
					<button type="button" onclick="phoneCheck();">인증</button> 
					<input type="hidden" path="random" id="random" value="${random }"/>
				</td>
	        </tr>
	        <tr>
				<td class="td1">이메일</td>
				<td class="td2">
					<input type="email" name="email" id="email" required/>
				</td>
	        </tr>
	        <tr>
				<td class="td1">스토어 이름</td>
				<td class="td2">
					<input type="text" name="storeName" id="storeName" required/>
				</td>
	        </tr>
	        <tr>
				<td class="td1">스토어 주소</td>
				<td class="td2">
					<input type="text" name="storeAddress" id="storeAddress" required/>
				</td>
	        </tr>
	        <tr>
				<td class="td1">스토어 소개글</td>
				<td class="td2">
					<input type="text" name="storeText" id="storeText" />
				</td>
	        </tr>
	        <tr>
				<td class="td1">주소</td>
				<td class="td2">
					<input type="text" name="post" id="post" readonly required/>&nbsp;
					<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /><br>
					<input type="text" name="address" id="address" readonly required/>&nbsp;
					<input type="text" name="addressEtc" id="adressEtc" placeholder="상세주소를 입력해주세요." required>
				</td>
	        </tr>
	        <tr>
				<td class="td1">계좌번호</td>
				<td class="td2">
					<input type="text" name="bankAccount" id="bankAccount" required/>
				</td>
	        </tr>
	        <tr>
				<td class="td1">은행코드</td>
				<td class="td2">
					<input type="number" name="bankCode" id="bankCode" required/>
				</td>
	        </tr>
	      </tbody>
	   </table>
	   <br><input type="submit" class="submit" name="regist" id="regist" value="회원가입하기">
	   &nbsp;&nbsp;<input type="button" value="취소" onclick="location.href = '<c:url value='/main'/>'">
	</form>



</body>
</html>