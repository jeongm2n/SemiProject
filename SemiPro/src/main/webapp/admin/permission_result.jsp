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
<%String result = request.getParameter("result");
String id = request.getParameter("id");

if(result.equals("yes")){
	String sql = "INSERT INTO productor select * from regist where id='"+id+"'";
	String sql2 = "DELETE FROM regist WHERE id='"+id+"'";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	pstmt.executeUpdate();
	pstmt2.executeUpdate();
	out.println("<script>alert('승인되었습니다.'); location.replace('adminPermission.jsp');</script>");
}
else if(result.equals("no")){
	String sql = "DELETE FROM regist WHERE id='"+id+"'";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	out.println("<script>alert('승인이 거절되었습니다.'); location.replace('adminPermission.jsp');</script>");
}
%>
<%=result %>
<%=id %>
</body>
</html>