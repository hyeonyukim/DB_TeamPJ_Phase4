<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<h2>Search</h2>
<fieldset>
<legend>SEARCH</legend>
<form action="firstMenuResult.jsp" method="post">
<p>Enter Engine_value (If you want to skip, just go next step)</p>
<input type="text" name = "Engine_value"><br>
<p>Please input the "> < =" about Engine_value(If you want to skip, just go next step)</p>
<input type="text" name = "Engine_symbol"><br>
<p>Enter Model_value (If you want to skip, just go next step)</p>
<input type="text" name = "Model_value"><br>
<p>Enter Popular_model"Y/N" (If you want to skip, just go next step)</p>
<input type="text" name = "Popular_model"><br>
<p>Enter Transmission_value (If you want to skip, just go next step)</p>
<input type="text" name = "Transmission_value"><br>
<p>Enter Fuel_value (If you want to skip, just go next step)</p>
<input type="text" name ="Fuel_value"><br>
<p>Enter Fuel_second (If you want to skip, just go next step)</p>
<input type="text" name = "Fuel_second"><br>
<p>Enter Color_value (If you want to skip, just go next step)</p>
<input type="text" name = "Color_value"><br>
<p>Enter Color_second (If you want to skip, just go next step)</p>
<input type="text" name = "Color_second"><br>
<p>Enter Category_value (If you want to skip, just go next step)</p>
<input type="text" name = "Category_value"><br>
<p>Enter Make_value (If you want to skip, just go next step)</p>
<input type="text" name = "Make_value"><br>
<p>Enter ProducingCountry (If you want to skip, just go next step)</p>
<input type="text" name = "ProducingCountry"><br>
<p>Enter Kilometer_value (If you want to skip, just go next step)</p>
<input type="text" name = "Kilometer_value"><br>
<p>Please input the "> < =" about kilometer_value(If you want to skip, just go next step)</p>
<input type="text" name = "Kilometer_symbol"><br>
<p>Enter Price_value (If you want to skip, just go next step)</p>
<input type="text" name = "Price_value"><br>
<p>Please input the "> < =" about Price_value(If you want to skip, just go next step)</p>
<input type="text" name = "Price_symbol"><br>
<p>Enter DetailedModel_value (If you want to skip, just go next step)</p>
<input type="text" name = "DetailedModel_value"><br>
<input type = "submit" value="Search"/>
<button name="back">back to the menu</button>
<input type="hidden" name="Fname" value="<%=request.getParameter("Fname")%>"/>
<input type="hidden" name="Lname" value="<%=request.getParameter("Lname")%>"/>
<input type="hidden" name="AdminID" value="<%=request.getParameter("AdminID")%>"/>
<input type="hidden" name="UserID" value="<%=request.getParameter("UserID")%>"/>
</form>
</fieldset>
</body>
</html>