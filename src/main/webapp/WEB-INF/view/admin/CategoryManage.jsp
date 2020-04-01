<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
#mm {
	text-align: center;
	margin: 0 auto;
}
</style>

<meta charset="UTF-8">
<title>CategoryManage</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
	<div id="mm">
		<h1><a href="<c:url value='/admin'/>">
			관리자메인
		</a></h1>
	</div>


	<div
		style="border-right: 2px solid black; float: left; width: 33%; height: 400px; text-align: center">
		대분류<br>
		<br>
		<div id="DepthOneSpace">
			<c:forEach var="category" items="${cetegorys}" varStatus="status">
				<div id="categoryName${category.categoryNum}"><h4><a href="#" class="depthOne" data-type="${category.categoryNum}">${category.categoryName}</a></h4></div>
			</c:forEach>
			<button type="button" class="depthOnePlus">추가</button>
		</div>
	</div>
	<div
		style="border-right: 2px solid black; float: left; width: 33%; height: 400px; text-align: center">
		중분류<br>
		<br>
		<div id="DepthTwoSpace"></div>
	</div>
	<div style="float: left; width: 33%; height: 400px; text-align: center">
		소분류<br>
		<br>
		<div id="DepthThreeSpace"></div>
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
	
	
	$('.depthOne').on("click", function(){
		
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
		
		$(this).after('<span class="UpdateDelete">&nbsp;<button type="button" class="updateCategory" value="' + currentCategoryNum + '">수정</button>&nbsp;<button type="button" class="deleteCategory" value="' + currentCategoryNum + '">삭제</button></span>');
		
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
					
					
					
					htmls += '<button type="button" class="depthTwoPlus">추가</button>';
					
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
		
		
		$(this).after('<span class="UpdateDelete">&nbsp;<button type="button" class="updateCategory" value="' + currentCategoryNum + '">수정</button>&nbsp;<button type="button" class="deleteCategory" value="' + currentCategoryNum + '">삭제</button></span>');

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
		
	
		
		$(this).after('<span class="UpdateDelete">&nbsp;<button type="button" class="updateCategory" value="' + currentCategoryNum + '">수정</button>&nbsp;<button type="button" class="deleteCategory" value="' + currentCategoryNum + '">삭제</button></span>');
		
		}
		
		else if(count9 == 1) {
			count9--;
			$('.UpdateDelete').remove();
	
		}
		
	})
	
	
	// 대분류 추가 버튼
	
	$(document).on("click", ".depthOnePlus", function(){

		if(count1 == 0) {
		$('#DepthOneSpace').append('<div id="DepthOneNameStr"><br><input type="text" id="DepthOneName" />&nbsp;<button type="button" class="insertDepthOne">저장</button></div>');
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
		
		$('#DepthTwoSpace').append('<div id="DepthTwoNameStr"><br><input type="text" id="DepthTwoName" />&nbsp;<button type="button" class="insertDepthTwo" value="">저장</button></div>');
		
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
		
		$('#DepthThreeSpace').append('<div id="DepthThreeNameStr"><br><input type="text" id="DepthThreeName" />&nbsp;<button type="button" class="insertDepthThree">저장</button></div>');
		
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
					
					if(data.cetegoryDepth == 1) {
						classStr = 'depthOne';
					}
					
					if(data.cetegoryDepth == 2) {
						classStr = 'depthTwo';
					}
					
					if(data.cetegoryDepth == 3) {
						classStr = 'depthThree';
					}
					
			/* 		var categoryHtmlRestore = '<div id="categoryName' + categoryNumTemp  + '">' + categoryHtmlTemp + '</div>'; */
					var str = '#categoryName' + categoryNumTemp;
					
					$(str).html('');
					$(str).html('<h4><a href="#" class="' + classStr + '" data-type="' + data.categoryNum + '">' + data.categoryName + '</a></h4>');
					
					/* $('#DepthThreeNameStr').remove();
					
					var htmls = '<h4><a href="#" class="depthThree" data-type="' + data.categoryNum + '">' + data.categoryName + '</a></h4>';
					
					$(".depthThreePlus").before(htmls); */
	
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
						
						var str = '#categoryName' + data.category.categoryNum;
						
						$(str).remove();
						
						for(var i = 0 ; i < data.categorys.length ; i++) {
							
							var category = data.categorys[i];
							
							str = '#categoryName' + category.categoryNum;
							
							$(str).remove();
						}
						
		
					} 
					
			});
			
		}
		
		if(deleteConfirm == false) {
			
			alert("카테고리 삭제를 취소 하였습니다!");
			
		}
		
	})
	
	
</script>
</body>
</html>