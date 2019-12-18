<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*, java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="font.css">
<title>COMP322:Databases-Team9</title>
</head>
<body>
<h2>===========Search failed===========</h2>
<p>You can't see the detail of the car. This car is already sold.</p>
<%
	String Fname = request.getParameter("Fname");
	String Lname = request.getParameter("Lname");
	String AdminID = request.getParameter("AdminID");
	String UserID = request.getParameter("UserID");
%>
<a href="returnToMenu2.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>Go back</button></a>
</body>
</html>