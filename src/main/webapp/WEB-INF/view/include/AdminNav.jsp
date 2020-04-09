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
			<li class="navbar-left"><a href="#"><b>[${adminVO.adminId}]</b>님 환영합니다.</a>
			<li class="active"><h4><i><a href="<c:url value='/admin'/>"> #ing_Admin </a></i></h4>
			<li class="navbar-right"><a href="<c:url value='/logout'/>">[로그아웃]</a></li>
			<li class="navbar-right"><a href="javascript:registerAdmin();">[새관리자등록]</a></li>
		</ul>
	</div>
</div> 




		
