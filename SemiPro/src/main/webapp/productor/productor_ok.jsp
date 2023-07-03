<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="../dbconn.jsp" %>

<title>처리중...</title>
</head>
<body>

<%
		String name = request.getParameter("obj_name");
		String kind = request.getParameter("obj_kind");
		String many = request.getParameter("obj_amount");
		String id = (String)session.getAttribute("id");
		String img = request.getParameter("obj_img");
		String date = request.getParameter("obj_date");
%>
<script>
alert('<%=name%>');
alert('<%=kind%>');
alert('<%=many%>');
alert('<%=id%>');
alert('<%=date%>');
</script>
		
<% 
		String sql = 
		"INSERT INTO product(name, Kind, Many, Productor_id, img, date)" 
		+ "VALUES(?,?,?,?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, kind);
			pstmt.setString(3, many);
			pstmt.setString(4, id);
			pstmt.setString(5, img);
			pstmt.setString(6, date);
			
		
			pstmt.executeUpdate();	
		
			pstmt.close();
			
		conn.close();

	
%>
<script>
window.location.href='productor.jsp';
</script>