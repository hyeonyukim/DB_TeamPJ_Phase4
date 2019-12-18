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
<h2>===========Detail Result===========</h2>
<br/>
<%
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

String vehicleID = request.getParameter("vehicleID");
try{
	sql="SELECT  * FROM    SALES_HISTORY WHERE   Vehicle_id="+vehicleID;
	 rs = stmt.executeQuery(sql);
	 while(rs.next()){
		String Fname = request.getParameter("Fname");
		String Lname = request.getParameter("Lname");
		String AdminID = request.getParameter("AdminID");
		String UserID = request.getParameter("UserID");
		request.setAttribute("Fname", Fname);
		request.setAttribute("Lname", Lname);
		request.setAttribute("AdminID", AdminID);
		request.setAttribute("UserID", UserID);
		request.getRequestDispatcher("firstMenuFailed.jsp").forward(request, response);
	 }
	 
   sql ="SELECT  V.Vehicle_id, E.Engine_value, M.Model_value, M.Popular_model, T.Transmission_value, F.Fuel_value, F.Fuel_second,\n" + 
         "        C.Color_value, C.Color_second, A.Category_value, K.Make_value, K.ProducingCountry, D.Kilometer_value, P.Price_value, L.DetailedModel_value\n" + 
         "FROM    ENGINE_DISPLACEMENT E, MODEL M, VEHICLE V, TRANSMISSION T,\n" + 
         "        FUEL F, COLOR C, CATEGORY A, MAKE K, DRIVING_KILOMETERS D, PRICE P, DETAILEDMODEL L\n" + 
         "WHERE   E.Engine_id = V.Engine_id\n" + 
         "AND     M.Model_id = V.Model_id\n" + 
         "AND     T.Transmission_id = V.Transmission_id\n" + 
         "AND     F.Fuel_id = V.Fuel_id\n" + 
         "AND     C.Color_id = V.Color_id\n" + 
         "AND     A.Category_id =V.Category_id\n" + 
         "AND     K.Make_id = V.Make_id\n" + 
         "AND     D.Kilometer_id = V.Kilo_id\n" + 
         "AND     P.Price_id = V.Price_id\n" + 
         "AND     L.DetailedModel_id = V.Dmodel_id\n" + 
         "AND     V.Vehicle_id = " + vehicleID;
   rs = stmt.executeQuery(sql);
   int vehicle_id;
   int Enginevalue;
   String Modelvalue;
   String Popularmodel;
   String Transmissionvalue;
   String Fuelvalue;
   String Fuelsecond;
   String Colorvalue;
   String Colorsecond;
   String Categoryvalue;
   String Makevalue;
   String ProducingCountry;
   int kilometervalue;
   int Pricevalue;
   String DetailedModelvalue;
   
   while(rs.next()){
      
      vehicle_id = rs.getInt(1);
      Enginevalue = rs.getInt(2);
      Modelvalue = rs.getString(3);
      Popularmodel = rs.getString(4);
      Transmissionvalue = rs.getString(5);
      Fuelvalue = rs.getString(6);
      Fuelsecond = rs.getString(7);
      Colorvalue = rs.getString(8);
      Colorsecond = rs.getString(9);
      Categoryvalue = rs.getString(10);
      Makevalue = rs.getString(11);
      ProducingCountry = rs.getString(12);
      kilometervalue = rs.getInt(13);
      Pricevalue = rs.getInt(14);
      DetailedModelvalue = rs.getString(15);

      view = "ID = " + vehicle_id + " Engine_value = " + Enginevalue + " Model_value = " + Modelvalue + " Popular_model = " + Popularmodel + " Transmission_value = " + Transmissionvalue + " Fuel_value = " + Fuelvalue + " Fuel_second= "+ Fuelsecond + " Color_value = " + Colorvalue +" Color_second = " + Colorsecond +" Category_value= " + Categoryvalue +" Make_value =" + Makevalue + " ProducingCountry = " + ProducingCountry + " kilometer_value = " + kilometervalue + " Price_value = " + Pricevalue + "DetailedModel_value = " + DetailedModelvalue + "";
      
      ResultSetMetaData rsmd;
      rsmd = rs.getMetaData();
      int cnt = rsmd.getColumnCount();
      
      //first table
      out.println("<table border=\"1\">");
      for(int j=1; j<=cnt/3; j++){
         out.println("<th>"+rsmd.getColumnName(j)+"</th>");
      }
      out.println("<tr>");
      for(int j=0; j<cnt/3; j++)
         out.println("<td>"+rs.getString(j+1)+"</td>");
      out.println("</tr>");
      
      out.println("</table>"); 
      out.println("<br>");
      
	//second table
      out.println("<table border=\"1\">");
      for(int j=(cnt/3)+1; j<=(cnt*2)/3; j++){
         out.println("<th>"+rsmd.getColumnName(j)+"</th>");
      }
      
      out.println("<tr>");
      for(int j=(cnt/3); j<(cnt*2)/3; j++)
         out.println("<td>"+rs.getString(j+1)+"</td>");
      out.println("</tr>");
      out.println("</table>");   
      out.println("<br>");
      
    //third table
      out.println("<table border=\"1\">");
      for(int j=(cnt*2)/3+1; j<=cnt; j++){
         out.println("<th>"+rsmd.getColumnName(j)+"</th>");
      }
      
      out.println("<tr>");
      for(int j=(cnt*2)/3; j<cnt; j++)
         out.println("<td>"+rs.getString(j+1)+"</td>");
      out.println("</tr>");
      
      out.println("</table>");  
      out.println("<br>");
   }
}catch(SQLException e){
      e.printStackTrace();
}
%>
<p>Do you want buy this car?</p><br>

<form method="post" action="firstMenuTransaction.jsp">
<button>yes</button>
<input type="hidden" name="Fname" value="<%=request.getParameter("Fname")%>"/>
<input type="hidden" name="Lname" value="<%=request.getParameter("Lname")%>"/>
<input type="hidden" name="AdminID" value="<%=request.getParameter("AdminID")%>"/>
<input type="hidden" name="UserID" value="<%=request.getParameter("UserID")%>"/>
<input type="hidden" name="vehicleID" value="<%=request.getParameter("vehicleID")%>"/>
</form>

<form method="post" action="returnToMenu2.jsp">
<input type="hidden" name="Fname" value="<%=request.getParameter("Fname")%>"/>
<input type="hidden" name="Lname" value="<%=request.getParameter("Lname")%>"/>
<input type="hidden" name="AdminID" value="<%=request.getParameter("AdminID")%>"/>
<input type="hidden" name="UserID" value="<%=request.getParameter("UserID")%>"/>
<button>no</button>
</form>

</body>
</html>