<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MLP 쇼핑몰</title>
<link rel="stylesheet" href="./css/mycss.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	 $(document).ready(function(){
		  var currentPosition = parseInt($("#quickmenu").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $("#quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
		  });
		});
	 
	 function loginpage(){
		 if(true){
			 window.location.href="./login/login.jsp";
		 }
	 }
	 
	function logout(){
		if(confirm('로그아웃 하시겠습니까?')){
			alert('로그아웃 되었습니다.');
			window.location.href="./login/logout.jsp";
			return true;
		}
		else{
			return false;
		}	
	 }
	 
	 function goTop(){
		 window.scrollTo(0,0);
	 }
	 function goBottom(){
		 window.scrollTo(0,document.body.scrollHeight);
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
		<ul id="menu">
			<li id="menu_li"><button onclick="location.href='./product/Result.jsp?str=채소'">채소</button>
			<li id="menu_li"><button onclick="location.href='./product/Result.jsp?str=육류'">육류</button>
			<li id="menu_li"><button onclick="location.href='./product/Result.jsp?str=유제품'">유제품</button>
			<li id="menu_li"><button onclick="location.href='./product/Result.jsp?str=소스류'">소스류</button>
		</ul>
	</nav>
	
	<div id="quickmenu">
		<button style="width:100%;bgcolor:white" onclick="goTop()">Top<br>맨 위로</button>
		<button style="width:100%;bgcolor:white" onclick="goBottom()">Bottom<br>맨 아래로</button>
	</div>
	<section>
	<h1>당근</h1><br>
	<h2>양파</h2><br>
	<h3>돼지고기</h3><br>
	<h4>소고기</h4><br>
	<h5>우유</h5><br>
	<h6>계란</h6><br>
	간장<br>
	참기름<br>
	물<br>
	식용유<br>
	<br>
	고추장<br>
	<br>
	된장<br>
	<br>
	소금<br>
	<br>
	설탕<br>
	<br>
	맛술<br>
	<br>
	식초<br>
	<br>
	마요네즈<br>
	<br>
	케찹<br>
	<br>
	
	</section>
</div>
</body>
</html>