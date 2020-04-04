<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UploadProduct</title>
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
			left: 1128px;
			float: right;
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
			background-color: rgba( 140, 140, 140, 0.3);
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
		
		.select_img img{
			height: 500px;
			width: 500px;
		}
		
		.select_thumbImg img{
			height:250px;
			width: 250px;
		}
		
		.detail div{
			text-align: right;
			margin-right: 10px;
		}
		
		.last{
			width: 150px;
			margin-left:900px;
		}
		
		.detailOptionSelect{
			width: 200px;
			height: 30px;
			margin-bottom: 5px;
		}
		
		#stock{
			width: 195px;
			height: 22px;
			margin-left: 3px;
		}
		
		#opMng{
			float: right;
		}
		
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
		
		var check = $("input[type='checkbox']");

		check.click(function() {
			$("p").toggle();
			chk();
		});
	});

		
</script>
</head>

<body>
	<b>
		<a href="<c:url value='/sellerPage'/>">판매자 페이지</a>
	</b>
	<div id="mm">
		<h1><i><a href="<c:url value='/main'/>">#ing</a></i></h1>
	</div>
	<form action="updateProductResult" method="post" enctype="multipart/form-data">
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
									<div id="categoryName${category.categoryNum}"><h4><a href="#" class="depthOne" data-type="${category.categoryNum}">${category.categoryName}</a></h4></div>
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
		      		<td class="td2">
		      			<input type="text" id="categoryNameView" value="${category.categoryName}">
						<input type="hidden" name="categoryNum" value="${category.categoryNum}">
		      		</td>
		      	</tr>
		      	<tr>
		      		<td class="td1">상품명</td>
		      		<td class="td2"><input type="text" name="productName" value="${product.productName }"></td>
		      	</tr>
		      	<tr>
		      		<td class="td1">상품수량</td>
		      		<td class="td2"><input type="number" name="stock" step="1" value="${product.stock }"></td>
		      	</tr>
		      	<tr>
		      		<td class="td1">상품가격</td>
		      		<td class="td2"><input type="number" name="productPrice" step="10" value="${product.productPrice }"></td>
		      	</tr>
		      	<tr>
		      		<td class="td1">상품 이미지</td>
		      		<td class="td2">
		      			<div class="select_img">
							<img src="opload/${product.productImage}">
							<input type="hidden" name="oriProductImage" value="${product.productImage}">
						</div><br>
						<input type="file" name="productImage" id="img">
		      		</td>
		      	</tr><tr>
		      		<td class="td1">상품 썸네일 이미지</td>
		      		<td class="td2">
						<div class="select_thumbImg">
							<img src="opload/${product.productThumb}">
							<input type="hidden" name="oriProductThumb" value="${product.productThumb }" >
						</div><br>
						<input type="file" name="productThumb" id="thumbImg">
		      		</td>
		      	</tr>
		      	<tr>
		      		<td class="td1">상품 설명</td>
		      		<td class="td2">
		      			<div class="detail">
							<textarea name="productText" id="area" >${product.productText }</textarea>
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
						  <input type="checkbox" name="productDisplay" id="dis" ${product.productDisplay == "TRUE" ? "checked" : ""}>
						  <span class="slider round"></span>
						</label>
						<p id="no">미진열</p><p id="yes">진열</p>
		      		</td>
		      	</tr>
		      	<tr>
		      		<td class="td1">상품 소재</td>
		      		<td class="td2"><input type="text" name="productMeterial" value="${product.productMeterial }"></td>
		      	</tr>
		      	<tr>
		      		<td class="td1">제조사</td>
		      		<td class="td2"><input type="text" name="manufacturer" value="${product.manufacturer }"></td>
		      	</tr>
		      	<tr>
		      		<td class="td1">제조 일자</td>
		      		<td class="td2">
		      			<input type="date" name="mfDate" id="mfDate" value="${product.mfDate }">
						<input type="hidden" name="hidden" id="hidden" value="n">
		      		</td>
		      	</tr>
		      	<tr>
		      		<td class="td1">원산지</td>
		      		<td class="td2"><input type="text" name="origin"  value="${product.origin }"></td>
		      	</tr>
		      	<tr>
		      		<td class="td1">배송비</td>
		      		<td class="td2"><input type="number" name="deliveryPrice" step="100" value="${product.deliveryPrice }"></td>
		      	</tr>
		      	<tr>
		      		<td class="td1">옵션 설정</td>
		      		<td class="td2">
		      			<div id="detailOptionBox1">
							<span id="dop1">
						  		1차 상세 옵션 <input type="text" name="optionOneDetail" id="doText1">&nbsp;&nbsp;<button type="button" id="do1_btn" class="btn" value="1">저장</button>&nbsp;&nbsp;<button type="button" id="do2_bt2" class="btn2" value="1">관리</button>
						 	</span>
						 </div>
						 <div class="optiondetail-scroll">
						 	<button type="button" class="dopclose" style="width:100%;">닫기</button>
									  	<table class="table table-hover member_table" style="width:400px;">
									  		<colgroup>
										        <col style="width:auto;" />
										    	<col style="width:30%;" />
										    </colgroup>
											<thead>
												<tr>
													<th>상세옵션명</th>
													<th>관리</th>
												</tr>
											</thead>
											<tbody id="onetbody">
												<c:forEach items="${onedo}" var="one" varStatus="status">
												<tr id="one${status.index}">
												<%-- <form action="${pageContext.request.contextPath}/detailOption" method="post"> --%>
													<td>${one.optionName}</td>
													<td><%-- input type="hidden" name="itemNo" value="${itemVo.no}" /> --%>
												<input type="hidden" name="no" id="oneDoNum${status.index}" value="${one.doNum}" /><button type="button" value="${status.index}" class="deleteDetailOption" style="width:100%;">삭제</button></td>
												<!-- </form> -->						
												</tr>
												</c:forEach>
											</tbody>
										</table>
						 </div>
						<div id="detailOptionBox2">
							<span id="dop2">
						  		2차 상세 옵션 <input type="text" name="optionTwoDetail" id="doText2">&nbsp;&nbsp;<button type="button" id="do2_btn" class="btn" value="2">저장</button>&nbsp;&nbsp;<button type="button" id="do2_btn2" class="btn2" value="2">관리</button>
							</span>
						</div>
						<div class="optiondetail-scroll">
						 	<button type="button" class="dopclose" style="width:100%;">닫기</button>
									  	<table class="table table-hover member_table" style="width:400px;">
									  		<colgroup>
										        <col style="width:auto;" />
										    	<col style="width:30%;" />
										    </colgroup>
											<thead>
												<tr>
													<th>상세옵션명</th>
													<th>관리</th>
												</tr>
											</thead>
											<tbody id="twotbody">
												<c:forEach items="${twodo}" var="two" varStatus="status">
												<tr id="two${status.index}">
												<%-- <form action="${pageContext.request.contextPath}/detailOption" method="post"> --%>
													<td>${two.optionName}</td>
													<td><%-- input type="hidden" name="itemNo" value="${itemVo.no}" /> --%>
												<input type="hidden" name="no" id="twoDoNum${status.index}" value="${two.doNum}" /><button type="button" value="${status.index}" class="deleteDetailOption" style="width:100%;">삭제</button></td>
												<!-- </form> -->
												</tr>
												</c:forEach>
											</tbody>
										</table>
						 </div>
						<div id="detailOptionBox3">
							<span id="dop3">
						  		3차 상세 옵션 <input type="text" name="optionThreeDetail" id="doText3">&nbsp;&nbsp;<button type="button" id="do3_btn" class="btn" value="3">저장</button>&nbsp;&nbsp;<button type="button" id="do3_btn3" class="btn2" value="3">관리</button>
							</span>
						</div>
						<div class="optiondetail-scroll">
						 	<button type="button" class="dopclose" style="width:100%;">닫기</button>
									  	<table class="table table-hover member_table" style="width:400px;">
									  		<colgroup>
										        <col style="width:auto;" />
										    	<col style="width:30%;" />
										    </colgroup>
											<thead>
												<tr>
													<th>상세옵션명</th>
													<th>관리</th>
												</tr>
											</thead>
											<tbody id="threetbody">
												<c:forEach items="${threedo}" var="three" varStatus="status">
												<tr id="three${status.index}">
												<%-- <form action="${pageContext.request.contextPath}/detailOption" method="post"> --%>
													<td>${three.optionName}</td>
													<td><%-- input type="hidden" name="itemNo" value="${itemVo.no}" /> --%>
												<input type="hidden" name="no" id="threeDoNum${status.index}" value="${three.doNum}" /><button type="button" value="${status.index}" class="deleteDetailOption" style="width:100%;">삭제</button></td>
												<!-- </form> -->
												</tr>
												</c:forEach>
											</tbody>
										</table>
						 </div><br>
						<div id="optionBox">
							<input type="hidden" id="h1" name="optionOneName" value="${product.optionOneName}">
							<input type="hidden" id="h2" name="optionTwoName" value="${product.optionTwoName}">
							<input type="hidden" id="h3" name="topnThreeName" value="${product.optionThreeName}">
							  <span id="op1">
							    1차 옵션&nbsp;&nbsp;<select name="optionOneName" class="detailOptionSelect" id="o1" >
							    	<option id="title1" value="0">${product.optionOneName}</option>
							    	<c:forEach var="one" items="${onedo}" varStatus="status">
							    	<option id="${one.doNum}" value="${one.doNum}">${one.optionName}</option>
							    	</c:forEach>
							    </select>
							  </span>
							  <br>
							  <span id="op2">
							    2차 옵션&nbsp;&nbsp;<select name="optionTwoName" class="detailOptionSelect" id="o2" >
							    	<option id="title2" value="0">${product.optionTwoName}</option>
							    	<c:forEach var="two" items="${twodo}" varStatus="status">
							    	<option id="${two.doNum}" value="${two.doNum}">${two.optionName}</option>
							    	</c:forEach>
							    </select>
							  </span>
							  <br>
							  <span id="op3">
							    3차 옵션&nbsp;&nbsp;<select name="optionThreeName" class="detailOptionSelect" id="o3" >
							    	<option id="title3" value="0">${product.optionThreeName}</option>
							    	<c:forEach var="three" items="${threedo}" varStatus="status">
							    	<option id="${three.doNum}" value="${three.doNum}">${three.optionName}</option>
							    	</c:forEach>
							    </select>
							  </span>
							  <br> 
							  &nbsp;&nbsp;수량&nbsp;　 <input id="stock" name="stock" type="number">
							  <button type="button" id="insertOption" name="insertOption" value="" disabled="disabled">추가</button>&nbsp;&nbsp;&nbsp;
							  <div>
							  <span>
							  	<button type="button" id="opMng" class="btn2" value="">옵션 관리</button>
							  </span>
							  <br>
							  </div>
							  <div class="col-sm-12 mb-2 optiondetail" >
							  	<button type="button" class="dopclose" style="width:100%;">닫기</button>
								<input type="hidden" name="itemNo" value="${itemVo.no}" />
								<input type="hidden" name="no" value="-1" id="option_delete_no" />						
								<div class="form-group row m-2">						
									<div class="col-sm-12">
										<h5>옵션관리</h5>
									</div>
									<div class="col-sm-4 mb-2" id="detailOptionOne">
										<label for="option1">1차 옵션</label>
										<select name="optionDetailNo1" class="formControl" id="option1">
											<option id="default1" value="0">선택</option>
												<c:forEach items="${onedo}" var="one">
													<option id="do${one.doNum}" value="${one.doNum}">${one.optionName}</option>
												</c:forEach>
										</select>
									</div>
									<div class="col-sm-4 mb-2" id="detailOptionTwo">
										<label for="option2">2차 옵션</label>
										<select name="optionDetailNo2" class="formControl" id="option2">
											<option id="default2" value="0">선택</option>
										    	<c:forEach items="${twodo}" var="two">
													<option id="do${two.doNum}" value="${two.doNum}">${two.optionName}</option>
												</c:forEach>
												<%-- <c:forEach items="${twodo}" var="two">
													<option id="do${two.doNum}" value="${two.doNum}">${two.optionName}</option>
												</c:forEach> --%>
										</select>
									</div>
									<div class="col-sm-4 mb-2" id="detailOptionThree">
										<label for="option2">3차 옵션</label>
										<select name="optionDetailNo3" class="formControl" id="option3">
										    <option id="default3" value="0">선택</option>
										    	<c:forEach items="${threedo}" var="three">
													<option id="do${three.doNum}" value="${three.doNum}">${three.optionName}</option>
												</c:forEach>
												<%-- <c:forEach items="${threedo}" var="three">
													<option id="do${three.doNum}" value="${three.doNum}">${three.optionName}</option>
												</c:forEach> --%>
										</select>
									</div>
									<div class="col-sm-4 mb-2">
										<label>수량</label>
										<input class="form-control" id="leftCnt" type="text" disabled />
									</div>
									<div class="col-sm-12 mb-2">
										<button type="button" class="deleteOption" style="width:100%;">삭제</button>
									</div>
								</div>
							</div>									
						</div>
		      		</td>
		      	</tr>
		      </tbody>
		</table>
		<div class="last">
			<input type="hidden" id="productNum" name="productNum" value="${product.productNum }">
			<br><br><input type="submit" value="저장">&nbsp;&nbsp;
			<input type="reset" value="초기화"><br><br><br>
		</div>
	</form>
