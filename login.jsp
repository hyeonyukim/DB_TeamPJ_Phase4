<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="font.css">
<link rel="stylesheet" href="maincss.css">
<title>COMP322:Databases-Team9</title>
</head>
<body>
<h2>Login Interface</h2>
<%-- --%>
<fieldset>
<legend>Login Interface</legend>
<form action = "test.jsp" method="post">
<p>UserID</p><input type="text" name="User_ID"><br>
<p>Password</p><input type="password" name="Password"><br>
<input type="submit" value="Login">
<!--  -->
${error}
</form>
</fieldset>
</body>
</html>