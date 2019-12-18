<%@page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="font.css">
<title>COMP322:Databases-Team9</title>
</head>
<body>
<h2>=========Search Result=========</h2>
<%

String User_ID = request.getParameter("User_ID");
String Password = request.getParameter("Password");
String severIP = "localhost";
String strSID = "xe";
String portNum = "1600";
String user = "knu";
String pass = "comp322";
String url = "jdbc:oracle:thin:@"+severIP+":"+portNum+":"+strSID;
Connection conn = null;
Statement st;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url, user, pass);
st = conn.createStatement();

if(request.getParameter("back")!=null){
		String Fname=request.getParameter("Fname");
		String Lname=request.getParameter("Lname");
		String AdminID=request.getParameter("AdminID");
		String userID=request.getParameter("UserID");
	    request.setAttribute("Fname", Fname);
		request.setAttribute("Lname", Lname);
		request.setAttribute("AdminID", AdminID);
		request.setAttribute("UserID", userID);
		if(AdminID.equals("null"))
			request.getRequestDispatcher("menu2.jsp").forward(request, response);
		else
			request.getRequestDispatcher("menu1.jsp").forward(request, response);
}

StringBuffer sb = new StringBuffer();
sb.append("SELECT  V.Vehicle_id, K.Make_value, P.Price_value\n" + 
      "FROM    ENGINE_DISPLACEMENT E, MODEL M, VEHICLE V, TRANSMISSION T,\n" + 
      "        FUEL F, COLOR C, CATEGORY A, MAKE K, DRIVING_KILOMETERS D, PRICE P, DETAILEDMODEL L\n" + 
      "WHERE   V.Vehicle_id NOT IN(SELECT Vehicle_id FROM SALES_HISTORY)\n" + 
      "AND     V.Visible = 'Y'\n" + 
      "AND     E.Engine_id = V.Engine_id\n" + 
      "AND     M.Model_id = V.Model_id\n" + 
      "AND     T.Transmission_id = V.Transmission_id\n" + 
      "AND     F.Fuel_id = V.Fuel_id\n" + 
      "AND     C.Color_id = V.Color_id\n" + 
      "AND     A.Category_id =V.Category_id\n" + 
      "AND     K.Make_id = V.Make_id\n" + 
      "AND     D.Kilometer_id = V.Kilo_id\n" + 
      "AND     P.Price_id = V.Price_id\n" + 
      "AND     L.DetailedModel_id = V.Dmodel_id");
String [] SearchArr = new String[17];
SearchArr[0] = request.getParameter("Engine_value");
SearchArr[1] = request.getParameter("Engine_symbol");
SearchArr[2] = request.getParameter("Model_value");
SearchArr[3] = request.getParameter("Popular_model");
SearchArr[4] = request.getParameter("Transmission_value");
SearchArr[5] = request.getParameter("Fuel_value");
SearchArr[6] = request.getParameter("Fuel_second");
SearchArr[7] = request.getParameter("Color_value");
SearchArr[8] = request.getParameter("Color_second");
SearchArr[9] = request.getParameter("Category_value");
SearchArr[10] = request.getParameter("Make_value");
SearchArr[11] = request.getParameter("ProducingCountry");
SearchArr[12] = request.getParameter("Kilometer_value");
SearchArr[13] = request.getParameter("Kilometer_symbol");
SearchArr[14] = request.getParameter("Price_value");
SearchArr[15] = request.getParameter("Price_symbol");
SearchArr[16] = request.getParameter("DetailedModel_value");
if(!SearchArr[0].equals("") && !SearchArr[1].equals(""))   sb.append("AND     E.Engine_value "+SearchArr[1]+SearchArr[0]);
if(!SearchArr[2].equals(""))   sb.append("\nAND     M.Model_value = '" + SearchArr[2] +"'");
if(!SearchArr[3].equals(""))   sb.append("\nAND     M.Popular_model = '" + SearchArr[3] +"'");
if(!SearchArr[4].equals(""))   sb.append("\nAND     T.Transmission_value = '" + SearchArr[4] + "'");
if(!SearchArr[5].equals(""))   sb.append("\nAND     F.Fuel_value = '" + SearchArr[5]+"'");
if(!SearchArr[6].equals(""))   sb.append("\nAND     F.Fuel_second = '" + SearchArr[6]+"'");
if(!SearchArr[7].equals(""))   sb.append("\nAND     C.Color_value = '" + SearchArr[7]+"'");
if(!SearchArr[8].equals(""))   sb.append("\nAND     C.Color_second = '" + SearchArr[8]+"'");
if(!SearchArr[9].equals(""))   sb.append("\nAND     A.Category_value = '" + SearchArr[9]+"'");
if(!SearchArr[10].equals(""))   sb.append("\nAND     K.Make_value = '" + SearchArr[10]+"'");
if(!SearchArr[11].equals(""))   sb.append("\nAND     K.ProducingCountry = '" + SearchArr[11]+"'");
if(!SearchArr[12].equals("") && !SearchArr[13].equals(""))   sb.append("\nAND     D.Kilometer_value "+SearchArr[13]+SearchArr[12]);
if(!SearchArr[14].equals("") && !SearchArr[15].equals(""))   sb.append("\nAND     P.Price_value "+SearchArr[15]+SearchArr[14]);
if(!SearchArr[16].equals(""))   sb.append("\nAND     L.DetailedModel_value = '" + SearchArr[16]+"'");
String sql = sb.toString();
ResultSet rs=st.executeQuery(sql);
String view = new String();

while(rs.next()){
   
   int vehicle_id = rs.getInt(1);
   String make_value = rs.getString(2);
   String price_value = rs.getString(3);

   view = "ID = " + vehicle_id + " Make = " + make_value + " Price = " + price_value+"";
   
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
%>
<form method="post" action="firstMenuDetail.jsp">
	<p>Please input the vehicle_id which car you want see the detail</p>
	<input type="number" name="vehicleID">
	<br>
   	<input type = "submit" value="Enter"/>
	<input type="hidden" name="Fname" value="<%=request.getParameter("Fname")%>"/>
   	<input type="hidden" name="Lname" value="<%=request.getParameter("Lname")%>"/>
   	<input type="hidden" name="AdminID" value="<%=request.getParameter("AdminID")%>"/>
   	<input type="hidden" name="UserID" value="<%=request.getParameter("UserID")%>"/>
   	
</form>


</body>
</html>