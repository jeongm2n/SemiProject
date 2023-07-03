<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>

<%
	String dburl = "jdbc:mysql://localhost:3306/shop?useSSL=false&serverTimezone=UTC";
	String dbid = "root";                  
	String dbpwd = "campus";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(dburl, dbid, dbpwd);
%>
