<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- jquery -->
<script src="//code.jquery.com/jquery.min.js"></script>


<title>DeclProductManage</title>

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

<script type="text/javascript">
	function registerAdmin() {
		// window.name = "부모창 이름";            
		window.name = "AdminPage";

		// window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
		window
				.open("registerAdmin", "새관리자등록",
						"width = 500, height = 320, resizable = no, scrollbars = no, status = no");
	}
</script>


<style>

html {
	height: 100%;
}

body {
	/* background-image: url('${pageContext.request.contextPath}/resources/images/신세경1.jpg'); */
	background-size: cover;
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
	height: 100%;
}

.wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 190px; /* footer height */
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

.navbar-nav {
    width: 100%;
    text-align: center;
}

.navbar-nav > li {
    float: none;
    display: inline-block;
}

.navbar-nav > li.navbar-right {
    float: right !important;
} 

section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
	margin-bottom: 50px;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

div#containerBox {
	float: right;
	width: calc(100% - 200px - 20px);
}

aside {
	float: left;
	width: 200px;
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
}

footer#footer {
	background: #e7e7e7;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	height:190px;
	padding: 7px 0;
	text-align: center;
}

footer#footer div {
	display: inline-block;
	margin-right: 10px;
}


.cen{
	width: 300px;
	float: right;
	margin-right: 170px;
}

.d{
    width: 120px;
    height: 40px;
    font-family: 'Roboto', sans-serif;
    font-size: 12px;
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

.d:hover {
	background-color: #FFB2F5;
	box-shadow: 0px 15px 20px hotpink;
	color: #fff;
	transform: translateY(-7px);
}

#search{
	height:24px;
	border:0px;
	text-align:left;
	outline: 0;
}

.declReason{
	height:40px;
}

#searchBox{
	border: 1px solid white;
	background: white;
	display: inline;
}

#a {
    width: 80px;
    height: 30px;
    font-family: 'Roboto', sans-serif;
    font-size: 12px;
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

#a:hover {
 		background-color: #FFB2F5;
 		box-shadow: 0px 15px 20px hotpink;
 		color: #fff;
 		transform: translateY(-7px);
}

.box{
	width: 500px;
	margin-left: 400px;
}

.hr{
	 color: black; 
	 width: 52%; 
	 size: 1px; 
	 margin-left: 200px; 
	 noshade
}
	
</style>

</head>
<body>

