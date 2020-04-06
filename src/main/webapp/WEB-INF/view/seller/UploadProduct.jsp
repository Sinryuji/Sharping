<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>상품관리</title>
   <script src="https://code.jquery.com/jquery-2.2.4.min.js"
      integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
      crossorigin="anonymous"></script>
   <style>
      
	    table{
		    border-collapse: collapse;
		    line-height: 1.5;
			width:800px;
			margin:auto;
		}
		table thead th {
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    color: #369;
		    border-bottom: 3px solid #036;
		}
		table tbody th {
		    width: 150px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    border-bottom: 1px solid #ccc;
		    background: #f3f6f7;
		}
		table td {
		    width: 350px;
		    padding: 10px;
		    vertical-align: top;
		    border-bottom: 1px solid #ccc;
		}
		
		.td1{
			background: silver;
			text-align:center;
			vertical-align:middle;
		}
		
		.td2{
			text-align:left;
		}
		
		.detail{
			border:2px solid black;
		}
		
		.detail textarea{
			border:0;
			min-width:600px;
			min-height:200px;
			resize:none;
			overflow:hidden;
		}
		
		.detail textarea:focus{
		     outline: none; 
		}
		
		.cnt{
			text-align:right;
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
		
		p {
			margin:0px;
			display:inline-block;
			font-size:15px;
			font-weight:bold;
		}
		
		.optiondetail-scroll {
		
		background:#ffffff;
		
		border:2px solid #eeeeee;
		
		height:300px;
		
		display:none;
		
		position:absolute;
		
		z-index:1000;
		
		padding-top:15px;
		
		overflow-y:scroll;
		
		overflow-x:hidden;
		
		}
		
		
		
		.optiondetail {
		
		background:#ffffff;
		
		border:2px solid #eeeeee;
		
		display:none;
		
		position:absolute;
		
		z-index:1000;
		
		padding-top:15px;
		
		overflow:hidden;
		
		}
		
		#mm {
    		text-align: center;
 			margin: 0 910px;
    	}
    	
    	a{
   	  		text-decoration:none;
   	  		color:black;
   	  	}
   	  	
   	  	.cate{ 
			float: left; 
			width: 33%; 
			height: 300px; 
			text-align: center; 
			background-color: rgba( 140, 140, 140, 0.2);
		}
		
		#medium{
			border-right: 2px solid black;
			border-left: 2px solid black;
		}
		
		.depthOne{
			border-bottom:1px solid black;
		}
		
		.depthTwo{
			border-bottom:1px solid black;
		}
		
		.depthThree{
			border-bottom:1px solid black;
		}
		
		.td2 #categoryNameView{
			background: white;
			color: black;
			border: 0;
			outline: 0;
		}
		
		.select_img{
			border: 1px solid black;
			height: 500px;
			width: 500px;
		}
		
		.select_thumbImg{
			border: 1px solid black;
			height:250px;
			width: 250px;
		}
		
		.detail div{
			text-align: right;
			margin-right: 10px;
		}
		
		.btn {
		    width: 90px;
		    height: 40px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 16px;
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

		.btn:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		.sellP {
		    width: 140px;
		    height: 50px;
		    font-family: 'Roboto', sans-serif;
		    font-size: 16px;
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

		.sellP:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		.menu{
			margin-top: 20px;
			margin-left: 20px;
		}
      
</style>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script>
		
	$(function() {
	      $('#area').keyup(function (e){
	          var content = $(this).val();
	          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	          $('#counter').html(content.length);
	      });
	      $('#content').keyup();
	});

	$(document).ready(function() {
		$('#area').on('keyup', function() {
			if ($(this).val().length > 499) {
				$(this).val($(this).val().substring(0, 499));
				alert('입력 가능한 글자 수를 초과하였습니다.');
				return;
			}
			var area = $(this).val();
		});
	});
	
	$(document).ready(function() {
		var check = $("input[type='checkbox']");
	
		check.click(function() {
			$("p").toggle();
		});
	});	

</script>
</head>
<body>
	<div class="menu">
		<input type="button" class="sellP" onclick="location.href='${pageContext.request.contextPath}/sellerPage'" value="판매자 페이지"><br>
	</div>
	<br>
	<div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div>
	<form action="uploadCompleteProduct" method="post" enctype="multipart/form-data" id="uploadCompleteProduct">
	   <table>
	      <colgroup>
	         <col style="width:20%;" />
	         <col style="width:auto;" />
	      </colgroup>
	      <thead>
	         <tr>
	            <th>항목</th>
	            <th>내용</th>
	         </tr>
	      </thead>
	      <tbody>
	      	<tr>
	      		<td class="td1">카테고리 분류</td>
	      		<td class="td2">
	      			<div class="cate" id="large">
						대분류<br>
						<br>
						<div id="DepthOneSpace">
							<c:forEach var="category" items="${cetegorys}" varStatus="status">
								<div class="bCate" id="categoryName${category.categoryNum}"><h4><a href="#" class="depthOne" data-type="${category.categoryNum}">${category.categoryName}</a></h4></div>
							</c:forEach>
						</div>
					</div>
					<div class="cate" id="medium">
						중분류<br>
						<br>
						<div id="DepthTwoSpace"></div>
					</div>
					<div class="cate">
						소분류<br>
						<br>
						<div id="DepthThreeSpace"></div>
					</div>
	      		</td>
	      	</tr>
	      	<tr>
				<td class="td1">판매자</td>
				<td class="td2"><input type="text" name="id" value="${authInfo.id}" readonly></td>
	        </tr>
	        <tr>
				<td class="td1">카테고리</td>
				<td class="td2"><input type="text" id="categoryNameView" readonly>
				<input type="hidden" name="categoryNum"></td>
	        </tr>
	        <tr>
				<td class="td1">상품명</td>
				<td class="td2"><input type="text" name="productName"></td>
	        </tr>
	        <tr>
				<td class="td1">상품수량</td>
				<td class="td2"><input type="number" name="stock" step="1"></td>
	        </tr>
	        <tr>
				<td class="td1">상품가격</td>
				<td class="td2"><input type="number" name="productPrice" step="10"></td>
	        </tr>
	        <tr>
				<td class="td1">상품 이미지</td>
				<td class="td2">
					<div class="select_img"><img src=""></div><br>
					<input type="file" name="productImage" id="img" >
				</td>
	        </tr>
	        <tr>
				<td class="td1">상품 썸네일 이미지</td>
				<td class="td2">
					<div class="select_thumbImg"><img src=""></div><br>
					<input type="file" name="productThumb" id="thumbImg">
				</td>
	        </tr>
	        <tr>
				<td class="td1">상품 설명</td>
				<td class="td2">
					<div class="detail">
						<textarea name="productText" id="area" style="height:200px;"></textarea>
						<div>
							<span id="counter">0</span><span> / 500</span>
						</div>
					</div>
				</td>
	        </tr>
	        <tr>
				<td class="td1">상품 진열 여부</td>
				<td class="td2">
					<label class="switch">
					  <input type="checkbox" name="productDisplay" id="dis">
					  <span class="slider round"></span>
					</label>
					<p>미진열</p><p style="display:none;">진열</p>
				</td>
	        </tr>
	        <tr>
				<td class="td1">상품 소재</td>
				<td class="td2"><input type="text" name="productMeterial"></td>
	        </tr>
	        <tr>
				<td class="td1">제조사</td>
				<td class="td2"><input type="text" name="manufacturer"></td>
	        </tr>
	        <tr>
				<td class="td1">제조일자</td>
				<td class="td2">
					<input type="date" name="mfDate" id="mfDate">
					<input type="hidden" name="hidden" id="hidden" value="n">	
				</td>
	        </tr>
	        <tr>
				<td class="td1">원산지</td>
				<td class="td2"><input type="text" name="origin"></td>
	        </tr>
	        <tr>
				<td class="td1">배송비</td>
				<td class="td2"><input type="number" name="deliveryPrice" step="100"></td>
	        </tr>
	        <tr>
				<td class="td1">옵션설정</td>
				<td class="td2">
					<input type="button" id="plus" value="옵션 추가">&nbsp;&nbsp;<input type="button" id="minus" value="옵션 삭제" >
					<div id="optionBox">
					  <span id="op1">
					    <br>1차 옵션명  <input type="text" name="optionOneName" id="o1"><br>
					  </span>
					  <span id="op2">
					    2차 옵션명  <input type="text" name="optionTwoName" id="o2"><br>
					  </span>
					  <span id="op3">
					    3차 옵션명  <input type="text" name="optionThreeName" id="o3">
					  </span>  
					</div>
				</td>
	        </tr>
	      </tbody>
	   </table>
	   <div align="center">
	      <br><br><input type="button" id="save" class="btn" value="저장"><br><br><br>
	   </div>
   </form>
   <script>
   
   $(document).on("click", "#save", function(){
		if($("#categoryNameView").val() == "") {
			alert("상품을 등록할 카테고리를 선택해 주세요!")
		}
		else if($('input[name=productName]').val() == '' ) {
			alert("상품명을 입력해주세요!")
		}
		else if($('input[name=stock]').val() == '') {
			alert("상품 수량을 입력해주세요!")
		}
		else if($('input[name=productPrice]').val() == '') {
			alert("상품 가격을 입력해주세요!")
		}
		else if($('input[name=productImage]').val() == '') {
			alert("상품 이미지를 등록해주세요!")
		}
		else if($('input[name=productThumb]').val() == '') {
			alert("상품 썸네일 이미지를 등록해주세요!")
		}
		else if($('input[name=productText]').val() == '') {
			alert("상품 설명을 입력해주세요!")
		}
		else {
			$('#uploadCompleteProduct').submit();
		}})
   
   $("#img").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
   
   
   
   $("#thumbImg").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_thumbImg img").attr("src", data.target.result).width(250);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });   
   
   
   $("#mfDate").change(function(){
		document.getElementById("hidden").value = 'notNull' 
	});

	$("#dis").click(function(){
			if (document.getElementById("dis").checked == true) {
				document.getElementById("dis").value = 'TRUE';
			} else {
				document.getElementById("dis").value = 'FALSE';
			}
		});
	
	$("#one").click(function(){
       const str = '<select name="option1"><option value="1"></option><select>';
       $("#option").html(str);
   });

   var count = 0;

	$(function(){
	    $('#op1').hide();
	    $('#op2').hide();
	    $('#op3').hide();
	    $("#plus").click(function(){
		    count++;
		    if(count == 1){
		      $('#op1').show();
		    }else if(count == 2){
		      $('#op2').show();
		    }else if(count == 3){
		      $('#op3').show();
		    }else if(count == 4){
		      count--;
		    }
	    })
	});

	$("#minus").on("click" , function(){
	    count--;    
	    if(count == 2){	
	      $('#op3').hide();
	      $('#o3').val('');
	      $('#do3').val('');
	    }else if(count == 1){
	      $('#op2').hide();
	      $('#o2').val('');
	      $('#do2').val('');
	    }else if(count == 0){
	      $('#op1').hide();
	      $('#o1').val('');
	      $('#do1').val('');
	    }else if(count == -1){
	        count++;
	    }        
	});
	
	
	// 카테고리@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// 대분류 카테고리명 클릭하는 경우
	$('.depthOne').on("click", function(){
		
		var currentCategoryNum = $(this).attr("data-type");	
				
		$("#DepthThreeSpace").html('');
		
		$.ajax({
			url : "<%=request.getContextPath()%>/selectCategory",
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
					
					
					$("#DepthTwoSpace").html(htmls);
					
					}
					
					if(data == null) {
						
						$("#DepthTwoSpace").html('');
					}
	
				} 
				
		});
		
		
		

	})
	
	// 중분류 카테고리명 클릭하는 경우
	$(document).on("click", ".depthTwo", function(){
		
		var currentCategoryNum = $(this).attr("data-type");

		
		$.ajax({
			url : "<%=request.getContextPath()%>/selectCategory",
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
					
					
					$("#DepthThreeSpace").html(htmls);
					}
					
					if(data == null) {
						$("#DepthThreeSpace").html('');
					}
	
				} 
				
		});
		
	})
	
	// 소분류 카테고리명 클릭하는 경우
	$(document).on("click", ".depthThree", function(){
		
		var currentCategoryNum = $(this).attr("data-type");
		
		var currentCategoryName = $(this).html();
		
		$('#categoryNameView').val(currentCategoryName);
		
		$('input[name="categoryNum"]').val(currentCategoryNum);
		
	})

   </script>
</body>
</html>