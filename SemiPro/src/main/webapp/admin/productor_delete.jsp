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
	PreparedStatement pstmt = null;
	String sql = "DELETE FROM productor WHERE id = ?";
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.executeUpdate();
		out.println("<script>alert('삭제되었습니다.'); location.replace('adminProductor.jsp');</script>");
		pstmt.close();
	} catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>