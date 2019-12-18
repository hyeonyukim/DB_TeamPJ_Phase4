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
<h2>5.See every Sales history</h2>
<br/>
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
	ResultSet  res;
	String view = new String();
	
	try{
		sql = "SELECT * FROM SALES_HISTORY";
		rs = stmt.executeQuery(sql);
	
		int salesId;
		java.sql.Date salesDate;
		String checkout = new String();
		int vehicleID;
		int buyerID;
		int sellerID;
	
		while(rs.next()){
	
			salesId = rs.getInt(1);
			salesDate = rs.getDate(2);
			checkout = rs.getString(3);
			vehicleID = rs.getInt(4); 
			buyerID = rs.getInt(5);
			sellerID = rs.getInt(6);
	
			view = "ID = " + salesId + " Date = " + salesDate + " Checkout method = " + checkout + " Vehicle ID = " + vehicleID + " Buyer ID = " + buyerID + " Seller ID = " + sellerID + "";
			
			ResultSetMetaData rsmd;
			out.println("<table border=\"1\">");
			rsmd = rs.getMetaData();
			int cnt = rsmd.getColumnCount();
			for(int j=1; j<=cnt; j++){
				out.println("<th>"+rsmd.getColumnName(j)+"</th>");
			}
			out.println("<tr>");
			for(int j=0; j<cnt; j++)
				out.println("<td>"+rs.getString(j+1)+"</td>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr>");
				for(int j=0; j<cnt; j++)
					out.println("<td>"+rs.getString(j+1)+"</td>");
				out.println("</tr>");
			}
			out.println("</table>");	
		}
	}catch(SQLException e){
			e.printStackTrace();
	}
%>
<form method="post" action="returnToMenu2.jsp">
	<input type="hidden" name="Fname" value="<%=request.getParameter("Fname")%>"/>
	<input type="hidden" name="Lname" value="<%=request.getParameter("Lname")%>"/>
	<input type="hidden" name="AdminID" value="<%=request.getParameter("AdminID")%>"/>
	<input type="hidden" name="UserID" value="<%=request.getParameter("UserID")%>"/>
	<button>go back</button>
</form>
</body>
</html>