<%-- <div id="optionBox">
  <span id="op1">
    1차 옵션&nbsp;&nbsp;<input type="text" name="optionOneName" id="o1" value="${product.optionOneName }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>
  <span id="op2">
    2차 옵션&nbsp;&nbsp;<input type="text" name="optionTwoName" id="o2" value="${product.optionTwoName }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>
  <span id="op3">
    3차 옵션&nbsp;&nbsp;<input type="text" name="optionThreeName" id="o3" value="${product.optionThreeName }">
  </span>  
</div> --%>


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
		$('#updateProductResult').submit();
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
    
    $(function(){
		if(document.getElementById("dis").checked == true){
			$("#no").attr('style' , 'display:none;');
			document.getElementById("dis").value = 'TRUE';
		} else {
			$("#yes").attr('style' , 'display:none;');
			document.getElementById("dis").value = 'FALSE';
		}					
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
    var count2 = 0;

	$(document).ready(function(){
		if($('#h1').val() == ''){
			$('#op1').hide();
			$('#op2').hide();
		    $('#op3').hide();
		    $('#dop1').hide();
			$('#dop2').hide();
		    $('#dop3').hide();
		    $('#detailOptionOne').hide();
		    $('#detailOptionTwo').hide();
		    $('#detailOptionThree').hide();
		    count = 0;
		}else if($('#h2').val() == ''){
			$('#op2').hide();
		    $('#op3').hide();
		    $('#dop2').hide();
		    $('#dop3').hide();
		    $('#detailOptionTwo').hide();
		    $('#detailOptionThree').hide();
		    count = 1;
		}else if($('#h3').val() == ''){
			$('#op3').hide();
			$('#dop3').hide();
			$('#detailOptionThree').hide();
			count = 2;
		}else if($('#h3').val() != ''){
			$('#op1').show();
			$('#op2').show();
			$('#op3').show();
			$('#dop1').show();
			$('#dop2').show();
			$('#dop3').show();
			count = 3;
		}})
	
	
	// 상품 상세 옵션 저장
	
	$(".btn").click(function(){
		var dis = $(this).val();
		var id = "#doText" + dis;
		var id2 = "";
		var id3 = "";
		
		if($(this).val() == 1) {
			id2 = "#onetbody";
			id3 = "#option1";
		}
		if($(this).val() == 2) {
			id2 = "#twotbody";
			id3 = "#option2";
		}
		if($(this).val() == 3) {
			id2 = "#threetbody";
			id3 = "#option3";
		}
		
		
		$.ajax({
			url : "<%=request.getContextPath()%>/insertDetailOption",
				type : "post",
				data : {
					optionLevel : dis,
					optionName : $(id).val(),
					productNum : $("#productNum").val()
				},
				
				success : function(data) {
					$("#o" + dis).append('<option id="' + data.doNum + '" value="' + data.doNum + '">' + data.optionName + '</option>')
					$("#doText" + dis).val('');
					$(id2).append('<tr><td>' + data.optionName + '</td><td><input type="hidden" name="no" value="' + data.doNum + '"/><button type="button" class="deleteDetailOption" style="width:100%;">삭제</button></td>');
					$(id3).append('<option id="do' + data.doNum +  '"value="' + data.doNum + '">' + data.optionName + '</option>');
					
				
					
					<%-- <tr id="one${status.index}">

					<form action="${pageContext.request.contextPath}/detailOption" method="post">


						<td>${one.optionName}</td>

						<td>input type="hidden" name="itemNo" value="${itemVo.no}" />

					<input type="hidden" name="no" id="oneDoNum${status.index}" value="${one.doNum}" /><button type="button" value="${status.in dex}" class="deleteDetailOptionOne" style="width:100%;">삭제</button></td>

					<!-- </form> -->

					</tr> --%>
				} 
				
		});
		
	});
	
	// 상품 옵션 저장
	
	$('#insertOption').click(function(){
		
		$.ajax({
			url : "<%=request.getContextPath()%>/insertOption",
				type : "post",
				data : {
					optionOneNum : $('#o1').val(),
					optionTwoNum : $('#o2').val(),
					optionThreeNum : $('#o3').val(),
					productNum : $('#productNum').val(),
					stock : $('#stock').val()
				},
				dataType: "text",
				
				success : function(data) {
					$("#title1").prop("selected", true);
					$("#title2").prop("selected", true);
					$("#title3").prop("selected", true);
					$("#stock").val("");
					if(data == "null") {
						alert("이미 추가한 옵션입니다.");
					}
				} 
				
		});
	})
	
	// 상세옵션관리버튼

	$(".btn2").click(function(){

		$(this).parent().parent().next().slideToggle(1);

	});

	// 상세옵션관리닫기

	$(".dopclose").click(function(){

		$(this).parent().slideToggle(1);

	});
	
	// 상세 상세 옵션 삭제
	
	$(document).on("click", ".deleteDetailOption" ,function(){
		var doNumStr = "#oneDoNum" + $(this).val();
		var str = "#one" + $(this).val();
		
		$.ajax({
			url : "<%=request.getContextPath()%>/deleteDetailOption",
				type : "post",
				data : {
					doNum : $(this).prev().val()
				},
				
				success : function(data) {
					var str2 = "#o1 " + "#" + data.doNum; 
					var str3 = "#o2 " + "#" + data.doNum;
					var str4 = "#o3 " + "#" + data.doNum;
					var str5 = "#do" + data.doNum;
					var str6 = "#do" + data.doNum;
					var str7 = "#do" + data.doNum;
					$(str2).remove();
					$(str3).remove();
					$(str4).remove();
					$(str5).remove();
					$(str6).remove();
					$(str7).remove();
				} 
				
		});
		$(this).parent().parent().remove();
		
	})
	
	// 상세 옵션 관리 고르는 액션
	
	// 1차 상세 옵션을 고르는 경우
	
	$("#option1").change(function(){
		
		$("#left_cnt").val("");
		$("#default2").prop("selected", true);
		$("#default3").prop("selected", true);
		
		var optionDetailNo1 = $(this).val();

		if(optionDetailNo1 == 0) {

			var htmls = '<option id="default2" value="0">선택</option>';

			$("#option2").html(htmls);
			
			var htmls = '<option id="default3" value="0">선택</option>';
			
			$("#option3").html(htmls);
			
			$("#leftCnt").val("");

			return;

		}
	
		$.ajax({
			url : "<%=request.getContextPath()%>/selectOptionOne",
				type : "post",
				data : {
					productNum : $("#productNum").val(),
					optionOneNum : $('#option1').val(),
					optionTwoNum : $('#option2').val(),
					optionThreeNum : $('#option3').val()
				},
				
				dataType : 'json',
				
				success : function(data) {
					
					var htmls = '<option id="default2" value="0">선택</option>';
					
					for(var i = 0 ; i < data.list.length ; i++) {
						var option = data.list[i];
						htmls += '<option id="do' + option.doNum + '"value="' + option.doNum + '">' + option.optionName + '</option>'
					}
					
					$("#option2").html(htmls);
					$("#option3").html('<option id="default3" value="0">선택</option>');
					$("#leftCnt").val("");
	
				} 
				
		});
		
	})
	
	// 2차 상세 옵션을 고르는 경우
	
	$("#option2").change(function(){
		
		$("#left_cnt").val("");
		$("#default3").prop("selected", true);
		
		var optionDetailNo1 = $(this).val();

		if(optionDetailNo1 == 0) {

			var htmls = '<option id="default3" value="0">선택</option>';

			$("#option3").html(htmls);
			
			$("#leftCnt").val("");
			
			return;

		}
	
		$.ajax({
			url : "<%=request.getContextPath()%>/selectOptionTwo",
				type : "post",
	
				data : {
					productNum : $("#productNum").val(),
					optionOneNum : $('#option1').val(),
					optionTwoNum : $('#option2').val(),
					optionThreeNum : $('#option3').val()
				},
				
				dataType : 'json',
				
				success : function(data) {
					
					var htmls = '<option id="default3" value="0">선택</option>';
					
					for(var i = 0 ; i < data.list.length ; i++) {
						var option = data.list[i];
						htmls += '<option id="do' + option.doNum + '"value="' + option.doNum + '">' + option.optionName + '</option>'
					}
					
					$("#option3").html(htmls);
	
				} 
				
		});
		
	})
	
	$("#option3").change(function(){
		
		$.ajax({
			url : "<%=request.getContextPath()%>/selectDetailOption",
				type : "post",
				data : {
					productNum : $("#productNum").val(),
					optionOneNum : $('#option1').val(),
					optionTwoNum : $('#option2').val(),
					optionThreeNum : $('#option3').val()
				},
				
				success : function(data) {
					var stock = data.stock;
					$("#leftCnt").val(stock);
				} 
				
		});
		
	}) 
	
	// 상품 옵션 삭제
	
	
	$(".deleteOption").click(function(){
	
		$.ajax({
			url : "<%=request.getContextPath()%>/deleteOption",
				type : "post",
				dataType : "text",
				data : {
					productNum : $("#productNum").val(),
					optionOneNum : $('#option1').val(),
					optionTwoNum : $('#option2').val(),
					optionThreeNum : $('#option3').val()
				},
				
				success : function(data) {
					$("#default1").prop("selected", true);
					$("#default2").prop("selected", true);
					$("#default3").prop("selected", true);
					$("#leftCnt").val("");
	
				} 
				
		});
		
	})
	
	// 추가 버튼 disabled 활성/비활성화
	
	$(".detailOptionSelect").change(function(){
		
		if($(this).val() != 0){
			if(count2 < 3) {
			count2++;;
			}
			console.log(count2);
		} else if($(this).val() == 0) {
			if(count2 > 0) {
			count2--;
			}
			console.log(count2);
		}
	
		
		if(count == count2) {
			$('#insertOption').removeAttr('disabled');
		} else if(count != count2) {
			$('#insertOption').attr('disabled', 'disabled');
		}
		
	})
	
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
	
	
	
	
	<%-- $(".deleteDetailOptionTwo").click(function(){
		var doNumStr = "#twoDoNum" + $(this).val();
		var str = "#two" + $(this).val();
		
		$.ajax({
			url : "<%=request.getContextPath()%>/deleteDetailOption",
				type : "post",
				data : {
					doNum : $(this).prev().val()
				},
				dataType: "text",
				
				success : function(data) {
					
				} 
				
		});
		$(this).parent().parent().remove();
		
	})
	
	$(".deleteDetailOptionThree").click(function(){
		var doNumStr = "#threeDoNum" + $(this).val();
		var str = "#three" + $(this).val();
		
		
		$.ajax({
			url : "<%=request.getContextPath()%>/deleteDetailOption",
				type : "post",
				data : {
					doNum : $(this).prev().val()
				},
				dataType: "text",
				
				success : function(data) {
		
				} 
				
		});
		
		$(this).parent().parent().remove();
		
	}) --%>

</script>
</body>
</html>