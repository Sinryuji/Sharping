<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
	<li><b>${adminVO.adminId}</b>님 환영합니다.
	<a href="<c:url value='/logout'/>">[로그아웃]</a>
	<li><a href="javascript:registerAdmin();">[새관리자등록]</a>
</ul>