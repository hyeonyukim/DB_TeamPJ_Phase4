<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*, java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="font.css">
<title>COMP322:Databases-Team9</title>
</head>
<body>

<%
		// for docker
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
		String sql=null;
		
		int choice = Integer.parseInt(request.getParameter("Choice"));
		String newVal = request.getParameter("newVal");
		
		switch(choice){
			
			case 1:
				sql = "UPDATE VEHICLE SET Model_year=TO_DATE('" + request.getParameter("newVal") + "','YYYY-MM-DD') WHERE Vehicle_id='" + request.getParameter("ID") + "'"; 
	
				break;
	
			case 2:
				sql = "UPDATE  DRIVING_KILOMETERS\n" + 
						"SET     Kilometer_value = "+request.getParameter("newVal")+"\n" + 
						"WHERE   Kilometer_id=(SELECT K.Kilometer_id\n" + 
						"        FROM    VEHICLE V, DRIVING_KILOMETERS K\n" + 
						"        WHERE   V.Kilo_id= K.Kilometer_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")"; 
	
				break;
	
			case 3:
				sql = "UPDATE  PRICE\n" + 
						"SET     Price_value = "+request.getParameter("newVal")+"\n" + 
						"WHERE   Price_id=(SELECT P.Price_id\n" + 
						"        FROM    VEHICLE V, Price P\n" + 
						"        WHERE   V.Price_id= P.Price_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")";  
	
				break;
			
			case 4:
				sql = "UPDATE  DETAILEDMODEL\n" + 
						"SET     DetailedModel_value = '"+request.getParameter("newVal")+"'\n" + 
						"WHERE   DetailedModel_id=(SELECT D.DetailedModel_id\n" + 
						"        FROM    VEHICLE V, DETAILEDMODEL D\n" + 
						"        WHERE   V.Dmodel_id= D.DetailedModel_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")";  
	
				break;
			
			case 5:
				sql = "UPDATE  MODEL\n" + 
						"SET     Model_value = '"+request.getParameter("newVal")+"'\n" + 
						"WHERE   Model_id=(SELECT M.Model_id\n" + 
						"        FROM    VEHICLE V, MODEL M\n" + 
						"        WHERE   V.Model_id= M.Model_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")";  
	
				break;
			
			case 6:
				sql = "UPDATE  ENGINE_DISPLACEMENT\n" + 
						"SET     Engine_value = "+request.getParameter("newVal")+"\n" + 
						"WHERE   Engine_id=(SELECT E.Engine_id\n" + 
						"        FROM    VEHICLE V, ENGINE_DISPLACEMENT E\n" + 
						"        WHERE   V.Engine_id= E.Engine_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")";   
	
				break;
			
			case 7:
				sql = "UPDATE  TRANSMISSION\n" + 
						"SET     Transmission_value = '"+request.getParameter("newVal")+"'\n" + 
						"WHERE   Transmission_id=(SELECT T.Transmission_id\n" + 
						"        FROM    VEHICLE V, Transmission T\n" + 
						"        WHERE   V.Transmission_id= T.Transmission_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")";  
	
				break;
			
			case 8:
				sql = "UPDATE  FUEL\n" + 
						"SET     Fuel_value = '"+request.getParameter("newVal")+"'\n" + 
						"WHERE   Fuel_id=(SELECT F.Fuel_id\n" + 
						"        FROM    VEHICLE V, FUEL F\n" + 
						"        WHERE   V.Fuel_id= F.Fuel_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")";  
	
				break;
	
			case 9:
				sql = "UPDATE  COLOR\n" + 
						"SET     Color_value = '"+request.getParameter("newVal")+"'\n" + 
						"WHERE   Color_id=(SELECT C.Color_id\n" + 
						"        FROM    VEHICLE V, COLOR C\n" + 
						"        WHERE   V.Color_id= C.Color_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")";  
	
				break;
	
			case 10:
				sql = "UPDATE  CATEGORY\n" + 
						"SET     Category_value = '"+request.getParameter("newVal")+"'\n" + 
						"WHERE   Category_id=(SELECT C.Category_id\n" + 
						"        FROM    VEHICLE V, CATEGORY C\n" + 
						"        WHERE   V.Category_id= C.Category_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")";  
	
				break;
	
			case 11:
				sql = "UPDATE  MAKE\n" + 
						"SET     Make_value = '"+request.getParameter("newVal")+"'\n" + 
						"WHERE   Make_id=(SELECT M.Make_id\n" + 
						"        FROM    VEHICLE V, Make M\n" + 
						"        WHERE   V.Make_id= M.Make_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")"; 
	
				break;
			
			case 12:
				newVal = "Y";
				do {
					if(!(request.getParameter("newVal").equals("Y")||request.getParameter("newVal").equals("y")
							||request.getParameter("newVal").equals("N")||request.getParameter("newVal").equals("n")))
							System.out.println("The value has to be either Y or N");
					else {
						
					}
				}while(!(request.getParameter("newVal").equals("Y")||request.getParameter("newVal").equals("y")
						||request.getParameter("newVal").equals("N")||request.getParameter("newVal").equals("n")));
				
				sql = "UPDATE VEHICLE SET Visible='"+request.getParameter("newVal")+"' WHERE Vehicle_id='" + request.getParameter("ID") + "'"; 
				break;
			
			case 13:
				sql = "UPDATE  MAKE\n" + 
						"SET     ProducingCountry = '"+request.getParameter("newVal")+"'\n" + 
						"WHERE   Make_id=(SELECT M.Make_id\n" + 
						"        FROM    VEHICLE V, Make M\n" + 
						"        WHERE   V.Make_id= M.Make_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")"; 
	
				break;
			
			case 14:
				newVal = "Y";
				
				do {
					if(!(request.getParameter("newVal").equals("Y")||request.getParameter("newVal").equals("y")
							||request.getParameter("newVal").equals("N")||request.getParameter("newVal").equals("n")))
							System.out.println("The value has to be either Y or N");
					else {
						System.out.println("You chose to modify Popular Model");
					}
					
				}while(!(request.getParameter("newVal").equals("Y")||request.getParameter("newVal").equals("y")
						||request.getParameter("newVal").equals("N")||request.getParameter("newVal").equals("n")));
				
				sql = "UPDATE  MODEL\n" + 
						"SET     Popular_model = '"+request.getParameter("newVal")+"'\n" + 
						"WHERE   Model_id=(SELECT M.Model_id\n" + 
						"        FROM    VEHICLE V, MODEL M\n" + 
						"        WHERE   V.Model_id= M.Model_id\n" + 
						"        AND     V.Vehicle_id="+request.getParameter("ID")+")";  
	
				break;
			
			 default:
				break;
		}
		
		try{
			stmt.executeUpdate(sql);
			sql = "commit";
			stmt.executeUpdate(sql);
		}
		
		catch(SQLException e){
			e.printStackTrace();
		}
		
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