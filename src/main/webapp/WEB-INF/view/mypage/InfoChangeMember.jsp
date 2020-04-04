<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InfoChangeMember</title>
<script>
function openPop(){
    
    var pop_title = "팝~" ;
    var option = "width = 500, height = 500, top = 100, left = 200"; 
    var win = window.open("", pop_title , option) ;
     
    var changePw = document.changePw ;
    changePw.target = pop_title ;
    changePw.action = "infoChangePw" ;
     
    changePw.submit() ;
}

</script>
<!-- 카카오 주소 찾기 api -->
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					$("#newPost").val(data.zonecode);
					$("#newAddress").val(data.address);
					$("#newAddressEtc").focus();
					console.log(data);
				}
			}).open();
		}
	</script>
	<style>
		table{
		    border-collapse: collapse;
		    line-height: 1.5;
			width:700px;
			margin:auto;
		}
		.main{
			margin-top:120px;
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
			margin-left:820px;;
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
   	  	.td2 #name{
   	  		background:white;
   	  		border:0;
   	  		color: black;
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

	<form name="changePw" id="changePw" method="post">
		<table class="main">
			<colgroup>
				<col style="width:40%;" />
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
					<td class="td2"><input type="text" name="name" id="name" value="${authInfo.name}" disabled="disabled" ></td>
				</tr>
				<tr>
					<td class="td1">아이디</td>
					<td class="td2"><input type="text" name="id"  id="id" value="${authInfo.id}" readonly/></td>
				</tr>
				<tr>
					<td class="td1">비밀번호</td>
					<td class="td2"><input type="text" name="password" id="pw1" /></td>
				</tr>
				<tr>
					<td class="td1">새 비밀번호</td>
					<td class="td2"><input type="text" name="newPassword" id="pw2" /></td>
				</tr>
				<tr>
					<td class="td1">비밀번호 확인</td>
					<td class="td2">
						<input type="text" name="passwordCheck" id="pwc" />
						<input type="button" class="b" onclick="openPop();" value="변경">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
		
	<form action="infoChangeMemberComplete" method="post">
		<table>
			<colgroup>
				<col style="width:40%;" />
	         	<col style="width:auto;" />
			</colgroup>
			<tbody>
				<tr>
					<td class="td1">휴대폰 번호</td>
					<td class="td2"><input type="text" name="newPhone" id="newPhone" value="${authInfo.phone}" required/></td>
				</tr>
				<tr>
					<td class="td1">이메일</td>
					<td class="td2"><input type="text" name="newEmail" id="newEmail" value="${authInfo.email}" required/></td>
				</tr>
				<tr>
					<td class="td1">아이디</td>
					<td class="td2"><input type="text" name="id"  id="id" value="${authInfo.id}"/></td>
				</tr>
				<tr>
					<td class="td1">주소</td>
					<td class="td2">
						<input type="text" name="newPost" id="newPost" value="${member.post}" readonly required/>&nbsp;
						<input type="button" class="a" onClick="openDaumZipAddress();" value = "주소 찾기" /><br>
						<input type="text" name="newAddress" id="newAddress" value="${member.address}" readonly required/>&nbsp;
						<input type="text" name="newAddressEtc" id="newAddressEtc" value="${member.addressEtc}" placeholder="상세주소를 입력해주세요." required>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
			<input type="submit" class="submit" value="수정">&nbsp;&nbsp;
			<input type="button" class="b" onclick="javascript:history.back();" value="취소">&nbsp;&nbsp;
			<input type="button" class="a" onclick="location.href='${pageContext.request.contextPath}/infoDelete'" value="회원탈퇴">
	</form>
</body>
</html>