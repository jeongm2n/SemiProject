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
<title>회원 가입 완료</title>
</head>
<body>
<%
	String Cus_id = request.getParameter("C_id");
	String Cus_pwd1 = request.getParameter("C_pwd_1");
	String Cus_name = request.getParameter("C_name");
	
	String Cus_emailId = request.getParameter("C_front");
	String Cus_damain = request.getParameter("C_domain");
	String Cus_email = Cus_emailId + "@" + Cus_damain;
	
	String Cus_first = request.getParameter("first"); //전화번호 맨 앞자리
	String Cus_second = request.getParameter("second"); //전화번호 중간 
	String Cus_third = request.getParameter("third"); // 전화번호 마지막
	String Cus_tel = Cus_first + "-" + Cus_second + "-" + Cus_third; //전화번호
	
	String Cus_addr = request.getParameter("Address");
	
	String sql = "INSERT INTO customer VALUES(?,?,?,?,?,?)";
	String sql2 = "SELECT * FROM customer";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);	
	
	ResultSet rs = null;
	// 이미 회원가입이 되어있는지 점검하는 코드, 중복이면 회원가입 페이지로 이동/ 아니면 회원가입을 진행
	try{
		rs = pstmt2.executeQuery();
		
		while(rs.next()){
			String id_confirm = rs.getString("id");
			
			if(id_confirm.equals(Cus_id)){
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
		//로그아웃을 했을 경우.
		session.setAttribute("C_id",Cus_id);
		session.setAttribute("C_pwd_1",Cus_pwd1);
		
		pstmt.setString(1, Cus_id);
		pstmt.setString(2, Cus_pwd1);
		pstmt.setString(3, Cus_name);
		pstmt.setString(4, Cus_email);
		pstmt.setString(5, Cus_tel);
		pstmt.setString(6, Cus_addr);
				
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