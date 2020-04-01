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

p {
	margin:0px;
	display:inline-block;
	font-size:15px;
	font-weight:bold;
}
	
	
	
}
</style>

</head>

<body>

	<article>
		<div class="container" role="main">

			<h2>공지사항</h2>

			<form name="form" id="form" role="form" method="post"
				action="${pageContext.request.contextPath}/admin/insertNotice">


				<div class="mb-3">
					<label for="noticeSubject">제목</label> 
					<input type="text" class="form-control" name="noticeSubject" id="noticeSubject" placeholder="제목을 입력해 주세요" />
				</div>

				<div class="mb-3">
					<label for="adminId">작성자</label> 
					<input type="text" class="form-control" name="adminId" id="adminId" value="${adminVO.adminId }" readonly />
				</div>

				<div class="mb-3">
					<label for="noticeText">내용</label>
					<textarea class="form-control" rows="5" name="noticeText" id="noticeText" placeholder="내용을 입력해 주세요" /></textarea>
				</div>
				
				<div class="mb-3">
					<label for="noticePost" class="switch">진열여부
					<input type="checkbox" class="form-control" name="noticePost" id="noticePost"/>
					<span class="slider round"></span>
					</label>
				</div>
			</form>

			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnCanc">취소</button>
			</div>
		</div>
	</article>
	
	
	<script>
	$(document).on('click', '#btnSave', function() {
		
		if(noticeSubject.value==""){
            alert("제목을 입력해주세요.");
            noticeSubject.focus();
            return false;
        }else if(noticeText.value==""){
            alert("내용을 입력해주세요.");
            noticeText.focus();
            return false;
        }else{
            alert("글이 등록됩니다!");
        }
		
		$("#form").submit();
	});

	$(document).on('click','#btnCanc',function() {
		location.href = "${pageContext.request.contextPath}/admin/noticeManage";
	});
	
	$("#noticePost").click(function(){
		if (document.getElementById("noticePost").checked == true) {
			document.getElementById("noticePost").value = 'TRUE';
		} else {
			document.getElementById("noticePost").value = 'FALSE';
		}
	});
	
	
</script>
	
	

</body>

</html>
