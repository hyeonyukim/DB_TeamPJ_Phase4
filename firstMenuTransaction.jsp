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

<form method="post" action="firstMenuTransactionResult.jsp">
	<p>Please input the vehicle_id which car you want see the detail</p>
	Enter purchase date :<input type="date" name="salesDate">
	<br>
	Enter purchase method :<input type="text" name="payMethod">
	<br>
   	<input type = "submit" value="Enter"/>
	<input type="hidden" name="Fname" value="<%=request.getParameter("Fname")%>"/>
   	<input type="hidden" name="Lname" value="<%=request.getParameter("Lname")%>"/>
   	<input type="hidden" name="AdminID" value="<%=request.getParameter("AdminID")%>"/>
   	<input type="hidden" name="UserID" value="<%=request.getParameter("UserID")%>"/>
   	<input type="hidden" name="vehicleID" value="<%=request.getParameter("vehicleID")%>"/>
</form>
</body>
</html>
	