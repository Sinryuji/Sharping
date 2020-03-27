<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UploadProduct</title>
<style>
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
<h1>SellerPage</h1>
상품 업로드 <br><br>
<form action="updateProductResult" method="post" enctype="multipart/form-data">
판매자 : <input type="text" name="id" value="${authInfo.id}" readonly><br><br>

카테고리 분류<br><br>
<input type="number" name="categoryNum" value="${product.categoryNum }"><br><br>

상품명  <input type="text" name="productName" value="${product.productName }"><br><br>

상품수량  <input type="number" name="stock" step="1" value="${product.stock }"><br><br>

상품가격  <input type="number" name="productPrice" step="10" value="${product.productPrice }"><br><br>

상품 이미지<br><br>
<input type="file" name="productImage" id="img"><br><br>
<div class="select_img">
	<img src="upload/${product.productImage}" style="width:500px;">
	<input type="hidden" name="oriProductImage" value="${product.productImage}">
</div>

<script>
  $("#img").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
</script>

productThumb <br><br>
<input type="file" name="productThumb" id="thumbImg"><br><br>
<div class="select_thumbImg">
	<img src="upload/${product.productThumb}" style="width:250px;">
	<input type="hidden" name="oriProductThumb" value="${product.productThumb }" >
</div>

<script>
  $("#thumbImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_thumbImg img").attr("src", data.target.result).width(250);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
</script>

상품 설명<br><br>
<div>
<textarea name="productText" id="area" >${product.productText }</textarea><br>
<span id="counter">0</span><span> / 500</span>
</div>

productDisplay &nbsp;&nbsp;
<label class="switch">
  <input type="checkbox" name="productDisplay" id="dis" ${product.productDisplay == "TRUE" ? "checked" : ""}>
  <span class="slider round"></span>
</label>
<p id="no">미진열</p><p id="yes">진열</p><br><br>

상품소재  <input type="text" name="productMeterial" value="${product.productMeterial }"><br><br>

제조사  <input type="text" name="manufacturer" value="${product.manufacturer }"><br><br>

제조일자  <input type="date" name="mfDate" id="mfDate" value="${product.mfDate }"><br><br>
<input type="hidden" name="hidden" id="hidden" value="n">

원산지  <input type="text" name="origin"  value="${product.origin }"><br><br>

배송비  <input type="number" name="deliveryPrice" step="100" value="${product.deliveryPrice }"><br><br>

<br>옵션설정  <br><br>

<input type="button" id="plus" value="옵션 추가">&nbsp;&nbsp;<input type="button" id="minus" value="옵션 삭제" ><br><br>
<div id="detailOptionBox">
	<span id="dop1">
  		상세 옵션 <input type="text" name="optionOneDetail" id="do1">&nbsp;&nbsp;<input type="button" id="do1_btn" value="저장">
 	</span>
	<span id="dop2">
  		상세 옵션 <input type="text" name="optionTwoDetail" id="do2">&nbsp;&nbsp;<input type="button" id="do2_btn" value="저장">
	</span>
	<span id="dop3">
  		상세 옵션 <input type="text" name="optionThreeDetail" id="do3">&nbsp;&nbsp;<input type="button" id="do3_btn" value="저장">
	</span>
</div><br>

<div id="optionBox">
  <span id="op1">
    1차 옵션&nbsp;&nbsp;<input type="text" name="optionOneName" id="o1" value="${product.optionOneName }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>
  <span id="op2">
    2차 옵션&nbsp;&nbsp;<input type="text" name="optionTwoName" id="o2" value="${product.optionTwoName }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </span>
  <span id="op3">
    3차 옵션&nbsp;&nbsp;<input type="text" name="optionThreeName" id="o3" value="${product.optionThreeName }">
  </span>  
</div>

<input type="hidden" name="productNum" value="${product.productNum }">
<br><br><input type="submit" value="저장">&nbsp;&nbsp;
<input type="reset" value="초기화"><br><br><br>
</form>
<script>
    
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

	$(function(){
		if($('#o1').val() == ''){
			$('#op1').hide();
			$('#op2').hide();
		    $('#op3').hide();
		    $('#dop1').hide();
			$('#dop2').hide();
		    $('#dop3').hide();
		}else if($('#o2').val() == ''){
			$('#op2').hide();
		    $('#op3').hide();
		    $('#dop2').hide();
		    $('#dop3').hide();
		    count++;
		}else if($('#o3').val() == ''){
			$('#op3').hide();
			$('#dop3').hide();
			count++;
			count++;
		}else if($('#o3').val() != ''){
			$('#op1').show();
			$('#op2').show();
			$('#op3').show();
			$('#dop1').show();
			$('#dop2').show();
			$('#dop3').show();
		}
	    $("#plus").click(function(){
		    count++;
		    if(count == 1){
		      $('#op1').show();
		      $('#dop1').show();
		    }else if(count == 2){
		      $('#op2').show();
		      $('#dop2').show();
		    }else if(count == 3){
		      $('#op3').show();
		      $('#dop3').show();
		    }else if(count == 4){
		      count--;
		    }
	    })
	});

	$("#minus").on("click" , function(){
	    count--;    
	    if(count == 2){	
	      $('#op3').hide();
	      $('#dop3').hide();
	      $('#o3').val('');
	      $('#do3').val('');
	    }else if(count == 1){
	      $('#op2').hide();
	      $('#dop2').hide();
	      $('#o2').val('');
	      $('#do2').val('');
	    }else if(count == 0){
	      $('#op1').hide();
	      $('#dop1').hide();
	      $('#o1').val('');
	      $('#do1').val('');
	    }else if(count == -1){
	        count++;
	    }        
	});

</script>
</body>
</html>