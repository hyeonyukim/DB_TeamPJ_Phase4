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
<h2>4.Register new Car</h2>
<br/>
<p>please fill up the form.</p>
<form method="post" action="fourthMenuResult.jsp">
	Price : <input type="text" name ="Price">
	<br/>
	Model : <input type="text" name ="Model">
	<br/>
	PopularModel(Y/N) : <input type="text" name="PopularModel"/>
	<br/>
	DetailedModel : <input type="text" name ="DetailedModel">
	<br/>
	Make : <input type="text" name ="Make">
	<br/>
	Driving Kilometer : <input type="text" name ="DrivingKilometer">
	<br/>
	Engine Displacement : <input type="text" name ="EngineDisplacement">
	<br/>
	Transmission : <input type="text" name ="Transmission">
	<br/>
	Fuel : <input type="text" name ="Fuel">
	<br/>
	Second Fuel : <input type="text" name ="FuelSecond">
	<br/>
	Color : <input type="text" name ="Color">
	<br/>
	Second Color : <input type="text" name ="ColorSecond">
	<br/>
	Category : <input type="text" name ="Category">
	<br/>
	Producing Country : <input type="text" name ="ProducingCountry">
	<br/>
	Date of Manufacture : <input type="text" name ="ManufactureDate">
	<br/>
	Visibility(Y/N) : <input type="text" name ="Visible">
	<br/>
	<input type="hidden" name="Fname" value="<%=request.getParameter("Fname")%>"/>
	<input type="hidden" name="Lname" value="<%=request.getParameter("Lname")%>"/>
	<input type="hidden" name="AdminID" value="<%=request.getParameter("AdminID")%>"/>
	<input type="hidden" name="UserID" value="<%=request.getParameter("UserID")%>"/>
	<input type = "Reset" value="Reset"/>
	<input type = "submit" value="Submit"/>
</form>
<%
	String Fname = request.getParameter("Fname");
	String Lname = request.getParameter("Lname");
	String AdminID = request.getParameter("AdminID");
	String UserID = request.getParameter("UserID");
%>
<a href="returnToMenu2.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>Go back</button></a>
</body>
</html>