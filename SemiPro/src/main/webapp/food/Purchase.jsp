<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page session="true"%>
	<%@ include file="../dbconn.jsp"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user_id = (String)session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String productor_id = request.getParameter("productor_id");
	String sub = request.getParameter("sub");
	
	String sql1 = "insert into purchase values('"+user_id+"','"+name+"',"+num+",'"+productor_id+"','"+sub+"',DEFAULT)"; 
	String sql2 = "update product set many=many-"+num+" where name='"+name+"'";
	
	PreparedStatement pstmt = conn.prepareStatement(sql1);
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	
	pstmt.executeUpdate();
	pstmt2.executeUpdate();
	
	out.println("<script>alert('구매되셨습니다.'); location.replace('../Main.jsp');</script>");
%>
</body>
</html>