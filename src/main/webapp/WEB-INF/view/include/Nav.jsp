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
				<li class="navbar-left"><a href="<c:url value='/login'/>">&nbsp;로그인&nbsp;&nbsp;</a>
				<li class="navbar-left"><a href="<c:url value='/regist'/>">&nbsp;회원가입&nbsp;</a>
				<li class="active"><h1><a href="<c:url value='/main'/>"><i> #ing </i></a></h1>
				<li class="navbar-right"><a href="<c:url value='latelyViewProduct'/>">&nbsp;최근 본 상품&nbsp;</a></li>
			</c:if>
			<c:if test="${!empty authInfo}">
				<li class="navbar-left"><a href="#"><b>[${authInfo.name}]</b>님 환영합니다.</a></li>
				<li class="navbar-left"><a href="<c:url value='/infoChange'/>">&nbsp;회원정보 수정&nbsp;</a></li>		
				<li class="navbar-left"><a href="<c:url value='/logout'/>">&nbsp;로그아웃&nbsp;</a></li>
				<li class="active"><h1><i><a href="<c:url value='/main'/>"> #ing </a></i></h1>
				<li class="navbar-right"><a href="<c:url value='/basket'/>">&nbsp;장바구니&nbsp;</a></li>
				<li class="navbar-right"><a href="<c:url value='/myPage'/>">&nbsp;마이페이지&nbsp;</a></li>			
				<li class="navbar-right"><a href="<c:url value='latelyViewProduct'/>">&nbsp;최근 본 상품&nbsp;</a></li>
			
			<c:if test="${authInfo.sellerCheck == 'false' }">
				<li class="navbar-right"><a href="<c:url value='/changeSeller'/>">&nbsp;판매하기&nbsp;</a></li>
			</c:if>
			<c:if test="${authInfo.sellerCheck == 'true' }">
				<li class="navbar-right"><a href="<c:url value='/sellerPage'/>">&nbsp;판매자 페이지&nbsp;</a></li>
			</c:if>
			</c:if>
		</ul>
	</div>
</div>











