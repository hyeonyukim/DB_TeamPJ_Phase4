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
<%
String Fname = request.getParameter("Fname");
String Lname = request.getParameter("Lname");
String AdminID = request.getParameter("AdminID");
String UserID = request.getParameter("UserID");
request.setAttribute("Fname", Fname);
request.setAttribute("Lname", Lname);
request.setAttribute("AdminID", AdminID);
request.setAttribute("UserID", UserID);
if(AdminID.equals("null"))
	request.getRequestDispatcher("menu2.jsp").forward(request, response);
else
	request.getRequestDispatcher("menu1.jsp").forward(request, response);
%>
</body>
</html>