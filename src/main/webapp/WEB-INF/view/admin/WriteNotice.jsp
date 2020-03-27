<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>WriteNotice</title>

<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>

</head>

<body>

	<article>
		<div class="container" role="main">

			<h2>공지사항</h2>

			<form name="form" id="form" role="form" method="post"
				action="${pageContext.request.contextPath}/admin/saveNotice">


				<div class="mb-3">
					<label for="noticeSubject">제목</label> 
					<input type="text" class="form-control" name="noticeSubject" id="noticeSubject" placeholder="제목을 입력해 주세요" />
				</div>

				<div class="mb-3">
					<label for="adminId">작성자</label> 
					<input type="text" class="form-control" name="adminId" id="adminId" />
				</div>

				<div class="mb-3">
					<label for="noticeText">내용</label>
					<textarea class="form-control" rows="5" name="noticeText" id="noticeText" placeholder="내용을 입력해 주세요" /></textarea>
				</div>
				
				<div class="mb-3">
					<label for="noticePost">내용</label>
					<input type="checkbox" class="form-control" rows="5" name="noticePost" id="noticePost"/></textarea>
				</div>
			</form>

			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnCanc">취소</button>
			</div>
		</div>
	</article>
	
	
	<script>
	$(document).on('click', '#btnSave', function(e) {
		$("#form").submit();
	});

	$(document).on('click','#btnCanc',function(e) {
		location.href = "${pageContext.request.contextPath}/admin/noticeManage";
	});
	
	
	
</script>
	
	

</body>

</html>
