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
<script type="text/javascript" src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script> <!-- on/off 토글 버튼 (진열 여부) -->
<script>
/*  $(document).on('keyup', '#area', function(e){
    var area = $(this).val();
    $('#counter').text(getBytes(area));    
});
 
function getBytes(str){
    var cnt = 0;
    for(var i =0; i<str.length;i++) {
        cnt += (str.charCodeAt(i) >128) ? 2 : 1;
    }
    return cnt;
}


$(document).ready(function(){
	$('#area').on('keyup',function(){
		if($(this).val().length > 500) {
			$(this).val($(this).val().substring(0 , 500));
		}
	});
}); */


/* var check = $("input[type='checkbox']");
check.click(function(){
	$("p").toggle();
});

function chk(){
	if (document.getElementById("dis").checked == true){
			document.getElementById("dis").value = 'true';
		}else{
			document.getElementById("dis").value = 'false';
		}
} */


</script>
</head>
<body>
<h1>SellerPage</h1>
상품 업로드 <br><br>
<form action="uploadCompleteProduct" method="post">
판매자 : <input type="text" name="id" value="이은호"><br><br>

카테고리 분류<br><br>
<input type="number" name="categoryNum"><br><br>
<!-- 
<select name="categoryA">
	<option value="">카테고리(대)</option>
	<option value="1">대 - 1</option>
	<option value="2">대 - 2</option>
	<option value="3">대 - 3</option>
</select>&nbsp;&nbsp;
<select name="categoryB">
	<option value="">카테고리(중)</option>
	<option value="1">중 - 1</option>
	<option value="2">중 - 2</option>
	<option value="3">중 - 3</option>
</select>&nbsp;&nbsp;
<select name="categoryC">
	<option value="">카테고리(소)</option>
	<option value="1">소 - 1</option>
	<option value="2">소 - 2</option>
	<option value="3">소 - 3</option>
</select><br><br>
 -->
상품명  <input type="text" name="productName"><br><br>

상품수량  <input type="number" name="stock" step="1"><br><br>

상품가격  <input type="number" name="productPrice" step="10"><br><br>

상품 이미지<br><br>
<input type="file" name="productImage" id="img"><br><br>
<div class="select_img"><img src=""></div>

<%-- <script>
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
<%=request.getRealPath("/") %> --%>


<br><br>상품 설명<br><br>
<div>
<textarea name="productText" id="area"></textarea><br>
</div>
<div>
<span id="counter">0</span>&nbsp;<span>/ 1000 bytes</span>
</div>

productDisplay &nbsp;&nbsp;
<label class="switch">
  <input type="checkbox" name="productDisplay" id="dis" value="false" onclick="chk();">
  <span class="slider round"></span>
</label>
<p>미진열</p><p style="display:none;">진열</p><br><br>


productThumb &nbsp;<input type="text" name="productThumb"><br><br>


상품소재  <input type="text" name="productMeterial"><br><br>

제조사  <input type="text" name="manufacturer" id="manufacturer"><br><br>


제조일자  <input type="date" name="mfDate" id="mfDate"><br><br>

<script>
$('#mfDate').change(function() {
	  var dataEnd = $(this).val();
	  console.log((new Date(dataEnd)).getTime());
	  var timestamp_end = Date.parse(dataEnd);
	  $(this).val(timestamp_end);
	  console.log(timestamp_end);
	});

</script>

원산지  <input type="text" name="origin"><br><br>

배송비  <input type="number" name="deliveryPrice" step="100"><br><br>

<br>옵션설정  <br><br>
옵션1 <input type="number" name="optionOneNum"><br><br>
옵션2 <input type="number" name="optionTwoNum"><br><br>
옵션3 <input type="number" name="optionThreeNum"><br><br>

<input type="submit" value="저장">&nbsp;&nbsp;
<input type="reset" value="초기화">
</form>
</body>
</html>