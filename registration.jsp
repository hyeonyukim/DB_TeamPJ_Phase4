<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="font.css">
<title>COMP322:Databases-Team9</title>
</head>
<body>
<h2>Registration Interface</h2>
<fieldset>
<legend>Registration Interface</legend>
<form action="test2.jsp" method="post">
<p>You must input the information which one with "*".</p>
<p>*FirstName</p><input type="text" name="FirstName"><br>
<p>*LastName</p><input type="text" name="LastName"><br>
<p>*Password</p><input type="password" name="password"><br>
<p>Address</p><input type="text" name="Address"><br>
<p>Phone</p><input type="number" name="Phone"><br>
<p>Birth Date(format:yyyy-mm-dd)</p><input type="text" name="Birth_Date"><br>
<p>Gender</p><input type="text" name="Gender"><br>
<p>Occupation</p><input type="text" name="Occupation"><br>
<input type="submit" value="Regist">
</form>
</fieldset>
</body>
</html>