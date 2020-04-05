<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>CategoryManage</title>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

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

	background-image: url('${pageContext.request.contextPath}/resources/images/신세경1.jpg');	
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
	text-align:left;
	float: right;
	width: calc(100% - 200px - 20px);
}

.s1, .s2 {
	border-right: 2px solid black; 
	float: left; 
	width: 25%; 
	height: auto;
	text-align: center;
}

.s3{
	 float: left;
	 width: 25%;
	 height: auto;
	 text-align: center;
}

#DepthOneSpace h4, #DepthTwoSpace h4, #DepthThreeSpace h4, #DepthOneNameStr {
	text-align: center;
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

#btnCate, #updateCategoryComplete, #updateCategoryCancle,
.updateCategory, /* .deleteCategory, */ .depthTwoPlus, .depthThreePlus,
.insertDepthOne, .insertDepthTwo, .insertDepthThree {
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

#btnCate:hover {
    background-color: #FFB2F5;
    box-shadow: 0px 15px 20px hotpink;
    color: #fff;
    transform: translateY(-7px);
}

.updateCategory, .deleteCategory {
	border: none;
	background-color: transparent;
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

		<section id="container">
			<aside>
				<%@ include file="../include/AdminAside.jsp"%>
			</aside>
			<div id="containerBox"><h4>카테고리 관리</h4></div>

			<div class="s1">
				대분류<br> <br>
				<div id="DepthOneSpace">
					<c:forEach var="category" items="${cetegorys}" varStatus="status">
						<div id="categoryName${category.categoryNum}">
							<h4>
								<a href="#" class="depthOne" data-type="${category.categoryNum}">${category.categoryName}</a>
							</h4>
						</div>
					</c:forEach>
					<button type="button" class="depthOnePlus" id="btnCate">추가</button>
				</div>
			</div>
			
			<div class="s2">
				중분류<br> <br>
				<div id="DepthTwoSpace"></div>
			</div>
			
			<div class="s3">
				소분류<br> <br>
				<div id="DepthThreeSpace"></div>
			</div>

		</section>

		<footer id="footer">
			<div id=footerBox>
				<%@ include file="../include/Footer.jsp"%>
			</div>
		</footer>

	</div>

	<script>
	
	var count1 = 0;
	var count2 = 0;
	var count3 = 0;
	var count4 = 0;
	var count5 = 0;
	var count6 = 0;
	var count7 = 0;
	var count8 = 0;
	var count9 = 0;
	
	var categoryHtmlTemp = '';
	var categoryNumTemp = 0;
	
	var categorySelectNumTemp = 0;
	
	/* Object.observe(obj, function(changes) {
		  console.log(changes);
	}); */
	
	
	
	// 대분류 카테고리명 클릭하는 경우
	
	
	$(document).on("click", '.depthOne', function(){
		
		var currentCategoryNum = $(this).attr("data-type");
		
		
		if(categorySelectNumTemp == 0) {
			count7 = 0;
			count8 = 0;
			count9 = 0;
		}
		
/* 		else if(categorySelectNumTemp == currentCategoryNum) {
			count7 = 1;
			count8 = 0;
			count9 = 0;
		} */
		
		else if(categorySelectNumTemp != currentCategoryNum) {
			count7 = 0;
			count8 = 0;
			count9 = 0;
		}
	
	
		if(count7 == 0) {
			
			count7++;
		
		$('.UpdateDelete').remove();
		
		
		categorySelectNumTemp = currentCategoryNum;
		
		$(this).after('<span class="UpdateDelete">&nbsp;<button type="button" class="updateCategory" value="' + currentCategoryNum + '"><img src="${pageContext.request.contextPath}/resources/images/수정이미지.png"></button>&nbsp;<button type="button" class="deleteCategory" value="' + currentCategoryNum + '"><img src="${pageContext.request.contextPath}/resources/images/삭제이미지.png"></button></span>');
		
		$("#DepthThreeSpace").html('');
		
		$.ajax({
			url : "<%=request.getContextPath()%>/admin/selectCategory",
				type : "post",
	
				data : {
					categoryNum : currentCategoryNum
				},
				
				success : function(data) {
					
					if(data != null) {
					
					var htmls = '<input type="hidden" id="depthOneCurrentCategoryNum" value="' +  currentCategoryNum + '"/>';
					
					for(var i = 0 ; i < data.length ; i++) {
						var category = data[i];
						htmls += '<div id="categoryName' + category.categoryNum  + '"><h4><a href="#" class="depthTwo" data-type="' + category.categoryNum + '">' + category.categoryName + '</a></h4></div>';
					}
					
					
					
					htmls += '<button type="button" class="depthTwoPlus" >추가</button>';
					
					$("#DepthTwoSpace").html(htmls);
					
					}
					
					if(data == null) {
						$("#DepthTwoSpace").html('');
					}
	
				} 
				
		});
		
		}
		

		
		else if(count7 == 1) {
			
			count7--;
			
			$('.UpdateDelete').remove();
			$('.depthTwoPlus').remove();
			$('.depthThreePlus').remove();
			$('#DepthTwoSpace').html('');
			$('#DepthThreeSpace').html('');
		
		}
	})
	
	// 중분류 카테고리명 클릭하는 경우
	$(document).on("click", ".depthTwo", function(){
		
		var currentCategoryNum = $(this).attr("data-type");
		
		if(categorySelectNumTemp == 0) {
			count7 = 0;
			count8 = 0;
			count9 = 0;
		}
/* 		
		else if(categorySelectNumTemp == currentCategoryNum && count8 == 0) {
			count7 = 0;
			count8 = 1;
			count9 = 0;
		} */
		
		else if(categorySelectNumTemp != currentCategoryNum) {
			count7 = 0;
			count8 = 0;
			count9 = 0;
		}
		
		if(count8 == 0) {
			
			count8++;
		
		$('.UpdateDelete').remove();
		
		
		categorySelectNumTemp = currentCategoryNum;
		
		
		$(this).after('<span class="UpdateDelete">&nbsp;<button type="button" class="updateCategory" value="' + currentCategoryNum + '"><img src="${pageContext.request.contextPath}/resources/images/수정이미지.png"></button>&nbsp;<button type="button" class="deleteCategory" value="' + currentCategoryNum + '"><img src="${pageContext.request.contextPath}/resources/images/삭제이미지.png"></button></span>');

		$.ajax({
			url : "<%=request.getContextPath()%>/admin/selectCategory",
				type : "post",
	
				data : {
					categoryNum : currentCategoryNum
				},
				
				success : function(data) {
					
					if(data != null) {
					
					var htmls = '<input type="hidden" id="depthTwoCurrentCategoryNum" value="' +  currentCategoryNum + '"/>';
					
					for(var i = 0 ; i < data.length ; i++) {
						var category = data[i];
						htmls += '<div id="categoryName' + category.categoryNum  + '"><h4><a href="#" class="depthThree" data-type="' + category.categoryNum + '">' + category.categoryName + '</a></h4></div>';
					}
					
					htmls += '<button type="button" class="depthThreePlus">추가</button>';
					
					$("#DepthThreeSpace").html(htmls);
					}
					
					if(data == null) {
						$("#DepthThreeSpace").html('');
					}
	
				} 
				
		});
		
		}
		
		else if(count8 == 1) {
			
			
			
			count8--;
			
			$('.UpdateDelete').remove();
			$('.depthThreePlus').remove();
			$('#DepthThreeSpace').html('');
		
		}
	})
	
	// 소분류 카테고리명 클릭하는 경우
	$(document).on("click", ".depthThree", function(){
		
		var currentCategoryNum = $(this).attr("data-type");
		
		if(categorySelectNumTemp == 0) {
			count7 = 0;
			count8 = 0;
			count9 = 0;
		}
		
/* 		else if(categorySelectNumTemp == currentCategoryNum) {
			count7 = 0;
			count8 = 0;
			count9 = 1;
		} */
		
		else if(categorySelectNumTemp != currentCategoryNum) {
			count7 = 0;
			count8 = 0;
			count9 = 0;
		}
		
		if(count9 == 0) {
			
			count9++;
		
		$('.UpdateDelete').remove();
		
		
		
		categorySelectNumTemp = currentCategoryNum;
		
	
		
		$(this).after('<span class="UpdateDelete">&nbsp;<button type="button" class="updateCategory" value="' + currentCategoryNum + '"><img src="${pageContext.request.contextPath}/resources/images/수정이미지.png"></button>&nbsp;<button type="button" class="deleteCategory" value="' + currentCategoryNum + '"><img src="${pageContext.request.contextPath}/resources/images/삭제이미지.png"></button></span>');
		
		}
		
		else if(count9 == 1) {
			count9--;
			$('.UpdateDelete').remove();
	
		}
		
	})
	
	
	// 대분류 추가 버튼
	
	$(document).on("click", ".depthOnePlus", function(){

		if(count1 == 0) {
		$('#DepthOneSpace').append('<div id="DepthOneNameStr"><br><input type="text" id="DepthOneName" />&nbsp;<button type="button" class="insertDepthOne" >저장</button></div>');
		count1++;
		
		}
		
		else if(count1 == 1) {
			$('#DepthOneNameStr').remove();
			count1--;
		}
		
	});
	
	// 중분류 추가 버튼
	
	$(document).on("click", ".depthTwoPlus", function(){
		
		if(count2 == 0) {
		
		$('#DepthTwoSpace').append('<div id="DepthTwoNameStr"><br><input type="text" id="DepthTwoName" />&nbsp;<button type="button" class="insertDepthTwo"  value="">저장</button></div>');
		
		count2++;
		}
		
		else if(count2 == 1) {
			$('#DepthTwoNameStr').remove();
			count2--;
		}
		
	});
	
	// 소분류 추가 버튼
	
	$(document).on("click", ".depthThreePlus", function(){
		
		if(count3 == 0) {
		
		$('#DepthThreeSpace').append('<div id="DepthThreeNameStr"><br><input type="text" id="DepthThreeName" />&nbsp;<button type="button" class="insertDepthThree" >저장</button></div>');
		
		count3++;
		}
		
		else if(count3 == 1) {
			$('#DepthThreeNameStr').remove();
			count3--;
		}
		
	});
	
	// 대분류 저장 버튼
	
	$(document).on("click", ".insertDepthOne", function(){
		
		$.ajax({
			url : "<%=request.getContextPath()%>/admin/insertCategoryDepthOne",
				type : "post",
	
				data : {
					categoryName : $('#DepthOneName').val()
				},
				
				success : function(data) {
					
					$('#DepthOneNameStr').remove();
					
					var htmls = '<div id="categoryName' + data.categoryNum  + '"><h4><a href="#" class="depthOne" data-type="' + data.categoryNum + '">' + data.categoryName + '</a></h4></div>';
					
					var str = '#categoryName' + data.categoryNum; 
					
					$(".depthOnePlus").before(htmls);
					
					$(str).trigger("click");
					
					count1--;
				} 
				
		});
		
	});
	
	// 중분류 저장 버튼
	
	$(document).on("click", ".insertDepthTwo", function(){
		
		$.ajax({
			url : "<%=request.getContextPath()%>/admin/insertCategoryDepthTwo",
				type : "post",
	
				data : {
					categoryName : $('#DepthTwoName').val(),
					categoryNum : $('#depthOneCurrentCategoryNum').val()
				},
				
				success : function(data) {
					
					$('#DepthTwoNameStr').remove();
					
					var htmls = '<div id="categoryName' + data.categoryNum  + '"><h4><a href="#" class="depthTwo" data-type="' + data.categoryNum + '">' + data.categoryName + '</a></h4></div>';
					
					var str = '#categoryName' + data.categoryNum; 
					
					$(".depthTwoPlus").before(htmls);
					
					$(str).trigger("click");
					
					count2--;
	
				} 
				
		});
		
	});
	
	// 소분류 저장 버튼
	
	$(document).on("click", ".insertDepthThree", function(){
		
		$.ajax({
			url : "<%=request.getContextPath()%>/admin/insertCategoryDepthThree",
				type : "post",
	
				data : {
					categoryName : $('#DepthThreeName').val(),
					categoryNum : $('#depthTwoCurrentCategoryNum').val()
				},
				
				success : function(data) {
					
					$('#DepthThreeNameStr').remove();
					
					var htmls = '<div id="categoryName' + data.categoryNum  + '"><h4><a href="#" class="depthThree" data-type="' + data.categoryNum + '">' + data.categoryName + '</a></h4></div>';
					
					var str = '#categoryName' + data.categoryNum; 
					
					$(".depthThreePlus").before(htmls);
					
					$(str).trigger("click");
					
					count3--;
	
				} 
				
		});
		
	});
	
	// 카테고리 수정
	
	/* <span class="UpdateDelete">&nbsp;<button type="button" class="updateCategory" value="' + currentCategoryNum + '">수정</button>&nbsp;<button type="button" class="deleteCategory" value="' + currentCategoryNum + '">삭제</button></span>
	<div id="categoryName${category.categoryNum}"><h4><a href="#" class="depthOne" data-type="${category.categoryNum}">${category.categoryName}</a></h4></div> */
	
	$(document).on("click", ".updateCategory", function(){
		
		var currentCategoryNum = $(this).val();
		var str = '#categoryName' + currentCategoryNum;
		
		categoryHtmlTemp = $(str).html();
		categoryNumTemp = currentCategoryNum;
		
		$(str).html('<span id="newCategoryNameSpace"><input tpye="text" id="newCategoryName"/>&nbsp;<button type="button" id="updateCategoryComplete" value="' + currentCategoryNum  + '">저장</button>&nbsp;<button type="button" id="updateCategoryCancle" value="' + currentCategoryNum + '">취소</button></span>');
		
		
	});
	
	// 카테고리 수정 완료
	
	$(document).on("click", "#updateCategoryComplete", function(){
		
		var currentCategoryNum = $(this).val();
		
		$.ajax({
			url : "<%=request.getContextPath()%>/admin/updateCategory",
				type : "post",
	
				data : {
					categoryName : $('#newCategoryName').val(),
					categoryNum : currentCategoryNum
				},
				
				success : function(data) {
					
					var classStr = '';
					
					if(data.categoryDepth == 1) {
						classStr = 'depthOne';
					}
					
					if(data.categoryDepth == 2) {
						classStr = 'depthTwo';
					}
					
					if(data.categoryDepth == 3) {
						classStr = 'depthThree';
					}
					
			/* 		var categoryHtmlRestore = '<div id="categoryName' + categoryNumTemp  + '">' + categoryHtmlTemp + '</div>'; */
					var str = '#categoryName' + categoryNumTemp;
			
					console.log(classStr + "asdf");
					
					$(str).html('');
					$(str).html('<div id="categoryName' + data.categoryNum  + '"><h4><a href="#" class="' + classStr + '" data-type="' + data.categoryNum + '">' + data.categoryName + '</a><span class="UpdateDelete">&nbsp;<button type="button" class="updateCategory" value="' + currentCategoryNum + '">수정</button>&nbsp;<button type="button" class="deleteCategory" value="' + currentCategoryNum + '">삭제</button></span></h4></div>');
					
					/* $('#DepthThreeNameStr').remove();
					
					var htmls = '<h4><a href="#" class="depthThree" data-type="' + data.categoryNum + '">' + data.categoryName + '</a></h4>';
					
					$(".depthThreePlus").before(htmls); */
					
					count7 = 0;
					count8 = 0;
					count9 = 0;
	
				} 
				
		});
		
	});
	
	// 카테고리 수정 취소
	
	$(document).on("click", "#updateCategoryCancle", function(){
		
		var str = '#categoryName' + $(this).val();
		$(str).html('');
		$(str).html(categoryHtmlTemp);
		
	})
	
	// 카테고리 삭제
	
	$(document).on("click", ".deleteCategory", function(){
		
		var deleteConfirm = confirm("카테고리를 정말 삭제 하시겠습니까? 하위 카테고리가 모두 삭제되고 해당하는 상품들이 임시 카테고리로 이동합니다!");
		
		if(deleteConfirm == true) {
			
			$.ajax({
				url : "<%=request.getContextPath()%>/admin/deleteCategory",
											type : "post",

											data : {
												categoryNum : $(this).val()
											},

											success : function(data) {

												var str = '#categoryName'
														+ data.category.categoryNum;

												$(str).remove();

												for (var i = 0; i < data.categorys.length; i++) {

													var category = data.categorys[i];

													str = '#categoryName'
															+ category.categoryNum;

													$(str).remove();
												}

											}

										});

							}

							if (deleteConfirm == false) {

								alert("카테고리 삭제를 취소 하였습니다!");

							}

						})
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