<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page session="true"%>
<%@ include file="../dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래내역 관리</title>
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
			<li id="menu_li"><button onclick="location.href='./adminMain.jsp'">회원관리</button>
			<li id="menu_li"><button onclick="location.href='./adminProductor.jsp'">납품자관리</button>
			<li id="menu_li"><button onclick="location.href='./adminProduct.jsp'">식자재관리</button>
			<li id="menu_li"><button style="background-color:#BCC6CC;color:white;" onclick="location.href='./adminPurchase.jsp'">거래내역</button>
		</ul>
	</nav>
	
	<div id="quickmenu">
		<button style="width:100%;bgcolor:white" onclick="goTop()">Top<br>맨 위로</button>
		<button style="width:100%;bgcolor:white" onclick="goBottom()">Bottom<br>맨 아래로</button>
	</div>
	
	<aside>
		<ul style="padding-left:5px;padding-top:20px;">
			<li><b>거래내역관리</b></li>
		</ul>
	</aside>
	
	<section>
	<table style="text-align:center">
	<caption>거래내역</caption>
	<tr class="toptr"><th>고객id</th><th>구매상품</th><th>구매수량</th><th>납품자id</th><th>장기거래여부</th><th>구매일자</th></tr>
	<%String sql = "SELECT * FROM purchase";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

	while(rs.next()){
		String fulldate = rs.getString("date");
		String date = fulldate.substring(0,10);%>
		<tr><td><%=rs.getString("customer_id") %></td><td><%=rs.getString("name") %></td>
		<td><%=rs.getString("many") %></td><td><%=rs.getString("productor_id") %></td>
		<td><%=rs.getString("subscribe") %></td><td><%=date %></td></tr>
			
	<%}%>
	</table>
	</section>
</div>
</body>
</html>