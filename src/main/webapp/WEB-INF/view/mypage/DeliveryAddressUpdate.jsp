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
	
<style>

#container {
	position:absolute;
	top:0;
	left:0;
	width:100%;
	height:100%;
	text-align:center
}

#containerBox {
	display:inline-block;
	vertical-align:middle;
}

.blank {
	display:inline-block;
	width:0;
	height:100%;
	vertical-align:middle;
}

.dm {
	padding-bottom: 10px;
}

#btnUpda, #btnCanc,#selAdd {
	    width: 100px;
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

#btnUpda:hover, #btnCanc:hover, #selAdd:hover {
     background-color: #FFB2F5;
     box-shadow: 0px 15px 20px hotpink;
     color: #fff;
     transform: translateY(-7px);
}

</style>
	
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

	<article>
		<section id="container">
			<div id="containerBox">
				<h5>배송주소록 등록</h5>

			<form name="form" id="form" action="deliveryAddressUpdateComplete">
				<div class="dm">
					<label for=daaName>배송지명</label>
					<input type="text" name="newDaaName" id="newDaaName" value="${deliveryAddress.daaName}">
				</div>
				<div class="dm">
					<label for=daName>이름</label>
					<input type="text" name="daName" id="daName" value="${deliveryAddress.daName}">
				</div>
				<div class="dm">
					<label for=daPhone>연락처 </label>
					<input type="text" name="daPhone" id="daPhone" value="${deliveryAddress.daPhone}">
				</div>
				<div class="dm">
					<label for=daPost>우편번호</label>
					<input type="text" name="daPost" id="daPost" readonly value="${deliveryAddress.daPost}"/>
					<input type="button" id="selAdd" onClick="openDaumZipAddress();" value="주소 찾기" /> 
				</div>
				<div class="dm">	
					<label for=daAddress>주소</label>
					<input type="text" name="daAddress" id="daAddress" style="width:300px;" readonly value="${deliveryAddress.daAddress}"/>
				</div>
				<div class="dm">	
					<label for=daAddressEtc>상세주소</label>
					<input type="text" name="daAddressEtc" id="daAdressEtc" value="${deliveryAddress.daAddressEtc}">	
				</div>
				<input type="hidden" name="id" id="id" value="${authInfo.id}">
				<input type="hidden" name="daaName" id="daaName" value="${deliveryAddress.daaName}">
				
		 	</form>  
		 	 
		 	    <div>
		 	    <button type="button" id="btnUpda">수정</button>
		 	    <button type="button" id="btnCanc">취소</button>
				</div>

			</div>
			<span class="blank"></span>			
		</section>
	</article>

<script>
$(document).on('click', '#btnUpda', function() {
	
	if(daaName.value==""){
        alert("배송지명을 입력해주세요.");
        daaName.focus();
        return false;
    }else if(daName.value==""){
        alert("이름을 입력해주세요.");
        daName.focus();
        return false;
    }else if(daPhone.value==""){
        alert("연락처를 입력해주세요.");
        daPhone.focus();
        return false;
    }else if(daPost.value==""){
        alert("주소를 입력해주세요.");
        daPost.focus();
        return false;
    }else{
        alert("주소록이 수정됩니다!");
    }
	
	$("#form").submit();
	
	window.close();
});

$(document).on('click','#btnCanc',function() {
	window.close();
});
</script>

</body>
</html>