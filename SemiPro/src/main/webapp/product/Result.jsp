<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page session="true"%>
<%@ include file="../dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MLP 쇼핑몰</title>
<link rel="stylesheet" href="../css/mycss.css">
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
			 window.location.href="../login/login.jsp";
		 }
	 }
	 
	 function goTop(){
		 window.scrollTo(0,0);
	 }
	 function goBottom(){
		 window.scrollTo(0,document.body.scrollHeight);
	 }
</script>
<%
	String str = request.getParameter("str");
	String sql = "select product.name,many,img,company from product,productor where product.productor_id=productor.id and kind='"+str+"'";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
</head>
<body>
<div id="wrapper">
	<%
	String user_id = (String)session.getAttribute("id");
	if(user_id==null){%>
		<button style="float:right" onclick="return loginpage()">로그인</button>
	<%}
	else{%>
		<button style="float:right" onclick="logout()">로그아웃</button>
	<%}
%>
	<button style="float:right" onclick="location.href='../Main.jsp'">홈으로</button>
	<header class="shadow">MLP&nbsp;쇼핑몰</header>
	<nav>
		<ul id="menu">
			<li id="menu_li"><button onclick="location.href='Result.jsp?str=채소'">채소</button>
			<li id="menu_li"><button onclick="location.href='Result.jsp?str=육류'">육류</button>
			<li id="menu_li"><button onclick="location.href='Result.jsp?str=유제품'">유제품</button>
			<li id="menu_li"><button onclick="location.href='Result.jsp?str=소스류'">소스류</button>
		</ul>
	</nav>
	
	<div id="quickmenu">
		<button style="width:100%;bgcolor:white" onclick="goTop()">Top<br>맨 위로</button>
		<button style="width:100%;bgcolor:white" onclick="goBottom()">Bottom<br>맨 아래로</button>
	</div>
	<section>
		<%
		while(rs.next()){
			String name = rs.getString("name");
			String many = rs.getString("many");
			String company = rs.getString("company");
			String img = rs.getString("img");%>
			<div class="div">
			<form>
			<table style="width:100%;text-align:center;vertical-align:center">
				<tr><td><img src="../img/<%=img %>" style="width:300px;heigth:200px"/></td>
				<td>상품명 : <%=name %></td>
				<td>재고 : <%=many %></td>
				<td>납품업체 : <%=company %></td>
				<td><input type="text" style="width:50px"/>개<br><br><input type="submit" value="구매"/></td></tr>
			</table>
			</form>
			</div>
		<%}
		%>
	
	</section>
</div>
</body>
</html>