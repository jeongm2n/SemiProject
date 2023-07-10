<%@ page language="java" contentType="text/html; charset=UTF-8"	import=" java.util.*,Product.*"	pageEncoding="UTF-8"	isELIgnored="false" 
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../dbconn.jsp" %>


<title>납품 페이지</title>
<link rel="stylesheet" href="../css/productor.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	<%--스크롤 위치에 따라 product_input 위치 변경--%>
	 $(document).ready(function(){
		  var currentPosition = parseInt($("#product_input").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $("#product_input").stop().animate({"top":position+currentPosition+"px"},1000);
		  });
		});
	 
	 <%--로그아웃--%>
	 function logout(){
			if(confirm('로그아웃 하시겠습니까?')){
				alert('로그아웃 되었습니다.');
				window.location.href="${contextPath}/login/logout.jsp";
				return true;
			}
			else{
				return false;
			}	
	}
</script>

</head>
<body>

<div id="wrapper">
	<button id="btn1" onclick="return logout()">LogOut</button>
	<header>납품 페이지</header>
</div>
	<div id="product_input">
	<div id="input_table">
	    <%--method="post" enctype="multipart/form-data"를 이용해 이미지 정보를 addProduct.do로 전달--%>
		<form name="productorform" action="${contextPath}/product/addProduct.do"  method="post" enctype="multipart/form-data">
		  <br><br><a>납품 입력</a><br><br>
            <table class = "input_tb">
				<tr>
				 <td>
				  <label for="obj_name" class="label">제품명</label>
          		  <input type="text" name="name" id="obj_name" minlength='1' maxlength='10' required>
				 </td>
				</tr>
				<tr>
				 <td>
				  <label for="obj_kind" class="label">제품 종류</label>
				  <select name="kind" id="obj_kind" required>
									    <option value=""disabled selected>-선택-</option>
									    <option value="채소">채소</option>
									    <option value="육류">육류</option>
									    <option value="유제품">유제품</option>
									    <option value="소스류">소스류</option>
				  </select>
				 </td>
				</tr>
				<tr>
				 <td>
				  <label for="obj_amount" class="label">제품 갯수</label>
				  <input type="text" name="amount" id="obj_amount" minlength='1' maxlength='10' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
				 </td>
				</tr>
				<tr>
				 <td>
				  <label class="label">제품 사진</label>
				  <%--label을 이용해 파일 업로드 버튼 안보이게하고 대신 label을 클릭시 파일 업로드 창이 뜸--%>
        		  <label for="obj_img" class="filelabel">파일 업로드</label>
    			  <%--accept="image/*" 를 통해 이미지 파일만 들어올 수 있게--%>
				  <input type="file" id="obj_img" name="img" accept="image/*" required></td>
				 </tr>
				<tr>
				 <td>
				  <label for="obj_date" class="label">생산 일자</label>
				  <input type="date" name="date" id="obj_date" required>
				 </td>
				</tr>
				<tr>
				 <td>
				  <button type="submit" id="btn2">입력</button>
				 </td>
				</tr>
            </table>
        </form>
    </div>
	</div>
	
	<%--로그인시 서블릿에서 받아온 ProductList를 이용해 납품 내역 출력--%>
	<div id="productor_list">
		<a>최근 납품 내역</a><br><br>
		<table class="list_tb">
		 <thead>
		  <tr>
			<th>물품명</th> <th>종류</th> <th>수량</th> <th>생산 일자</th>
		  </tr>
		 </thead>
		 <tbody>
		 <c:choose> <%-- JSTL을 이용해 비었는지 체크 --%>
		    <c:when test="${ empty ProductList}" >
		      <tr>
		        <td colspan="5" align="center">
		          <b>납품 내역이 없습니다.</b>
		       </td>  
		      </tr>
		   </c:when>  
		   <c:when test="${!empty ProductList}" >
		      <c:forEach  var="pro" items="${ProductList}" >
		        <tr align="center">
		          <td>${pro.name }</td>
		          <td>${pro.kind }</td>
		          <td>${pro.many }</td>     
		          <td>${pro.date }</td>       
		       </tr>
		     </c:forEach>
		   </c:when>
		 </c:choose>
		     
		 </tbody>
		</table>
	</div>
	
	
	
	

<script> <%-- 오늘 날짜 이후는 선택 되지 않게 막는 스크립트--%>
var now_utc = Date.now()
var timeOff = new Date().getTimezoneOffset()*60000;
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("obj_date").setAttribute("max", today)
</script>	
</body>
</html>