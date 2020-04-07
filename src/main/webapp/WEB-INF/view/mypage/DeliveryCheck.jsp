<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DeliveryCheck</title>
</head>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  

<body>
<div>
	<table id="myPtag"></table>
</div>
<br/>
<div>
	<table id="myPtag2"></table>
</div>
<script>

var orderNum = 0;

		// 배송정보와 배송추적 tracking-api
        $(document).ready(function() {
        	var myKey = "Mptc8WkAYQqshH6Q2Zn0Ug";
        	var t_code = "0${trackingCode}";
        	var t_invoice = "${trackingNum}";
        	orderNum = "${orderNum}"
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                	console.log(data);
                	var myInvoiceData = "";
                	if(data.status == false){
                		myInvoiceData += ('<p>'+data.msg+'<p>');
                	}else{
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"보내는사람"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.senderName+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"제품정보"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.itemName+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"송장번호"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.invoiceNo+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"송장번호"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.receiverAddr+'</td>');     				
	            		myInvoiceData += ('</tr>');           	                		
                	}
        			
                	
                	$("#myPtag").html(myInvoiceData)
                	
                	var trackingDetails = data.trackingDetails;
                	
                	
            		var myTracking="";
            		var header ="";
            		header += ('<tr>');            	
            		header += ('<th>'+"시간"+'</th>');
            		header += ('<th>'+"장소"+'</th>');
            		header += ('<th>'+"유형"+'</th>');
            		header += ('<th>'+"전화번호"+'</th>');     				
        			header += ('</tr>');     
            		
        			var values = "";
        			
            		$.each(trackingDetails,function(key,value) {
	            		myTracking += ('<tr>');            	
            			myTracking += ('<td>'+value.timeString+'</td>');
            			myTracking += ('<td>'+value.where+'</td>');
            			myTracking += ('<td>'+value.kind+'</td>');
            			myTracking += ('<td>'+value.telno+'</td>');     				
	            		myTracking += ('</tr>');     
	            		values += value.telno;
            		});
            		
            		$("#myPtag2").html(header+myTracking);
            		
            		
            		
            		var f = document.createElement("form");
        			
        			f.action="<%=request.getContextPath()%>/deliveryStateChange";
        			f.method="post";
        			
        			var elem = document.createElement("input");
        			
        			elem.setAttribute("type", "hidden");
        			elem.setAttribute("name", "values");
        			elem.setAttribute("value", values);
        			
					var elem2 = document.createElement("input");
        			
        			elem2.setAttribute("type", "hidden");
        			elem2.setAttribute("name", "orderNum");
        			elem2.setAttribute("value", orderNum);
        			
        			f.appendChild(elem);
        			f.appendChild(elem2);
        			
        			document.body.appendChild(f);
        			
        			f.submit();
                	
                }
            });
        });
		
/* }); */


</script>
</body>
</html>