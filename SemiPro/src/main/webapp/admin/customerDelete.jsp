<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	String id = request.getParameter("id");
	String sql = "delete from customer where id='"+id+"'";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	
	out.println("<script>alert('삭제되었습니다.'); location.replace('./adminMain.jsp');</script>");
	
%>
</body>
</html>