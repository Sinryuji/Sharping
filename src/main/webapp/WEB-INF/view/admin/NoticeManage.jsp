<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  
<meta charset="UTF-8">
<!-- jquery -->
<script src="//code.jquery.com/jquery.min.js"></script>

<title>NoticeManage</title>

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
	href='${pageContext.request.contextPath}/resources/css/style.css'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/easy-responsive-shortcodes.css'
	type='text/css' media='all' />

  <style>

	body {
		font-family: '맑은 고딕', verdana;
		padding: 0;
		margin: 0;
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
	
	header#header {
		font-size: 60px;
		padding: 20px 0;
		text-shadow: black 0.2em 0.2em 0.2em;
		color: white;
	}
	
	header#header h1 a {
		color: #000;
		font-weight: bold;
	}
	
	nav#nav {
		padding: 10px;
		text-align: right;
	}
	
	nav#nav ul li a {
		display: inline-block;
		margin-bottom: 10px;
	}
	
	section#container {
		padding: 20px 0;
		border-top: 2px solid #eee;
		border-bottom: 2px solid #eee;
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
	
	div#containerBox button {
		margin-left: 250px;
		margin-top: 10px;
		margin-bottom: 10px;
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
		background: #999999; /* f9f9f9 */
		position: realtive;
		left: 0;
		bottom: 0;
		width: 100%;
		padding: 7px 0;
		text-align: center;
	}
	
	footer#footer div {
		display: inline-block;
		margin-right: 10px;
	}
	
	.switch {
  		position: relative;
		display: inline-block;
		width: 60px;
		height: 34px;
		vertical-align:middle;
	}

	/* Hide default HTML checkbox */
	.switch input {display:none;}
	
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
	
	input:checked + .slider {
	  background-color: #2196F3;
	}
	
	input:focus + .slider {
	  box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked + .slider:before {
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

</style>	
    
</head>
<body>

	<header id="header">
		<div id="beaderBox">
			<%@ include file="../include/AdminHeader.jsp"%>
		</div>
	</header>
	
	<nav id="nav">
		<div id="navBox">
			<%@ include file="../include/AdminNav.jsp"%>
		</div>
	</nav>
	
	<article>
	<section id="container">
		<aside>
			<%@ include file="../include/AdminAside.jsp"%>
		</aside>
		<div id="containerBox"><h4>공지사항 관리</h4>
			<button type="button" id="btnWrite">글쓰기</button>
		</div>
		
		<div class="container">
			<div class="tableNotice">
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
										<td><a href="javascript:void(0);" onClick="javascript:noticeView('<c:out value="${list.noticeNum}"/>')" >
										<c:out value="${list.noticeSubject}" />
										</a></td>
										
										<td><c:out value="${list.noticeDate}" /></td>
										<td><label class="switch">
								  <input type="hidden" id="noticePost${status.index}" value="${status.index}" >
								  <input type="checkbox" class="display" id="chk${list.noticeNum}" data-noticeNum="${list.noticeNum}" ${list.noticePost == "TRUE" ? "checked" : ""}>
								  <span class="slider round"></span>
								</label>
							</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	</article>
		
	<footer id="footer">
		<div id=footerBox>
			<%@ include file="../include/AdminFooter.jsp"%>
		</div>
	</footer>

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
				success: function(data) {
					
				}
		});
	});
  	
	
</script>

</body>
</html>