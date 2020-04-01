<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<form action="registCompleteMember" method="post"> 
이름 : <input type="text" name="name" id="name" required><br><br>
아이디 : <input type="text" id="id" name="id" required/>&nbsp&nbsp&nbsp<button class="idCheck" type="button">중복확인</button><br><br>
비밀번호 : <input type="password" name="password" id="pw" required/><span id="pwChk1"></span><br><br>
비밀번호 재입력 : <input type="password" name="passwordCheck" id="pwc" required/><span id="pwChk2"></span>
<span id="yes">O</span><br><br>
휴대폰번호 : <input type="text" name="phone" id="ph" required/><br><br>
이메일 : <input type="text" name="email" id="email" required/><br><br>
우편번호:<input type="text" name="post" id="post" readonly /> &nbsp;
주소:<input type="text" name="address" id="address" readonly /> &nbsp;
상세주소:<input type="text" name="addressEtc" id="adressEtc"> &nbsp; <input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /> <br> 
<input type="submit" class="submit" disabled="disabled" value="회원가입하기"><br><br>
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


/* $(".submit").click(function(){

	 	if($("#name").val() == ""){
		   alert("이름을 입력해주세요.");
		   $("#name").focus();
	   	}else if($("#id").val() == ""){
			alert("아이디를 입력해주세요.");
			$("#id").focus();
		}else if($("#pw").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
		}else if($("#pwc").val() == ""){
			alert("비밀번호 재입력을 입력해주세요.");
			$("#pwc").focus();
		}else if($("#ph").val() == ""){
			alert("휴대폰 번호를 입력해주세요.");
			$("#ph").focus();
		}else if($("#email").val() == ""){
			alert("이메일을 입력해주세요.");
			$("#email").focus();
		}else if($("#post").val() == ""){
			alert("주소 찾기를 통해 주소를 선택 해주세요.");
			$("#address").focus(); 
		}else if($("#adressEtc").val() == ""){
			alert("상세주소를 입력해주세요.");
			$("#adressEtc").focus(); 
		}			
	  }); */
	  
	  
$('input').change(function(){
	 if($("#name").val() != "" && 
			 $("#id").val() != "" && 
			 $("#pw").val() != "" && 
			 $("#ph").val() != "" && 
			 $("#email").val() != "" 
			 && $("#post").val() != "" 
			 && $("#adressEtc").val() != ""){
		 $(".submit").removeAttr("disabled");
	 }
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