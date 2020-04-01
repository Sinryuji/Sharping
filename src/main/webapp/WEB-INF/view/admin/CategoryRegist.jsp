<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form role="form" method="post" autocomplete="off">
 
 <label>대분류</label>
 <select class="category1">
  <option value="">전체</option>
 </select>
 
 <label>중분류</label>
 <select class="category2">
  <option value="">전체</option>
 </select>
 
 <label>소분류</label>
 <select class="category3">
  <option value="">전체</option>
 </select>
 
<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var category1Arr = new Array();
var category1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
 
 if(jsonData[i].level == "1") {
	 category1Obj = new Object();  //초기화
	 category1Obj.categoryNum = jsonData[i].categoryNum;
	 category1Obj.categoryName = jsonData[i].categoryName;
  	 category1Arr.push(category1Obj);
 }
}

// 1차 분류 셀렉트 박스에 데이터 삽입
var category1Select = $("select.category1")

for(var i = 0; i < cate1Arr.length; i++) {
	category1Select.append("<option value='" + category1Arr[i].categoryNum + "'>"
      + category1Arr[i].categoryName + "</option>"); 
}

</script> 
 
</form>
</body>
</html>