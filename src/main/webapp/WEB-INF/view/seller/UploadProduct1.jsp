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
<form action="uploadCompleteProduct" method="post" enctype="multipart/form-data">
판매자 : <input type="text" name="id" value="이은호"><br><br>

카테고리 분류<br><br>
<input type="number" name="categoryNum"><br><br>

상품명  <input type="text" name="productName"><br><br>

상품수량  <input type="number" name="stock" step="1"><br><br>

상품가격  <input type="number" name="productPrice" step="10"><br><br>

상품 이미지<br><br>
<input type="file" name="productImage" id="img"><br><br>
<div class="select_img"><img src=""></div>

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
<div class="select_thumbImg"><img src=""></div>

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
<textarea name="productText" id="area"></textarea><br>
<span id="counter">0</span><span> / 500</span>
</div>

productDisplay <br><br>
<label class="switch">
  <input type="checkbox" name="productDisplay" id="dis">
  <span class="slider round"></span>
</label>
<p>미진열</p><p style="display:none;">진열</p><br><br>
<!-- <input type="checkbox" name="productDisplay" id="dis"><br><br> -->



상품소재  <input type="text" name="productMeterial"><br><br>

제조사  <input type="text" name="manufacturer"><br><br>

제조일자  <input type="date" name="mfDate" id="mfDate"><br><br>
<input type="hidden" name="hidden" id="hidden" value="n">

원산지  <input type="text" name="origin"><br><br>

배송비  <input type="number" name="deliveryPrice" step="100"><br><br>

<br>옵션설정  <br><br>

옵션1 <input type="number" name="optionOneNum"><br><br>
옵션2 <input type="number" name="optionTwoNum"><br><br>
옵션3 <input type="number" name="optionThreeNum"><br><br>



<br><br><input type="submit" value="저장">&nbsp;&nbsp;
<input type="reset" value="초기화"><br><br><br>
</form>
<script>

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

	
</script>
</body>
</html>