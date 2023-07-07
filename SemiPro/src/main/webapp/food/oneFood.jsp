<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,Product.*"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  
<% 
request.setCharacterEncoding("UTF-8");
%> 

<%@page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매하기</title>
<link rel="stylesheet" href="../css/mycss.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%String user_id = (String)session.getAttribute("id"); %>
<script>
	 
	 function loginpage(){
		 if(true){
			 window.location.href="../login/login.jsp";
		 }
	 }
	 
	 function logout(){
			if(confirm('로그아웃 하시겠습니까?')){
				alert('로그아웃 되었습니다.');
				window.location.href="../login/logout.jsp";
				return true;
			}
			else{
				return false;
			}	
	 }
	 
	 function login_chk(){
		 var login_id = <%=user_id%>;
		 if(!login_id){
			 alert('로그인을 먼저 해주세요!');
			 window.location.href="../login/login.jsp";
			 return false;
		 }
		 else{
			 var num = document.getElementById("num").value;
			 if(!num){
				 alert('구매하실 수량을 입력해주세요!');
				 return false;
			 }else{return true;}
		 }
	 }
</script>
</head>
<body>
<div id="wrapper">
	<%
	if(user_id==null){%>
		<button style="float:right" onclick="return loginpage()">로그인</button>
	<%}
	else{%>
		<button style="float:right" onclick="return logout()">로그아웃</button>
	<%}
%>
	<button style="float:right" onclick="location.href='${contextPath}/product/Main.do'">홈으로</button>
	<header class="shadow">MLP&nbsp;쇼핑몰</header>
	<nav>
		<ul id="menu">
			<li id="menu_li"><button onclick="location.href='${contextPath}/product/showProducts.do?str=채소'">채소</button>
			<li id="menu_li"><button onclick="location.href='${contextPath}/product/showProducts.do?str=육류'">육류</button>
			<li id="menu_li"><button onclick="location.href='${contextPath}/product/showProducts.do?str=유제품'">유제품</button>
			<li id="menu_li"><button onclick="location.href='${contextPath}/product/showProducts.do?str=소스류'">소스류</button>
		</ul>
	</nav>
	
	<section>
		<div style="padding-top:2%">
			<table id="table2" style="width:100%;">
			<tr><td style="width:50%" rowspan='7'><img style="width:100%" src="../img/${food.img }"/></td></tr>
			<tr><th class="thtd">상품명</th><td class="thtd">${food.name }</td></tr>
			<tr><th class="thtd">생산일자</th><td class="thtd">${food.date }</td></tr>
			<tr><th class="thtd">남은 수량</th><td class="thtd">${food.many }</td></tr>
			<tr><th class="thtd">카테고리</th><td class="thtd">${food.kind }</td></tr>
			<tr><th class="thtd">납품업체</th><td class="thtd">${food.company }</td></tr>
			<tr><th class="thtd">판매자ID</th><td class="thtd">${food.id }</td></tr>
			</table>
			<br>
			
			<form style="float:right;width:50%" action="${contextPath}/product/Purchase.do" onSubmit="return login_chk()">
				<table style="width:100%">
					<tr><td style="width:70%;font-size:13pt;text-align:right">정기 구매를 하시겠습니까?<p style="font-size:11pt;">혜택:배송비 무료, 20%할인<p></td>
					<td style="width:30%;font-size:14pt;"><input type="radio" name="sub" value="o">예
					<input type="radio" name="sub" value="o">아니오</tr>
					<tr><td style="text-align:right"><input type="text" style="height:25px" name="num"/>
					<input type="hidden" name="id" value="<%=user_id%>"/>
					<input type="hidden" name="name" value="${food.name }"/>
					<input type="hidden" name="productor_id" value="${food.id }"/></td>
					<td style="text-align:center"><input type="submit" value="구매하기"/></td></tr>
				</table>
			</form>
		</div>
	</section>
</div>
</body>
</html>