<div class="wrap">
	<nav class="navbar navbar-default">
		<div id="navBox">
			<%@ include file="../include/AdminNav.jsp"%>
		</div>
	</nav>

	<article>
		<section id="container">
			<aside>
				<%@ include file="../include/AdminAside.jsp"%>
			</aside>
			
			<div id="containerBox">
				<h4>신고상품 관리</h4>
			</div>
			<div class="box">
				<form action="declProductManage">
					<select name="declReason" class="declReason">
						<option value="">--------전체 사유--------</option>
						<option value="상품정보 다름" ${currentReason == "상품정보 다름" ? "selected" : "" }>상품정보 다름</option>
						<option value="가품/이미테이션" ${currentReason == "가품/이미테이션" ? "selected" : "" }>가품/이미테이션</option>
						<option value="청소년유해상품 및 이미지" ${currentReason == "청소년유해상품 및 이미지" ? "selected" : "" }>청소년유해상품 및 이미지</option>
						<option value="불법상품" ${currentReason == "불법상품" ? "selected" : "" }>불법상품</option>
						<option value="부적합 판매행위" ${currentReason == "부적합 판매행위" ? "selected" : "" }>부적합 판매행위</option>
						<option value="개인정보 침해" ${currentReason == "개인정보 침해" ? "selected" : "" }>개인정보 침해</option>
						<option value="결제도용신고" ${currentReason == "결제도용신고" ? "selected" : "" }>결제도용신고</option>
						<option value="배송환불분쟁/연락두절" ${currentReason == "배송환불분쟁/연락두절" ? "selected" : "" }>배송환불분쟁/연락두절</option>
						<option value="저작권 위반" ${currentReason == "저작권 위반" ? "selected" : "" }>저작권 위반</option>
					</select>
					<div id="searchBox">
						<input type="text" name="search" id="search" placeholder="키워드를 입력하세요." value="${search}"/>
						<input type="submit" id="a" class="a" value="검색">
					</div>
					<hr class="hr">
				</form>
			</div>
				<table class="infoNotice">
					<colgroup>
					    <col style="width:5%;" />
					    <col style="width:5%;" />
					    <col style="width:15%;" />
					    <col style="width:15%;" />
					    <col style="width:15%;" />
					    <col style="width:15%;" />
					    <col style="width:15%;" />
					    <col style="width:15%;" />
				    </colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" id="allSelect"></th>
							<th>No.</th>
							<th>신고 사유</th>
							<th>상품명</th>
							<th>신고 내용</th>
							<th>신고날짜</th>
							<th>판매자</th>
							<th>신고자</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:choose>
							<c:when test="${empty declList }">
								<tr>
									<td colspan="10" align="center"><b>접수된 신고건이 없습니다.</b></td>
								</tr>
							</c:when>
							<c:when test="${!empty declList}">
								<c:forEach var="list" items="${declList}" varStatus="status">
									<tr>
										<td><input type="checkbox" class="select"  data-productNum="${list.productNum}" data-declNum="${list.declNum}"></td>
										<td><c:out value="${list.declNum}" /></td>
										<td><c:out value="${list.declReason}" /></td>
										<td>
											<a href="javascript:void(0);" onClick="javascript:productView('<c:out value="${list.productNum}"/>')">
												<c:out value="${productList[status.index].productName}" />
											</a>
										</td>
										<td>
											<a href="javascript:void(0);" onClick="javascript:declView('<c:out value="${list.declNum}"/>')">
												내용 확인
											</a>
										</td>
										<td><c:out value="${list.declDate}" /></td>
										<td><c:out value="${list.sellerId}" /></td>
										<td><c:out value="${list.declId}" /></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
				<br>
				<div class="cen">
					<button type="button" id="selDelete2" class="d">신고 삭제</button>
					<button type="button" id="selDelete" class="d">상품 삭제</button>
				</div>
		</section>
	</article>


	<footer id="footer">
		<div id=footerBox>
			<%@ include file="../include/Footer.jsp"%>
		</div>
	</footer>

