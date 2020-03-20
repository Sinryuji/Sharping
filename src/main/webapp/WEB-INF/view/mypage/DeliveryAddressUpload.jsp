<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeliveryAddressUpload</title>
<!-- 카카오 주소 찾기 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					$("#daPost").val(data.zonecode);
					$("#daAddress").val(data.address);
					$("#addressEtc").focus();
					console.log(data);
				}
			}).open();
		}
</script>
</head>
<body>
<form action="deliveryAddressUploadComplete">
배송지명 : <input type="text" name="daaName" id="daaName"><br>
이름 : <input type="text" name="daName" id="daName"><br>
연락처 : <input type="text" name="daPhone" id="daPhone"><br>
우편번호:<input type="text" name="daPost" id="daPost" readonly /> &nbsp;
주소:<input type="text" name="daAddress" id="daAddress" readonly /> &nbsp;
상세주소:<input type="text" name="daAddressEtc" id="daAdressEtc"> &nbsp; <input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /> <br> 
<input type="hidden" name="id" id="id" value="${authInfo.id }">
<input type="submit" value="등록">
</form>
</body>
</html>