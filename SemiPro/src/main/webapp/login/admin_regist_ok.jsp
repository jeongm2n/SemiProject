<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
    
<%@ include file="../dbconn.jsp" %> <!-- 본인의 dbcon.jsp를 사용하시면 됩니다. -->
<html>
<head>
<meta charset="utf-8">
<title>관리자 등록 페이지</title>
</head>
<body>
<%
	String Adm_id = request.getParameter("A_id");
	String Adm_pwd1 = request.getParameter("A_pwd_1");
	String Adm_name = request.getParameter("A_name");
	
	String Adm_emailId = request.getParameter("A_front");
	String Adm_domain = request.getParameter("A_domain");
	String Adm_email = Adm_emailId + "@" + Adm_domain;
	
	String sql = "INSERT INTO manager VALUES(?,?,?,?)";
	String sql2 = "SELECT * FROM manager";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);	
	
	ResultSet rs = null;
	// 이미 회원가입이 되어있는지 점검하는 코드, 중복이면 회원가입 페이지로 이동/ 아니면 회원가입을 진행
	try{
		rs = pstmt2.executeQuery();
		
		while(rs.next()){
			String id_confirm = rs.getString("id");
			
			if(id_confirm.equals(Adm_id)){
				out.println("<script>alert('"+id_confirm+"은(는) 중복되었습니다.');</script>");
				out.print("<script> history.back();</script>");
				conn.close();
				return;
			}
		}
	} catch(SQLException e){
		e.printStackTrace();
	} finally{
		if(rs != null){
			rs.close();
		}
	}
	
	try {
		/*
		session의 칸
		*/
		
		pstmt.setString(1, Adm_id);
		pstmt.setString(2, Adm_pwd1);
		pstmt.setString(3, Adm_name);
		pstmt.setString(4, Adm_email);
				
		pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null && !pstmt.isClosed()) {
				pstmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
					
	conn.close();	
%>

	<script>
		alert('가입되었습니다.');
		window.location.href='login.jsp';
	</script>
</body>
</html>