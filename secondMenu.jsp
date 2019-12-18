<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="font.css">
<title>COMP322:Databases-Team9</title>
</head>
<body>
<h2>Modify Account</h2>
<fieldset>
<legend>Registration Interface</legend>
<form action="test3.jsp" method="post">
<p>what field of you account to you want to modify ?</p>
<select name="select">
<option value="">please choose</option>
<option value="1">First name</option>
<option value="2">Last name</option>
<option value="3">Address</option>
<option value="4">Birth date</option>
<option value="5">Password</option>
<option value="6">Phone number</option>
<option value="7">Gender</option>
<option value="8">Occupation</option>
</select><br>
<p>please input your new information</p>
<input type="text" name="newIF"><br>
<input type="hidden" name="Fname" value="<%=request.getParameter("Fname")%>"/>
<input type="hidden" name="Lname" value="<%=request.getParameter("Lname")%>"/>
<input type="hidden" name="AdminID" value="<%=request.getParameter("AdminID")%>"/>
<input type="hidden" name="UserID" value="<%=request.getParameter("UserID")%>"/>
<input type = "submit" name = "Submit" value="Submit"/>
${succ}
<button name="back" value="back">Back to last page</button>
</form>
</fieldset>
</body>
</html>