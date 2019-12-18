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
	
	String [][] Newcar2 = new String [2][13];
	ResultSet rsSet;
	Newcar2 [0][0] = "Vehicle_id";
	Newcar2 [0][1] = "Model_year";
	Newcar2 [0][2] = "Kilometer_id";
	Newcar2 [0][3] = "Price_id";
	Newcar2 [0][4] = "DetailedModel_id";
	Newcar2 [0][5] = "Model_id";
	Newcar2 [0][6] = "Engine_id";
	Newcar2 [0][7] = "Transmission_id";
	Newcar2 [0][8] = "Fuel_id";
	Newcar2 [0][9] = "Color_id";
	Newcar2 [0][10] = "Category_id";
	Newcar2 [0][11] = "Make_id";
	Newcar2 [0][12] = "Visible";
	
	String []Newcar3 = new String[13];
	Newcar3[0] = "VEHICLE";
	Newcar3[2] = "DRIVING_KILOMETERS";
	Newcar3[3] = "PRICE";
	Newcar3[4] = "DETAILEDMODEL";
	Newcar3[5] = "MODEL";
	Newcar3[6] = "ENGINE_DISPLACEMENT";
	Newcar3[7] = "TRANSMISSION";
	Newcar3[8] = "FUEL";
	Newcar3[9] = "COLOR";
	Newcar3[10] = "CATEGORY";
	Newcar3[11] = "MAKE";
	for(int i = 0;i<13;i++)
	{	
		if(i != 1 && i!=12) {
			try {
				sql = "select MAX("+Newcar2[0][i]+") from "+Newcar3[i];
				rsSet = stmt.executeQuery(sql);
				while(rsSet.next())
					Newcar2[1][i]=""+(rsSet.getInt(1)+1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}   	
	}
	try {
		sql = "insert into PRICE VALUES ("+Newcar2[1][3]+","+request.getParameter("Price")+")";
		stmt.executeUpdate(sql);
		
		sql = "insert into DETAILEDMODEL VALUES ("+Newcar2[1][4]+",'"+request.getParameter("DetailedModel")+"')";
		stmt.executeUpdate(sql);
		
		sql = "insert into MODEL VALUES ("+Newcar2[1][5]+",'"+request.getParameter("Model")+"','"+request.getParameter("PopularModel")+"')";
		stmt.executeUpdate(sql);
		
		sql = "insert into ENGINE_DISPLACEMENT VALUES ("+Newcar2[1][6]+","+request.getParameter("EngineDisplacement")+")";
		stmt.executeUpdate(sql);
		
		sql = "insert into TRANSMISSION VALUES ("+Newcar2[1][7]+",'"+request.getParameter("Transmission")+"')";
		stmt.executeUpdate(sql);
		
		String fuel_1=request.getParameter("Fuel");
		String fuel_2=request.getParameter("FuelSecond");
		if(fuel_2.equals(""))
			sql = "insert into FUEL VALUES ("+Newcar2[1][8]+",'"+fuel_1+"', NULL)";
		else
			sql = "insert into FUEL VALUES ("+Newcar2[1][8]+",'"+fuel_1+"', '"+ fuel_2+"')";
		stmt.executeUpdate(sql);
		
		String color_1 =request.getParameter("Color");
		String color_2=request.getParameter("ColorSecond");
		if(color_2.equals(""))
			sql = "insert into COLOR VALUES ("+Newcar2[1][9]+",'"+color_1+"', NULL)";
		else
			sql = "insert into COLOR VALUES ("+Newcar2[1][9]+",'"+color_1+"', '"+ color_2+"')";
		stmt.executeUpdate(sql);
		
		sql = "insert into CATEGORY VALUES ("+Newcar2[1][10]+",'"+request.getParameter("Category")+"')";
		stmt.executeUpdate(sql);
		
		sql = "insert into MAKE VALUES ("+Newcar2[1][11]+",'"+request.getParameter("Make")+"','"+request.getParameter("ProducingCountry")+"')";
		stmt.executeUpdate(sql);
		
		sql = "insert into DRIVING_KILOMETERS VALUES ("+Newcar2[1][2]+","+request.getParameter("DrivingKilometer")+")";
		stmt.executeUpdate(sql);
		
		sql = "insert into VEHICLE VALUES ("+Newcar2[1][0]+", TO_DATE('"+request.getParameter("ManufactureDate")+"','YYYY-MM-DD'),"+Newcar2[1][2]+","+Newcar2[1][3]+","+Newcar2[1][4]+","+Newcar2[1][5]+","+Newcar2[1][6]+","+Newcar2[1][7]+","+Newcar2[1][8]+","+Newcar2[1][9]+","+Newcar2[1][10]+","+Newcar2[1][11]+",'"+request.getParameter("Visible")+"')";
		stmt.executeUpdate(sql);
		sql = "commit";
		stmt.executeUpdate(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
<script>
	alert('Registration Completed!');
	setTimeout(function(){},1000);
</script>
<%
	String Fname = request.getParameter("Fname");
	String Lname = request.getParameter("Lname");
	String AdminID = request.getParameter("AdminID");
	String UserID = request.getParameter("UserID");
	request.setAttribute("Fname", Fname);
	request.setAttribute("Lname", Lname);
	request.setAttribute("AdminID", AdminID);
	request.setAttribute("UserID", UserID);
	request.getRequestDispatcher("menu2.jsp").forward(request, response);
	%>
</body>
</html>