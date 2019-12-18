<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="font.css">
<title>COMP322:Databases-Team9</title>
</head>
<body>
<h1>==menu==</h1>
<%
	out.println("<p>hi, "+ request.getParameter("Fname")+" "+request.getParameter("Lname")+
			"</p>");
	String Fname = request.getAttribute("Fname").toString();
	String Lname = request.getAttribute("Lname").toString();
	String AdminID = (request.getAttribute("AdminID")==null)?null:request.getAttribute("AdminID").toString();
	String UserID = request.getAttribute("UserID").toString();
%>
<br/>
<a href="firstMenu.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>1.Search</button></a>

<a href="secondMenu.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>2.Modify Account</button></a>

<a href="thirdMenu.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>3.Sales history</button></a>
</body>
</html>