</div>
	<script>
	
	history.scrollRestoration = "manual";

	   var page = 1;

	   $(function(){
	   	getList(page);
	   	page++;
	   })

	   $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	        if($(window).scrollTop() >= $(document).height() - $(window).height()){
	       	 getList(page);
	       	 console.log(page);
	       	 page++; 
	        } 
	   });
	   
	   function getList(page) {
			
			console.log("되냐");
			
			 $.ajax({
			        type : 'GET',  
			        data : {
			        	page : page,
			        	search : $("#search").val(),
			        	declReason : $("select[name=delctReason]").val()
			        	},
			        url : '<%=request.getContextPath()%>/admin/declProductManagePaging',
			        success : function(data) {
			        	console.log("되냐1.5");
			            /* var data = returnData.rows; */
			            var html = "";
			            /* if (page==1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
			                  $("#tbody").html(""); 
			            } */
			            
			            if (data.startNum<=data.totCnt){
			            	console.log("되냐2");
			                if(data.declList.length>0){
			                	console.log("되냐3");
			                	// for문을 돌면서 행을 그린다.
			                	for(var i = 0 ; i < data.declList.length ; i++) {
			                		var decl = data.declList[i];
			                		var product = data.productList[i];
			                	
			                		html += "<tr><td><input type='checkbox' class='select' data-productNum='" + decl.productNum + "' data-declNum='" + decl.declNum + "'></td><td>" + decl.declNum + "</td><td>" + decl.declReason + "</td><td><a href='#' onclick='productView(" + decl.productNum + ")'>" + product.productName + "</a></td><td><a href='#' onclick='declView(" + decl.declNum + ")'>내용 확인</a></td><td>" + decl.declDate + "</td><td>" + decl.sellerId + "</td><td>" + decl.declId + "</td></tr>";
			                		  	
			                	}
			                	
			                }else{
			                //데이터가 없을경우
			                }
			            }
			           /*  html = html.replace(/%20/gi, " "); */
			            if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
			            	if(data.declList.length != 0) {
			                	$("#tbody").html(html); 
			            	} else {
			            		$("#tbody").html("<tr><td colspan='10' align='center'><b>접수된 신고건이 없습니다.</b></td></tr>")
			            	}
			            }else{
			            	console.log("안함?");
			                $("#tbody").append(html);
			            }
			       },error:function(e){
			           if(e.status==300){
			               alert("데이터를 가져오는데 실패하였습니다.");
			           };
			       }
			    }); 

		}
		
		function productView(productNum){
			var url = "${pageContext.request.contextPath}"+"/product";
			url = url + "?productNum=" + productNum;
			location.href = url;
		}
		
		function declView(declNum){
			var url = "declText" + "?declNum=" + declNum;
			var name = "declContent";
			var option = "width = 700, height = 550, top = 100, left = 800";	
			
			window.open(url, name, option);
		}
		
		
		/* 체크박스 전체 선택 / 해제 */
		$("#allSelect").click(function(){
		    if($("#allSelect").is(":checked")){
		       $(".select").prop("checked",true);
		    }else {
		       $(".select").prop("checked",false);
		    }
		 });
		 
		 
		 $(".select").click(function(){
		   $("#allSelect").prop("checked", false);
		  });
		 
		 /* 신고상품 선택 삭제 */
		 $("#selDelete").click(function(){
			 
			 if($("#allSelect").is(":checked") || $(".select").is(":checked")){
			 
			     var sDel = confirm('선택된 신고 상품을 삭제합니다.\n삭제 이후에는 접수된 신고도 함께 삭제되며 복구가 불가능 합니다.\n삭제 하시겠습니까?');
			     if(sDel == true){
			        var selArr = new Array();
			        
			        $("input[class='select']:checked").each(function(){
			           selArr.push($(this).attr("data-productNum"));
			        });
			        
			        $.ajax({
			           url : "<%=request.getContextPath()%>/deleteSelectDeclProductByProductNum",
			              type : "post",
			              data : { 
							chk : selArr 		  
			              }, 
			              
			              success: function(data) {
			                 setTimeout(function() {
			                    history.go(0);
			                 }, 800);
			              }
			        });
			     } else {
			        return false;
			     }
			 } else {
				 alert('선택된 상품이 없습니다.')
			 }
		  });
		 
		 /* 신고상품 선택 삭제 */
		 $("#selDelete2").click(function(){
			 
			 if($("#allSelect").is(":checked") || $(".select").is(":checked")){
			 
			     var sDel = confirm('선택된 신고를 삭제합니다.\n삭제 이후에는 복구가 불가능 합니다.\n삭제 하시겠습니까?');
			     if(sDel == true){
			        var selArr = new Array();
			        
			        $("input[class='select']:checked").each(function(){
			           selArr.push($(this).attr("data-declNum"));
			        });
			        
			        $.ajax({
			           url : "<%=request.getContextPath()%>/deleteSelectDeclProductByDeclNum",
			              type : "post",
			              data : { 
							chk : selArr 		  
			              }, 
			              
			              success: function(data) {
			                 setTimeout(function() {
			                    history.go(0);
			                 }, 800);
			              }
			        });
			     } else {
			        return false;
			     }
			 } else {
				 alert('선택된 상품이 없습니다.')
			 }
		  });
	
	</script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/masonry.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/asset/js/bootstrap.js"></script>
</body>
</html>