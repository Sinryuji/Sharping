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
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>RegistSeller</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />

<script>

function popObj(){
    
    var pop_title = "popObj" ;
    var option = "width = 500, height = 500, top = 100, left = 200"; 
    var popObj = window.open("phoneCheck", pop_title , option) ;
}

function sendSms() {
	$.ajax({
		url : "<%=request.getContextPath()%>/sendSms",
		data : {
			receiver : $("#newPhone").val()
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

function phoneCheck() {
	$.ajax({
		url : "<%=request.getContextPath()%>/smsCheck",
			type : "post",
			data : {
				code : $("#confirmNumber").val()
			},
			success : function(result) {
				if (result == "ok") {
					alert("번호 인증 성공");

					$("#submit").removeAttr("disabled");

				} else {
					alert("번호 인증 실패");
				}
			}
		});
	}
</script>
<script>
	function openPop() {

		var pop_title = "팝~";
		var option = "width = 500, height = 500, top = 100, left = 200";
		var win = window.open("", pop_title, option);

		var changePw = document.changePw;
		changePw.target = pop_title;
		changePw.action = "infoChangePw";

		changePw.submit();
	}
</script>
<!-- 카카오 주소 찾기 api -->
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#newPost").val(data.zonecode);
				$("#newAddress").val(data.address);
				$("#newAddressEtc").focus();
				console.log(data);
			}
		}).open();
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

.blank {
	display: inline-block;
	width: 0;
	height: 100%;
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

.td2 #name {
	background: white;
	border: 0;
	color: black
}

.submit{
	margin-top:20px;;
}

#update, #updatePhone, #adress, #submit, 
#cancel, #delete {
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

#update:hover, #updatePhone:hover, #adress:hover, #submit:hover,
#cancel:hover, #delete:hover {
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
			<form name="changePw" id="changePw" method="post">
				<table>
					<colgroup>
						<col style="width: 40%;" />
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
							<td class="td2"><input type="text" name="name" id="name" value="${authInfo.name}" disabled="disabled"></td>
						</tr>
						<tr>
							<td class="td1">아이디</td>
							<td class="td2"><input type="text" name="id" id="id" value="${authInfo.id}" readonly /></td>
						</tr>
						<tr>
							<td class="td1">기존 비밀번호</td>
							<td class="td2"><input type="password" name="password" id="pw1" required /></td>
						</tr>
						<tr>
							<td class="td1">새 비밀번호</td>
							<td class="td2"><input type="password" name="newPassword" id="pw2" required /></td>
						</tr>
						<tr>
							<td class="td1">새 비밀번호 확인</td>
							<td class="td2"><input type="password" name="passwordCheck" id="pwc" required /> 
							<input type="button" id="update" class="b" onclick="openPop();" value="변경"></td>
						</tr>
					</tbody>
				</table>
			</form>
			<form action="infoChangeSellerComplete" method="post">
				<table>
					<colgroup>
						<col style="width: 40%;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<td class="td1">휴대폰 번호</td>
							<td class="td2"><input type="text" name="newPhone" id="phone" value="${authInfo.phone}" readonly />
								<button type="button" id="updatePhone" onclick="popObj();">변경</button>
							</td>
							<td><input type="hidden" name="id" value="${authInfo.id}"></td>
						</tr>
						<tr>
							<td class="td1">이메일</td>
							<td class="td2"><input type="text" name="newEmail" value="${authInfo.email}" required /></td>
						</tr>
						<tr>
							<td class="td1">스토어 이름</td>
							<td class="td2"><input type="text" name="newStoreName" value="${seller.storeName }" required /></td>
						</tr>
						<tr>
							<td class="td1">스토어 주소</td>
							<td class="td2"><input type="text" name="newStoreAddress" value="${seller.storeAddress }" required /></td>
						</tr>
						<tr>
							<td class="td1">스토어 소개글</td>
							<td class="td2"><input type="text" name="newStoreText" value="${seller.storeText }" /></td>
						</tr>
						<tr>
							<td class="td1">주소</td>
							<td class="td2"><input type="text" name="newPost" id="newPost" value="${member.post}" readonly required />
							<input type="button" id="adress" class="a" onClick="openDaumZipAddress();" value="주소 찾기" />
							<input type="text" name="newAddress" id="newAddress" style="margin-top:10px;margin-bottom:10px; width:250px;" value="${member.address}" readonly required />
							<input type="text" name="newAddressEtc" id="newAddressEtc" value="${member.addressEtc}" placeholder="상세주소를 입력해주세요." required></td>
						</tr>
						<tr>
							<td class="td1">계좌번호</td>
							<td class="td2"><input type="text" name="newBankAccount" value="${seller.bankAccount }" /></td>
						</tr>
						<tr>
							<td class="td1">은행코드</td>
							<td class="td2"><input type="number" name="newBankCode" value="${seller.bankCode }" /></td>
						</tr>
					</tbody>
				</table>
				<div>
			<input type="submit" id="submit" class="submit" value="수정">&nbsp;
			<input type="button" id="cancel" class="b" onclick="javascript:history.back();" value="취소">&nbsp;
			<input type="button" id="delete" class="a" onclick="location.href='${pageContext.request.contextPath}/infoDelete'" value="회원탈퇴">				</div>
			</form>
		</div>
	</section>



</body>
</html>