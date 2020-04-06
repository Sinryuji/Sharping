<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SearchId</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
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
				
					$("#searchIdPhone").removeAttr("disabled");
					
				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}
	
//이메일인증	

$(function(){
	$(document).on("click","#emailBtn",function(){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/sendEmail",
			data:"email="+ $("#email").val() + "&random=" + $("#random").val(),
			success : function(data){
				if(data == false){
					alert("존재하지 않는 이메일입니다.")
				} else {
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
							$("#searchIdEmail").removeAttr("disabled");
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
		$('.e_slide').slideToggle("slow");
		
	});
	
	$(document).on("click", "#p_btn", function(){
		$('.e_slide').slideUp("fast");
		$('#phone').val('');
		$('#confirmNumber').val('');
		$('#email').val('');
		$('#emailCheck').val('');
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
			margin-top: 150px;
		}
		
		.in{
			position: absolute;
			left:38.5%;
			top:35%;
		}
		
		table{
		    border-collapse: collapse;
		    line-height: 1.5;
			width:600px;
			margin-left:680px;
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
		/* value에 문자열이 2~3글자 정도인 버튼 */
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
		
</style>
</head>
<body>
	
	<div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div>
	<br><br>
	<div class="reg">
		<h2>아이디 찾기 방법을 선택해주세요</h2>
		<div class="in">
			<input type="button" class="t" id="e_btn" value="이메일">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="t" id="p_btn" value="문자 인증">
		</div>
	</div>
	<div class="e_slide">
		<form action="searchIdEmail" method="get">
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
			    			<input type="text" id="email" name="email" placeholder="회원가입시 입력한 이메일"/>
							<button type="button" class="a" id="emailBtn">이메일발송</button>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td class="td1">인증번호</td>
			    		<td class="td2">
			    			<input type="text" id="emailCheck" placeholder="인증번호입력">
							<button type="button" class="a" id="emailCheckBtn">이메일인증</button>
			    		</td>
			    	</tr>
			    </tbody>
			</table>
			<input type="hidden" path="random" id="random" value="${random}"/>
			<br>
			<div class="btn">
				<input type="submit" id="searchIdEmail" class="b" name="searchIdEmail" value="찾기" disabled="true">
			</div>
		</form>
	</div>
	<div class="p_slide">
		<form action="searchIdPhone" method="get">
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
							<button type="button" class="b" onclick="sendSms();">전송</button>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td class="td1">인증번호</td>
			    		<td class="td2">
			    			<input type="text" name="confirmNumber" id="confirmNumber" />
							<button type="button" class="b" onclick="phoneCheck();">인증</button>
			    		</td>
			    	</tr>
			    </tbody>
			</table>
			<input type="hidden" path="random" id="random" value="${random }"/>
			<br>
			<div class="btn">
				<input type="submit" id="searchIdPhone" class="b" name="searchIdPhone" value="찾기" disabled="true">
			</div>
		</form>
	</div>

<%-- 	<form action="searchIdEmail" method="get">
		<input type="text" id="email" name="email" placeholder="이메일을 입력하세요"/>
		<button type="button" id="emailBtn">이메일발송</button>
		<input type="text" id="emailCheck" placeholder="인증번호입력">
		<button type="button" id="emailCheckBtn">이메일인증</button>
		<input type="hidden" path="random" id="random" value="${random}"/>
		<input type="submit" id="searchIdEmail" name="searchIdEmail" value="찾기" disabled="true">
	</form> --%>

	<%-- <form action="searchIdPhone" method="get">
		휴대폰번호:<input type="text" name="phone" id="phone" />
		<button type="button" onclick="sendSms();">전송</button><br> 
		인증번호:<input type="text" name="confirmNumber" id="confirmNumber" />
		<button type="button" onclick="phoneCheck();">인증</button><br>
		<input type="hidden" path="random" id="random" value="${random }"/>
		<input type="submit" id="searchIdPhone" name="searchIdPhone" value="찾기" disabled="true">
	</form> --%>
	
</body>
</html>