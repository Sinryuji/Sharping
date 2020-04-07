<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>MemberManage</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="stylesheet"
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
/*  	background-image: url('${pageContext.request.contextPath}/resources/images/신세경1.jpg'); */
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
	margin-bottom: 50px;	
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

aside {
	float: left;
	width: 200px;
}

div#containerBox {
	float: right;
	width: calc(100% - 200px - 20px);
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

.big_tab {
	height: 50px;
}

.big_tab ul {
	margin: auto;
	width: 100%;
}

.big_tab ul li {
	width: 30%;
	box-sizing: border-box;
	float: left;
	list-style-type: none;
	border: 1px solid #ccc;
	text-align: center;
	line-height: 40px;
	margin-right: 10px;
}

.big_tab ul li.activeClass {
	font-weight: bold;
	font-size: 20px;
}

.tab-contents form {
	float: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

@media ( max-width :500px) {
	.sm_select {
		display: block;
	}
	.big_tab {
		display: none;
	}
}
	
	input#btnSearch {
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
	
	input#btnSearch:hover {
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
				<h4>회원 관리</h4>
			</div>

			<div class="tabmenu">
				<div class="big_tab">
					<ul>
						<li><a id="t1" href="#tab01">구매회원</a></li>
						<li><a id="t2" href="#tab02">판매회원</a></li>
					</ul>
				</div>

				<div id="tab01" class="tab-contents">
					<form action="memberList">
						<input type="text" name="keywordM" placeholder="키워드를 입력하세요."
							value="${keywordM}" /> <input type="submit" id="btnSearch" value="검색">
					</form>

					<div class="tableInfo">
						<table class="infoMember">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이메일주소</th>
									<th>가입날짜</th>
									<th>회원등급</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty memberList }">
										<tr>
											<td colspan="5" align="center"><b>검색결과가 없습니다.</b></td>
										</tr>
									</c:when>
									<c:when test="${!empty memberList}">
										<c:forEach var="list" items="${memberList}">
											<tr>
												<td><a href="javascript:void(0);"
													onClick="javascript:infoDetailView('<c:out value="${list.id}"/>')">
														<c:out value="${list.id}" />
												</a></td>

												<td><a href="javascript:void(0);"
													onClick="javascript:infoDetailView('<c:out value="${list.id}"/>')">
														<c:out value="${list.email}" />
												</a></td>
												<td><c:out value="${list.regDate}" /></td>
												<td><c:if test="${list.memberGrade == 1}">
														<c:out value="일반회원" />
													</c:if> <c:if test="${list.memberGrade == 2}">
														<c:out value="보통회원" />
													</c:if> <c:if test="${list.memberGrade == 3}">
														<c:out value="VIP회원" />
													</c:if></td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>

				<div id="tab02" class="tab-contents">
					<form action="sellerList">
						<input type="text" name="keywordM" placeholder="키워드를 입력하세요."
							value="${keywordM}" /> <input type="submit" id="btnSearch" value="검색">
					</form>

					<div class="tableInfo">
						<table class="infoSeller">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이메일주소</th>
									<th>가입날짜</th>
									<th>회원등급</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty sellerList }">
										<tr>
											<td colspan="5" align="center"><b>검색결과가 없습니다.</b></td>
										</tr>
									</c:when>
									<c:when test="${!empty sellerList}">
										<c:forEach var="list" items="${sellerList}">
											<tr>
												<td><a href="javascript:void(0);"
													onClick="javascript:infoDetailView('<c:out value="${list.id}"/>')">
														<c:out value="${list.id}" />
												</a></td>
												<td><a href="javascript:void(0);"
													onClick="javascript:infoDetailView('<c:out value="${list.id}"/>')">
														<c:out value="${list.email}" />
												</a></td>
												<td><c:out value="${list.regDate}" /></td>
												<td><c:if test="${list.sellerGrade == 1}">
														<c:out value="일반회원" />
													</c:if> <c:if test="${list.sellerGrade == 2}">
														<c:out value="보통회원" />
													</c:if> <c:if test="${list.sellerGrade == 3}">
														<c:out value="VIP회원" />
													</c:if></td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				
			</div>
		</section>
	</article>

	<footer id="footer">
		<div id=footerBox>
			<%@ include file="../include/Footer.jsp"%>
		</div>
	</footer>




</div>

	<script>
		$('.big_tab li').first().addClass("activeClass");
		$(".tab-contents").not(':first').hide();

		$('.big_tab li').on(
				'click',
				function() {
					$(this).addClass("activeClass").siblings().removeClass(
							"activeClass");
					var link = $(this).find("a").attr("href");
					var link_num = link.substr(link.length - 1);
					$("select#tabmenu option").eq(link_num - 1).prop(
							"selected", "selected");
					$(".tab-contents").hide();
					$(link).show();
				});
		
		$("select#tabmenu").on(
				"change",
				function() {
					var select_link = $("select#tabmenu").val();
					var select_num = $(this).prop('selectedIndex');
					$('.big_tab li').eq(select_num).addClass("activeClass")
							.siblings().removeClass('activeClass');
					$(".tab-contents").hide();
					$(select_link).show();
					console.log(select_link);
		});

		
		
		function infoDetailView(id) {
			window.name = "MemberManage";
			var popup = window
					.open("infoDetail" + "?id=" + id, "회원상세정보",
							"width = 450, height = 350, resizable = no, scrollbars = no, status = no");

			var timer = setInterval(function() {
				if (popup.closed) {
					clearInterval(timer);
					window.location.reload();

				}
			}, 300)
		}

		var url = $(location).attr('href');
		if (url.match("#tab02")) {
			$("#t2").trigger("click");
		}
		
		$(document).ready( function() {
			var url = $(location).attr('href');
			if (url.match("sellerList")) {
				url += "#tab02";
				$("#t2").trigger("click");
			}
		});
		
	</script>



	<script
		src="${pageContext.request.contextPath}/resources/js/masonry.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/asset/js/bootstrap.js"></script>
	
	
</body>
</html>