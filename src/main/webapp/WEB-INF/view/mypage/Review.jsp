<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style>
		table{
		    border-collapse: collapse;
		    line-height: 1.5;
			width:500px;
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
		
		.b {
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

		.b:hover {
	  		background-color: #FFB2F5;
	  		box-shadow: 0px 15px 20px hotpink;
	  		color: #fff;
	  		transform: translateY(-7px);
		}
		
		textarea{
			min-width: 350px;
			min-height: 150px;
			resize: none;
			overflow: hidden;
			outline: none;
		}
		
		#star_grade a{
	        text-decoration: none;
	        color: gray;
	    }
	    
	    #star_grade a.on{
	        color: #FAED7D;
	    }
	    
	    p{
	    	margin: 0;
	    }
	    
	    span{
	    	color: red;
	    	font-size:10px;
	    }
	    
	    #id{
	    	text-decoration: none;
	    }
		
</style>

</head>
<body>
	<form id="form">
		<table>
			<colgroup>
				<col style="width:30%;" />
				<col style="width:auto;" />
			</colgroup>
			<thead>
				<tr>
					<th colspan="2">구매 후기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="td1">작성자</td>
					<td class="td2"><input type="text" name="id" id="id" value="${authInfo.id}" readonly></td>
				</tr>
				<tr>
					<td class="td1">별점</td>
					<td class="td2">
						<p id="star_grade">
					        <a data-num="1" href="#">★</a>
					        <a data-num="2" href="#">★</a>
					        <a data-num="3" href="#">★</a>
					        <a data-num="4" href="#">★</a>
					        <a data-num="5" href="#">★</a>
						</p>
						<span>*별점을 부여하지 않으면 1점(별 1칸)으로 적용됩니다.</span>
						<input type="hidden" name="score" id="score" value="0">
					</td>
				</tr>
				<tr>
					<td class="td1">제목</td>
					<td class="td2"><input type="text" name="reviewTitle" placeholder="제목을 입력해 주십시오." required></td>
				</tr>
				<tr>
					<td class="td1">내용</td>
					<td class="td2"><textarea name="reviewText" placeholder="후기를 작성하여 주십시오." required></textarea></td>
				</tr>
				<tr>
					<td class="td1">포토후기</td>
					<td class="td2"><input type="file" name="reviewImage"></td>
				</tr>
			</tbody>
		</table>
		<br>
		<div align="center">
			<input type="hidden" name="orderNum" id="orderNum" value="">
			<input type="button" value="등록" class="b" id="submit">
			<input type="button" class="b" value="닫기" onclick="window.close()">
		</div>
	</form>
<script>
	
	$('#star_grade a').click(function(){
	    $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	    $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	    var sc = $(this).attr("data-num");
	    if(sc == 1){
	    	$("#score").val(1);
	    } else if(sc == 2){
	    	$("#score").val(2);
	    } else if(sc == 3){
	    	$("#score").val(3);
	    } else if(sc == 4){
	    	$("#score").val(4);
	    } else if(sc == 5){
	    	$("#score").val(5);
	    }
	});
	
 	$(document).ready(function(){
 		document.getElementById("orderNum").value = opener.document.getElementById("on").value;
	});
	
	$(document).on("click", "#submit", function(){
		var formData = new FormData($("#form")[0]);
	      $.ajax({
	         url : "<%=request.getContextPath()%>/insertReview",
	         type : "post",
	         enctype: "multipart/form-data",
	         processData: false,
	         contentType: false,
	         data : formData,
	            success: function(data) {
	            	/* opener.$("#review").attr('disabled', 'disabled'); */
	            	alert('후기가 등록되었습니다.');
	        		window.close();
	            }
	      });
	   });

	
</script>
</body>
</html>