<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page session="true"%>
<%@ include file="../dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="../css/admincss.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	 $(document).ready(function(){
		  var currentPosition = parseInt($("#quickmenu").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $("#quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
		  });
		});
	 
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
</script>
</head>
<body>
<div id="wrapper">
	<button style="float:right" onclick="return logout()">로그아웃</button>
	<header class="shadow">MLP&nbsp;쇼핑몰</header>
	<nav>
		<ul id="menu">
			<li id="menu_li"><button style="background-color:#BCC6CC;color:white;" onclick="location.href='./adminMain.jsp'">회원관리</button>
			<li id="menu_li"><button onclick="location.href='./adminProductor.jsp'">납품자관리</button>
			<li id="menu_li"><button onclick="location.href='./adminProduct.jsp'">식자재관리</button>
			<li id="menu_li"><button onclick="location.href='./adminPurchase.jsp'">거래내역</button>
		</ul>
	</nav>
	
	<div id="quickmenu">
		<button style="width:100%;bgcolor:white" onclick="goTop()">Top<br>맨 위로</button>
		<button style="width:100%;bgcolor:white" onclick="goBottom()">Bottom<br>맨 아래로</button>
	</div>
	
	<aside>
		<ul>
			<li><b>회원관리</b></li>
		</ul>
	</aside>
	
	<section>
	<table>
	<caption>회원관리</caption>
		<tr class="toptr"><th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>전화번호</th><th>주소</th><th></th></tr>
	<% String sql="select * from customer";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){%>
		<tr style="text-algin:center"><td><%=rs.getString("id") %></td><td><%=rs.getString("pwd") %></td><td><%=rs.getString("name") %></td>
		<td><%=rs.getString("email") %></td><td><%=rs.getString("tel") %></td><td><%=rs.getString("address") %></td>
		<td><button onclick="location.href='customerDelete.jsp?id=<%=rs.getString("id") %>'">삭제</button></td></tr>
	<%}%>
	</table>
	</section>
</div>
</body>
</html>