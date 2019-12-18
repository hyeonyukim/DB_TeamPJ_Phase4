<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="font.css">
<title>COMP322:Databases-Team9</title>
<style>
#nav>ul>li{
	float:left:
	margin-left:50px:
}
#login{
	clear:both:
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="login">
	<a href="login.jsp" rel="external nofollow"><button>LOGIN</button></a>
</div>
<div id="registration">
	<a href="registration.jsp" rel="external nofollow"><button>REGISTRATION</button></a>
</div>
<%@include file="footer.jsp" %>
</body>
</html>