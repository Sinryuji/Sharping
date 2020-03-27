<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminPage</title>
    <script type="text/javascript">
        function registerAdmin() {
            // window.name = "부모창 이름";            
            window.name = "AdminPage";
            
            // window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
            window.open("admin/registerAdmin", "새관리자등록",
                    "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
        }
    </script>
    
    <style>
    	#mm {
    		 text-align: center;
 			 margin: 0 auto;
    	}
    </style>

</head>
<body>

	<div id="mm">
	<a href="<c:url value='/admin'/>"> <h1>관리자메인</h1> </a>
	</div>
 


	<a href="<c:url value='/admin/categoryManage'/>"> <h1>CategoryManage</h1> </a>
	<a href="<c:url value='/admin/memberManage'/>"> <h1>MemberManage</h1> </a>
<h1>DeclareManage</h1>
	<a href="<c:url value='/admin/noticeManage'/>"> <h1>NoticeManage</h1> </a>
<h1>Product</h1>
<h1>InfoDetail</h1>
<h1>DeclareContent</h1>
<h1>WriteNotice</h1>
<h1>NoticeContent</h1>


		<b>${adminVO.adminId}</b>님 환영합니다.
		<a href="<c:url value='/logout'/>">[로그아웃]</a> <br>
        <a href="javascript:registerAdmin();">[새관리자등록]</a><br>

</body>
</html>