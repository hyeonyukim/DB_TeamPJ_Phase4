<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="font.css">
<title>COMP322:Databases-Team9</title>
</head>
<body>
<h1>6.Sales Summary</h1>

<form method="post" action="sixthMenuResult.jsp">
	Make : <input type="text" name="Make" value="Every make">
	<br>
	<br>
	Month
	<select name="Month">
		<option value="0">Every</option>
  		<option value="1">January</option>
  		<option value="2">February</option>
  		<option value="3">March</option>
 		<option value="4">April</option>
 		<option value="5">May</option>
 		<option value="6">June</option>
 		<option value="7">July</option>
 		<option value="8">August</option>
 		<option value="9">September</option>
 		<option value="10">October</option>
 		<option value="11">November</option>
 		<option value="12">December</option>
	</select>
	Year
	<select name="Year">
		<option value="0">Every</option>
  		<option value="2007">2007</option>
  		<option value="2008">2008</option>
  		<option value="2009">2008</option>
 		<option value="2010">2010</option>
 		<option value="2011">2011</option>
 		<option value="2012">2012</option>
 		<option value="2013">2013</option>
 		<option value="2014">2014</option>
 		<option value="2015">2015</option>
 		<option value="2016">2016</option>
 		<option value="2017">2017</option>
 		<option value="2018">2018</option>
 		<option value="2019">2019</option>
 		<option value="2020">2020</option>
	</select>	

	<br>
	<br>
	<input type="submit" name="Submit"> 
	<input type="hidden" name="Fname" value="<%=request.getParameter("Fname")%>"/>
	<input type="hidden" name="Lname" value="<%=request.getParameter("Lname")%>"/>
	<input type="hidden" name="AdminID" value="<%=request.getParameter("AdminID")%>"/>
	<input type="hidden" name="UserID" value="<%=request.getParameter("UserID")%>"/>
</form>
</body>
</html>