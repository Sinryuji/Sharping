<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- jquery -->
<script src="//code.jquery.com/jquery.min.js"></script>


<title>NoticeManage</title>

<link rel='stylesheet'
	href='${pageContext.request.contextPath}/asset/css/bootstrap.css'>

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

<script type="text/javascript">
	function registerAdmin() {
		// window.name = "부모창 이름";            
		window.name = "AdminPage";

		// window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
		window
				.open("registerAdmin", "새관리자등록",
						"width = 500, height = 320, resizable = no, scrollbars = no, status = no");
	}
</script>


<style>

html {
	height: 100%;
}

body {
	background-image: url('${pageContext.request.contextPath}/resources/images/신세경1.jpg');
	background-size: cover;
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
	height: 100%;
}

.wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 190px; /* footer height */
}

ul {
	padding: 0;
	margin: 0;
	list-style: none;
	 
}

div#root {
	width: 90%;
	margin: 0 auto;
}

.navbar-nav {
    width: 100%;
    text-align: center;
}

.navbar-nav > li {
    float: none;
    display: inline-block;
}

.navbar-nav > li.navbar-right {
    float: right !important;
} 

section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

div#containerBox {
	float: right;
	width: calc(100% - 200px - 20px);
}

div#containerWrite {
	float: right;
	width: calc(100% - 200px - 20px);
	padding-bottom: 10px;
}

aside {
	float: left;
	width: 200px;
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
}

footer#footer {
	background: #e7e7e7;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	height:190px;
	padding: 7px 0;
	text-align: center;
}

footer#footer div {
	display: inline-block;
	margin-right: 10px;
}


.switch {
	position: absolute;
	display: inline-block;
	width: 60px;
	height: 34px;
	vertical-align: middle;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

button#btnWrite {
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

button#btnWrite:hover {
     background-color: #FFB2F5;
     box-shadow: 0px 15px 20px hotpink;
     color: #fff;
     transform: translateY(-7px);
}
	
</style>

</head>
<body>

<div class="wrap">
	<nav class="navbar navbar-default">
		<div id="navBox">
			<%@ include file="../include/AdminNav.jsp"%>
		</div>
	</nav>

	<article>
		<section id="container">
			<aside>
				<%@ include file="../include/AdminAside.jsp"%>
			</aside>
			
			<div id="containerBox">
				<h4>공지사항 관리</h4>
			</div>
			
			<div id="containerWrite">
				<button type="button"  id="btnWrite">글쓰기</button>
			</div>

					<table class="infoNotice">
						<thead>
							<tr>
								<th>No.</th>
								<th>작성관리자</th>
								<th>제목</th>
								<th>작성날짜</th>
								<th>게시여부</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty noticeList }">
									<tr>
										<td colspan="5" align="center"><b>검색결과가 없습니다.</b></td>
									</tr>
								</c:when>
								<c:when test="${!empty noticeList}">
									<c:forEach var="list" items="${noticeList}">
										<tr>
											<td><c:out value="${list.noticeNum}" /></td>
											<td><c:out value="${list.adminId}" /></td>
											<td><a href="javascript:void(0);"
												onClick="javascript:noticeView('<c:out value="${list.noticeNum}"/>')">
													<c:out value="${list.noticeSubject}" />
											</a></td>

											<td><c:out value="${list.noticeDate}" /></td>
											<td><label class="switch"> <input type="hidden"
													id="noticePost${status.index}" value="${status.index}">
													<input type="checkbox" class="display"
													id="chk${list.noticeNum}"
													data-noticeNum="${list.noticeNum}"
													${list.noticePost == "TRUE" ? "checked" : ""}> <span
													class="slider round"></span>
											</label></td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
		</section>
	</article>


	<footer id="footer">
		<div id=footerBox>
			<%@ include file="../include/Footer.jsp"%>
		</div>
	</footer>

</div>

	<script>
	
	$(document).on('click', '#btnWrite', function(){
		location.href="${pageContext.request.contextPath}/admin/writeNotice"
	});
	
	
	function noticeView(noticeNum){
		window.name="NoticeManage";
		
		var popup = window.open("noticeContent" + "?noticeNum=" + noticeNum, "공지사항내용", 
				"width = 450, height = 350, resizable = no, scrollbars = no, status = no");
		
    	var timer = setInterval(function(){
	        if(popup.closed) {
				clearInterval(timer);
				window.location.reload();
				
	        } 
	    },300)
		
	}
	
	$(function(){
		if(document.getElementsByClassName("display").checked == true){
			document.getElementsByClassName("display").value = 'TRUE';
		} else {
			document.getElementsByClassName("display").value = 'FALSE';
		}					
	});
	
  	$(".display").click(function(){
  		var num = $(this).attr("data-noticeNum");
 		var chkk = 'chk' + $(this).attr("data-noticeNum");
 		var c = '#chk' + $(this).attr("data-noticeNum");
		if($(this).is(":checked")){
			document.getElementById(chkk).value = 'TRUE';
		} else {
			document.getElementById(chkk).value = 'FALSE';
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/admin/updateNoticePost",
				type : "post",
				data : {
					noticeNum : num,
					noticePost : $(c).val(),
				},
				success : function(data) {

				}
			});
		});
	</script>




	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/masonry.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/asset/js/bootstrap.js"></script>
</body>
</html>