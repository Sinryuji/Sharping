<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container-fluid">
	<div class="navbar-left">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="sr-only"></span> 
			<span class="icon-bar"></span> 
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<c:if test="${empty authInfo}">
				<li class="navbar-left"><a href="<c:url value='/login'/>">로그인</a>
				<li class="navbar-left"><a href="<c:url value='/regist'/>">회원가입</a>
				<li class="active"><h4><a href="<c:url value='/main'/>"><img src="${pageContext.request.contextPath}/resources/images/ing작은.png"></a></h4>
				<li class="navbar-right"><a href="<c:url value='latelyViewProduct'/>">최근 본 상품</a></li>
			</c:if>
			<c:if test="${!empty authInfo}">
				<li class="navbar-left"><a href="#"><b>[${authInfo.name}]</b>님 환영합니다.</a></li>
				<li class="navbar-left"><a href="<c:url value='/infoChange'/>">회원정보 수정</a></li>		
				<li class="navbar-left"><a href="<c:url value='/logout'/>">로그아웃</a></li>
				<li class="active"><h4><i><a href="<c:url value='/main'/>"><img src="${pageContext.request.contextPath}/resources/images/ing작은.png"></a></i></h4>
				<li class="navbar-right"><a href="<c:url value='/basket'/>">장바구니</a></li>
				<li class="navbar-right"><a href="<c:url value='/myPage'/>">마이페이지</a></li>			
				<li class="navbar-right"><a href="<c:url value='latelyViewProduct'/>">최근 본 상품</a></li>
			
			<c:if test="${authInfo.sellerCheck == 'false' }">
				<li class="navbar-right"><a href="<c:url value='/changeSeller'/>">판매하기</a></li>
			</c:if>
			<c:if test="${authInfo.sellerCheck == 'true' }">
				<li class="navbar-right"><a href="<c:url value='/sellerPage'/>">판매자 페이지</a></li>
			</c:if>
			</c:if>
		</ul>
	</div>
</div>











