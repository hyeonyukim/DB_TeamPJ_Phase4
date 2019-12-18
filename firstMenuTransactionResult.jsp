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
<%
	//for docker
	String severIP = "localhost";
	String strSID = "xe";
	String portNum = "1600";
	String user = "knu";
	String pass = "comp322";
	String url = "jdbc:oracle:thin:@"+severIP+":"+portNum+":"+strSID;
	Connection conn = null;
	Statement stmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	stmt = conn.createStatement();
	String sql;
	
	
	sql = "select max(sales_id) from sales_history";
	rs = stmt.executeQuery(sql);
	int newSalesID=-1;
	int saledVehicleID = Integer.parseInt(request.getParameter("vehicleID"));
	int sellerID = 1;
	int buyerID = Integer.parseInt(request.getParameter("UserID"));
	String SalesDate = request.getParameter("salesDate");
	String CheckoutMethod = request.getParameter("payMethod");
	while(rs.next()) 
		newSalesID = rs.getInt(1)+1;
	sql = "insert into sales_history values("+newSalesID+",TO_DATE('"+SalesDate+"','YYYY-MM-DD'), '"+
	CheckoutMethod+"', "+saledVehicleID+", "+buyerID+", "+sellerID+")";
	stmt.executeUpdate(sql);
	
	String Fname = request.getParameter("Fname");
	String Lname = request.getParameter("Lname");
	String AdminID = request.getParameter("AdminID");
	String UserID = request.getParameter("UserID");
	request.setAttribute("Fname", Fname);
	request.setAttribute("Lname", Lname);
	request.setAttribute("AdminID", AdminID);
	request.setAttribute("UserID", UserID);
	if(AdminID.equals("null"))
		request.getRequestDispatcher("menu2.jsp").forward(request, response);
	else
		request.getRequestDispatcher("menu1.jsp").forward(request, response);
%>

</body>
</html>
	