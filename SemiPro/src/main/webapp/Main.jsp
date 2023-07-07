<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,Product.*"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>  
<%
request.setCharacterEncoding("UTF-8");
%>
<%@page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MLP 쇼핑몰</title>
<link rel="stylesheet" href="${contextPath}/css/mycss.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- 제이쿼리 사용을 위함 -->
<script>
	 $(document).ready(function(){
		  var currentPosition = parseInt($("#quickmenu").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $("#quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
		  });				/* 퀵메뉴를 위치시킬 스크롤 값(top:position) + 현재 스크롤의 위치(currentPosition) */
		});
	 
	 function loginpage(){
		 if(true){
			 window.location.href="${contextPath}/login/login.jsp";
		 }
	 }
	 
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
	 
	 function goTop(){
		 window.scrollTo(0,0); /* 스크롤을 제일 위로 올림 */
	 }
	 function goBottom(){
		 window.scrollTo(0,document.body.scrollHeight); /* 현재 스크롤의 가장 아래로 내림  */
	 }
	 
</script>
</head>
<body>
<div id="wrapper">
<%
	String user_id = (String)session.getAttribute("id");
	if(user_id==null){%>
		<button style="float:right" onclick="return loginpage()">로그인</button>
	<%}
	else{%>
		<button style="float:right" onclick="return logout()">로그아웃</button>
	<%}
%>
	<header class="shadow">MLP&nbsp;쇼핑몰</header>
	<nav>
		<ul id="menu"> <!-- 버튼을 클릭하면 서블릿인 product의 showProducts.do 액션으로 str의 값이 넘어감 -->
			<li id="menu_li"><button onclick="location.href='${contextPath}/product/showProducts.do?str=채소'">채소</button>
			<li id="menu_li"><button onclick="location.href='${contextPath}/product/showProducts.do?str=육류'">육류</button>
			<li id="menu_li"><button onclick="location.href='${contextPath}/product/showProducts.do?str=유제품'">유제품</button>
			<li id="menu_li"><button onclick="location.href='${contextPath}/product/showProducts.do?str=소스류'">소스류</button>
		</ul>
	</nav>
	
	<div id="quickmenu">
		<button style="width:100%;bgcolor:white" onclick="goTop()">Top<br>맨 위로</button>
		<button style="width:100%;bgcolor:white" onclick="goBottom()">Bottom<br>맨 아래로</button>
	</div>
	<section>
	<h1 style="margin-left:5%;">전체 상품</h1>
	<div class="container">
		<c:forEach var="food" items="${allList }">
			<div class="item">		<!-- 제품 이미지와 제품명 불러오기 -->
			<img class="mainimg" src="${contextPath}/img/${food.img }"/><br>
			<b style="font-size:14pt;">${food.name }</b></div>
		</c:forEach>
	</div>
	</section>
</div>
</body>
</html>