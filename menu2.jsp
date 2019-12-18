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
	
	String Fname;
	String Lname;
	String AdminID;
	String UserID;
	
	Fname = request.getAttribute("Fname").toString();
	Lname = request.getAttribute("Lname").toString();
	AdminID = (request.getAttribute("AdminID")==null)?null:request.getAttribute("AdminID").toString();
	UserID = request.getAttribute("UserID").toString();
	
	out.println("<p>hi, "+ Fname+" "+Lname+"</p>");
%>
<br/>
<a href="firstMenu.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>1.Search</button></a>

<a href="secondMenu.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>2.Modify Account</button></a>

<a href="thirdMenu.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>3.Sales history</button></a>
<br/>
<a href="fourthMenu.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>4.Register new car</button></a>

<a href="fifthMenu.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>5.See every Sales history</button></a>

<a href="sixthMenu.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>6.Sales Summary</button></a>

<a href="seventhMenu.jsp?Fname=<%=URLEncoder.encode(Fname)%>&Lname=<%=URLEncoder.encode(Lname)%>&AdminID=<%=(AdminID==null)?null:URLEncoder.encode(AdminID)%>&UserID=<%=URLEncoder.encode(UserID)%>"><button>7.Modify vehicle</button></a>

</body>
</html>