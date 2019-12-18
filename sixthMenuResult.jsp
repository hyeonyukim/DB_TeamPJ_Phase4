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
<h2>6.Sales Summary</h2>
<%
	String severIP = "localhost";
	String strSID = "xe";
	String portNum = "1600";
	String user = "knu";
	String pass = "comp322";
	String url = "jdbc:oracle:thin:@"+severIP+":"+portNum+":"+strSID;
	
	Connection conn = null;
	Statement stmt;
	ResultSet rsSet;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	stmt = conn.createStatement();
	String sql;
	int year;
	int month;
	
	String make = request.getParameter("Make");
	
	year = Integer.parseInt(request.getParameter("Year"));
	month = Integer.parseInt(request.getParameter("Month"));
	double sales;
	//month
	if((make.equals("Every make")) && (month != 0) && (year == 0)) {
		String mth=null;
		switch(month){
		case 1:mth="January";break;
		case 2:mth="Febuary";break;
		case 3:mth="March";break;
		case 4:mth="April";break;
		case 5:mth="May";break;
		case 6:mth="June";break;
		case 7:mth="July";break;
		case 8:mth="August";break;
		case 9:mth="September";break;
		case 10:mth="October";break;
		case 11:mth="November";break;
		case 12:mth="December";break;
		default: break;
		}
		sql = "SELECT  P.Price_value\n"
				+"FROM    VEHICLE V, PRICE P, SALES_HISTORY S \n"
				+"WHERE   V.Price_id = p.Price_id \n"
				+"AND     S.Vehicle_id =V.Vehicle_id \n"
				+"AND     to_char(S.Sales_date, 'Month') Like '%"+mth+"%'";
		try {
			rsSet = stmt.executeQuery(sql);
			while(rsSet.next()){
				sales=Double.parseDouble(""+rsSet.getInt(1));
				out.println("<p>Total sales in " + month + " is " + sales + "</p>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
					
	}
	//year
	
	else if((make.equals("Every make")) && (month == 0) && (year != 0)) {
		
		String startingDate="TO_DATE('"+year+"-1-1', 'YYYY-MM-DD')";
		String endDate="TO_DATE('"+(year+1)+"-1-1', 'YYYY-MM-DD')";
		
		sql = "SELECT  SUM(P.Price_value)\n" + 
				"FROM    VEHICLE V, PRICE P, SALES_HISTORY S\n" + 
				"WHERE   V.Price_id = p.Price_id\n" + 
				"AND     S.Vehicle_id =V.Vehicle_id\n" + 
				"AND     S.Sales_date BETWEEN "+startingDate+"\n" + 
				"        AND "+endDate;
		try {
			rsSet = stmt.executeQuery(sql);
			while(rsSet.next())
				out.println("<p>Total sales in " + year + " is " + rsSet.getInt(1) + "</p>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	else if((make.equals("Every make")) && (month != 0) && (year != 0)) {
		
		String startingDate="TO_DATE('"+year+"-"+month+"-1', 'YYYY-MM-DD')";
		String endDate;
		if(month==12)
			endDate="TO_DATE('"+(year+1)+"-"+"1-1', 'YYYY-MM-DD')";
		else
			endDate="TO_DATE('"+(year)+"-"+(month+1)+"-1', 'YYYY-MM-DD')";
		
		sql = "SELECT  SUM(P.Price_value)\n" + 
				"FROM    VEHICLE V, PRICE P, SALES_HISTORY S\n" + 
				"WHERE   V.Price_id = p.Price_id\n" + 
				"AND     S.Vehicle_id =V.Vehicle_id\n" + 
				"AND     S.Sales_date BETWEEN "+startingDate+"\n" + 
				"        AND "+endDate;
		try {
			rsSet = stmt.executeQuery(sql);
			while(rsSet.next())
				out.println("<p>Total sales in " + year + "-" + month + " is " + rsSet.getInt(1) + "</p>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	else if(!(make.equals("Every make")) && (month == 0) && (year != 0)) {
		
		String startingDate="TO_DATE('"+year+"-1-1', 'YYYY-MM-DD')";
		String endDate="TO_DATE('"+(year+1)+"-1-1', 'YYYY-MM-DD')";
		
		sql = "SELECT  SUM(P.Price_value)\n" + 
				"FROM    VEHICLE V, PRICE P, SALES_HISTORY S, MAKE M\n" + 
				"WHERE   V.Price_id = p.Price_id\n" + 
				"AND     S.Vehicle_id =V.Vehicle_id\n" + 
				"AND     S.Sales_date BETWEEN "+startingDate+"\n" + 
				"AND "+endDate	+
				"AND     M.Make_id = V.Make_id\n" + 
				"AND     M.Make_value = '"+ make+ "'";
		try {
			rsSet = stmt.executeQuery(sql);
			while(rsSet.next())
				out.println("<p>Total sales in " + year + " made by " + make + " is " + rsSet.getInt(1) + "</p>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	else if(!(make.equals("Every make")) && (month != 0) && (year == 0)) {
		String mth=null;
		switch(month){
		case 1:mth="January";break;
		case 2:mth="Febuary";break;
		case 3:mth="March";break;
		case 4:mth="April";break;
		case 5:mth="May";break;
		case 6:mth="June";break;
		case 7:mth="July";break;
		case 8:mth="August";break;
		case 9:mth="September";break;
		case 10:mth="October";break;
		case 11:mth="November";break;
		case 12:mth="December";break;
		default: break;
		}
		
		sql = "SELECT  P.Price_value\n"
				+"FROM    VEHICLE V, PRICE P, SALES_HISTORY S Make M\n"
				+"WHERE   V.Price_id = p.Price_id \n"
				+"AND     S.Vehicle_id =V.Vehicle_id \n"
				+"AND	V.make_id=M.make_id\n"		
				+"AND     to_char(S.Sales_date, 'Month') Like '%"+mth+"%'" + 
				"AND     M.Make_value = '"+ make+ "'";
		try {
			rsSet = stmt.executeQuery(sql);
			while(rsSet.next())
				out.println("<p>Total sales in " + month + " made by " + make + " is " + rsSet.getInt(1) + "</p>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	else if(!(make.equals("Every make")) && (month != 0) && (year != 0)) {
		
		String startingDate="TO_DATE('"+year+"-"+month+"-1', 'YYYY-MM-DD')";
		String endDate;
		if(month==12)
			endDate="TO_DATE('"+(year+1)+"-"+"1-1', 'YYYY-MM-DD')";
		else
			endDate="TO_DATE('"+(year)+"-"+(month+1)+"-1', 'YYYY-MM-DD')";
		
		sql = "SELECT  SUM(P.Price_value)\n" + 
				"FROM    VEHICLE V, PRICE P, SALES_HISTORY S, MAKE M\n" + 
				"WHERE   V.Price_id = p.Price_id\n" + 
				"AND     S.Vehicle_id =V.Vehicle_id\n" + 
				"AND     S.Sales_date BETWEEN "+startingDate+"\n" + 
				"AND "+endDate	+
				"AND     M.Make_id = V.Make_id\n" + 
				"AND     M.Make_value = '"+ make+ "'";
		try {
			rsSet = stmt.executeQuery(sql);
			while(rsSet.next())
				out.println("<p>Total sales in " + year + "-" + month + " made by " + make + " is " + rsSet.getInt(1) + "</p>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//make
	else if(!(make.equals("Every make")) && (month == 0) && (year == 0)) {
		sql = "SELECT  SUM(P.Price_value)\n" + 
				"FROM    VEHICLE V, PRICE P, SALES_HISTORY S, MAKE M\n" + 
				"WHERE   V.Price_id = p.Price_id\n" + 
				"AND     S.Vehicle_id =V.Vehicle_id\n" + 
				"AND     M.Make_id = V.Make_id\n" + 
				"AND     M.Make_value = '"+ make+ "'";
		
		try {
			rsSet = stmt.executeQuery(sql);
			while(rsSet.next())
				out.println("<p>Total sales of " + make + " is " + rsSet.getInt(1) + "</p>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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