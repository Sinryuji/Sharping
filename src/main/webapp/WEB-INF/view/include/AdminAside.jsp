<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
	<li><a href="<c:url value='/admin/categoryManage'/>">
			카테고리 관리 </a>
	<li><a href="<c:url value='/admin/memberManage'/>">
			회원 관리 </a>
	<li><a href="<c:url value='/admin/noticeManage'/>">
			공지사항 관리 </a>
	<li><a href="<c:url value='/admin/declProductManage'/>">
			신고게시물 관리 </a>
</ul>