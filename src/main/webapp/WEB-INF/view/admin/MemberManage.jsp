<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberManage</title>

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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

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
	background: #999999; /* f9f9f9 */
	position: relative;
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

.big_tab ul {
	overflow: auto;
	margin-left: 300px;
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
}

.big_tab ul li.activeClass {
	font-weight: bold;
	font-size: 20px;
}

.tab-contents form {
	width: 600px;
	float: right;
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
		<div id="containerBox"><h4>회원 관리</h4>
		
	<div class="tabmenu" >
		<div class="big_tab">
			<ul>
				<li><a id="t1" href="#tab01">구매회원</a></li>
				<li><a id="t2" href="#tab02">판매회원</a></li>
			</ul>
		</div>
	</div>
	
	<div id="tab01" class="tab-contents">
		<form action="memberList">
			<input type="text" name="keywordM" placeholder="키워드를 입력하세요." value="${keywordM}" />
			<input type="submit" value="검색">
		</form>

		<div class="container">
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
										<td><a href="javascript:void(0);" onClick="javascript:infoDetailView('<c:out value="${list.id}"/>')"   >
										<c:out value="${list.id}" />
										</a></td>
										
										<td><a href="javascript:void(0);" onClick="javascript:infoDetailView('<c:out value="${list.id}"/>')"> 
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
	</div>
	<div id="tab02" class="tab-contents">

		<form action="sellerList">
			<input type="text" name="keywordM" placeholder="키워드를 입력하세요." value="${keywordM}" /> 
			<input type="submit" value="검색">
		</form>

		<div class="container">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
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
										<td><a href="javascript:void(0);" onClick="javascript:infoDetailView('<c:out value="${list.id}"/>')"> 
											<c:out value="${list.id}" />
										</a></td>
										<td><a href="javascript:void(0);" onClick="javascript:infoDetailView('<c:out value="${list.id}"/>')"> 
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
	</div>
	</section>
	</article>

	<footer id="footer">
		<div id=footerBox>
			<%@ include file="../include/AdminFooter.jsp"%>
		</div>
	</footer>


	


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
		
		$( document ).ready(function(){
			var url = $(location).attr('href');
			if(url.match("sellerList")) {
				url += "#tab02";
				$("#t2").trigger("click");
			}
		})
		
 		function infoDetailView(id){   
		            window.name = "MemberManage";   
		        var popup = window.open("infoDetail" + "?id=" + id , "회원상세정보",
		                    "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
		        
		    	var timer = setInterval(function(){
		        if(popup.closed) {
					clearInterval(timer);
					window.location.reload();
					
			
		        } 
		    },300)
		}
		
    	var url = $(location).attr('href');
		if(url.match("#tab02")) {
			$("#t2").trigger("click");
		}


		
	</script>



</body>
</html>