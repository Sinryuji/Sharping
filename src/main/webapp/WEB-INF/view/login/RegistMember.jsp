<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>RegistMember</title>
<!-- 카카오 주소 찾기 api -->
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
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
			$(document).click();
		}
	</script>
	
	<style>
		table{
		    border-collapse: collapse;
		    line-height: 1.5;
			width:600px;
			margin:auto;
			margin-top:160px;
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
			margin-left:850px;;
		}
		
		#mm {
    		text-align: center;
 			margin: 0 910px;
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
		
		.idCheck {
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

		.idCheck:hover {
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
<form action="registCompleteMember" method="post">
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
					<button class="idCheck" type="button">중복확인</button>
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
				</td>
	        </tr>
	        <tr>
				<td class="td1">이메일</td>
				<td class="td2">
					<input type="email" name="email" id="email" required/>
				</td>
	        </tr>
	        <tr>
				<td class="td1">주소</td>
				<td class="td2">
					<input type="text" name="post" id="post" readonly required/>&nbsp;
					<input type="button" class="a" onClick="openDaumZipAddress();" value = "주소 찾기" /><br>
					<input type="text" name="address" id="address" readonly required/>&nbsp;
					<input type="text" name="addressEtc" id="adressEtc" placeholder="상세주소를 입력해주세요." required>
				</td>
	        </tr>
	      </tbody>
	   </table>
	<br><br><input type="submit" class="submit" class="a" value="회원가입">
	&nbsp;&nbsp;<input type="button" value="취소" class="b" onclick="location.href = '<c:url value='/main'/>'">		   
</form>
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
});
</script>
</body>
</html>