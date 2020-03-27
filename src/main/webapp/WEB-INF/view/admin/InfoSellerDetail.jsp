<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>InfoDetail</title>
</head>
<body>



	<span id="id">아이디 : <b>${seller.id}</b></span>
	<br>
	<span id="name">이름 : ${member.name}</span>
	<br>
	<span id="phone">전화번호 : ${member.phone}</span>
	<br>
	<span id="email">이메일 : ${member.email}</span>
	<br>
	<span id="regDate">가입날짜 : ${member.regDate}</span>
	<br>
	<span id="post">우편번호 : ${member.post}</span>
	<br>
	<span id="address">주소 : ${member.address}</span>
	<br>
	<span id="addressEtc">상세주소 : ${member.addressEtc}</span>
	<br>
	<br>
	<span id="storeName">스토어이름 : ${seller.storeName}</span>
	<br>
	<span id="storeAddress">스토어주소 : ${seller.storeAddress}</span>
	<br>
	<span id="storeText">스토어소개글 : ${seller.storeText}</span>
	<br>
	<span id="sellerGrade">회원등급 : <c:if test="${seller.sellerGrade == 1}">
									<c:out value="일반회원" />
									</c:if> 
									<c:if test="${seller.sellerGrade == 2}">
									<c:out value="보통회원" />
									</c:if> 
									<c:if test="${seller.sellerGrade == 3}">
									<c:out value="VIP회원" />
									</c:if></span>
	<br>
	<span id="bankCode">은행코드 : ${seller.bankCode}</span>
	<br>
	<span id="bankAccount">계좌번호 : ${seller.bankAccount}</span>
	<br>

		<form>
			<input type="button" value="삭제하기" id="fake">
			<input type="button" value="권한회수하기" id="privileges">
			<input type="button" value="닫기" onclick="window.close()">
			<input type="hidden" id="adp" value=""/>
			<input type="hidden" value="${member.id}" name="id">
		</form>

<script>

	$("#fake").click(function(){
		$(this).attr("disabled", "disabled");
		window.name = "InfoSellerDetail";
		var popup = window.open("adminPw","관리자 비밀번호 확인" ,"width = 520, height = 250");
		
		var timer = setInterval(function(){
			
			if(popup.closed) {
				clearInterval(timer);
				if($("#adp").val() == ''){
					$("#fake").attr("disabled", true);
				}	
				else {
					$("#fake").attr("disabled", false);
					$("#fake").after('<input type="submit" value="삭제" id="delPro" formaction="deleteMember">');
			 		$("#fake").remove(); 
				}
				$("#delPro").click(function(){
		
					var delConf = confirm("회원정보를 삭제하겠습니다. 진행하시겠습니까?");	
					if(delConf == true){
							window.close();
							return true;
					}else if(delConf == false){		
							window.close();
							return false;
					}	
				});
			}
		}, 300)

	});
	
	$("#privileges").click(function(){
		$(this).attr("disabled", "disabled");
		window.name = "InfoSellerDetail";
		var popup = window.open("adminPw","관리자 비밀번호 확인" ,"width = 520, height = 250");
		
		var timer = setInterval(function(){
			
			if(popup.closed) {
				clearInterval(timer);
				if($("#adp").val() == ''){
					$("#privileges").attr("disabled", true);
				}	
				else {
					$("#privileges").attr("disabled", false);
					$("#privileges").after('<input type="submit" value="권한회수" id="delPro" formaction="deleteSeller">');
			 		$("#privileges").remove(); 
				}
				$("#delPro").click(function(){
		
					var delConf = confirm("판매자 권환을 회수하겠습니다. 진행하시겠습니까?");	
					if(delConf == true){
							window.close();
							return true;
					}else if(delConf == false){		
							window.close();
							return false;
					}	
				});
			}
		}, 300)

	});
		
		
</script>




</body>
</html>