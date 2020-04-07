<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<title>WriteNotice</title>

<link rel='stylesheet'
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
		
<style>

#container {
	position:absolute;
	top:0;
	left:0;
	width:100%;
	height:100%;
	text-align:center
}

#containerBox {
	display:inline-block;
	vertical-align:middle;
}

.blank {
	display:inline-block;
	width:0;
	height:100%;
	vertical-align:middle;
}


.mb-3 {
	padding-bottom: 10px;
	
}

#btnUpdate, #btnCanc {
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

#btnUpdate:hover, #btnCanc:hover {
     background-color: #FFB2F5;
     box-shadow: 0px 15px 20px hotpink;
     color: #fff;
     transform: translateY(-7px);
}	

#noticeText {
	font-size: 12pt;
	margin: 0;
	width: 450px;
	height: 200px;
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
	
	
	
}
</style>

</head>

<body>

	<article>
		<section id="container">
			<div id="containerBox">
			<h2>공지사항</h2>

			<form role="form" name="form" id="form" method="post" autocomplete="off"
				action="${pageContext.request.contextPath}/admin/updateNotice">


				<div class="mb-3">
					<label for="noticeSubject">제목</label> 
					<input type="text" name="noticeSubject" id="noticeSubject" value="${updateNotice.noticeSubject}" />
				</div>

				<div class="mb-3">
					<label for="adminId">작성자</label> 
					<input type="text" name="adminId" id="adminId" value="${adminVO.adminId }" readonly />
				</div>

				<div class="mb-3">
					<label for="noticeText">내용</label>
					<textarea rows="5" name="noticeText" id="noticeText">${updateNotice.noticeText}</textarea>
				</div>
				
				<div class="mb-3">
					<label for="noticePost">진열여부</label>
					<label class="switch"> 
						<input type="checkbox" name="noticePost" id="noticePost" ${updateNotice.noticePost == "TRUE" ? "checked" : "FALSE"}/>
						<span class="slider round"></span>
					</label>
				</div>
				<input type="hidden" value="${updateNotice.noticeNum}" name="noticeNum">
			</form>
			
				<div>
					<button type="button" id="btnUpdate">수정</button>
					<button type="button" id="btnCanc">취소</button>
				</div>
			
			</div>
			<span class="blank"></span>			
		</section>
	</article>

	
	
	<script>
	
	
	
	$(function(){
		if(document.getElementById("noticePost").checked == true){
			$("#no").attr('style' , 'display:none;');
			document.getElementById("noticePost").value = 'TRUE';
		} else {
			$("#yes").attr('style' , 'display:none;');
			document.getElementById("noticePost").value = 'FALSE';
		}					
	});

	$("#noticePost").click(function(){
			if (document.getElementById("noticePost").checked == true) {
				document.getElementById("noticePost").value = 'TRUE';
			} else {
				document.getElementById("noticePost").value = 'FALSE';
			}
		});
    

	$(document).on('click','#btnCanc',function() {
		window.close();
		location.href = "${pageContext.request.contextPath}/admin/noticeManage";
	});
	
	$(document).on('click','#btnUpdate',function() {
		
		$("#form").submit();
		
		window.close();
	});
    
	
	</script>
	
	

</body>

</html>
