<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>RegisterAdmin</title>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/woocommerce-layout.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/woocommerce-smallscreen.css'
	type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/woocommerce.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/font-awesome.min.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/styleSB.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/easy-responsive-shortcodes.css'
	type='text/css' media='all' />

<style>
#container {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	text-align: center
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

.admin {
	padding-bottom: 10px;
}

#submit, #cancel, .adminIdCheck {
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

#submit:hover, #cancel:hover, .adminIdCheck:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}
</style>

</head>
<body>

	<article>
		<section id="container">
			<div id="containerBox">
				<h3>새 관리자 등록</h3>
				<form action="registerCompleteAdmin" method="post" target="AdminPage">
					<div class="admin">
						<label for="adminId">아이디</label>
						<input type="text" id="adminId" name="adminId" required />
						<button class="adminIdCheck" type="button" style="width:100px;">중복확인</button>
					</div>
					<div class="admin">
						<label for="adminPassword">비밀번호</label>
						<input type="password" id="adminPassword" name="adminPassword" required />
					</div>
					<div class="admin">
						<label for="adminPasswordCheck">비밀번호 재입력</label>
						<input type="password" id="adminPasswordCheck" name="adminPasswordCheck" required />
					</div>
					
					<input type="submit" class="submit" id="submit" disabled="disabled" value="등록하기"> 
					<input type="button" id="cancel" value="창 닫기" onclick="window.close()">
				</form>
			</div>
			<span class="blank"></span>
		</section>
	</article>

	<script>
		$(".submit").click(function() {

			if ($("#adminId").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#adminId").focus();
			} else if ($("#adminPassword").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#adminPassword").focus();
			} else if ($("#adminPasswordCheck").val() == "") {
				alert("비밀번호 재입력을 입력해주세요.");
				$("#adminPasswordCheck").focus();
			} else {
				alert("새 관리자가 등록되었습니다!")
				window.close();
			}
		});

		$(".adminIdCheck").click(function() {

			var query = {
				adminId : $("#adminId").val()
			};

			$.ajax({
				url : "/Sharping/adminIdCheck",
				type : "post",
				data : query,
				dataType : "json",
				success : function(data) {

					if (data == 1) {
						alert("중복된 아이디입니다.");
						$(".submit").attr("disabled", "disabled");
						$("#adminId").val('');
						$("#adminId").focus();
					} else if (data == 0) {
						alert("사용가능한 아이디입니다.");
						$(".submit").removeAttr("disabled");
					}
				}
			}); // ajax 끝
		});
	</script>
</body>
</html>