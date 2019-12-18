<%@page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
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

String sql="select * from user_account where user_ID='"+User_ID+"'and password='"+Password+"'";
ResultSet rs=st.executeQuery(sql);
String userInfo[] = new String[4];
if(rs.next()){
	userInfo[0] = rs.getString(4);
	userInfo[1] = rs.getString(5);
	userInfo[2] = rs.getString(10);
	userInfo[3] = ""+rs.getInt(1);
	request.setAttribute("Fname", userInfo[0]);
	request.setAttribute("Lname", userInfo[1]);
	request.setAttribute("AdminID", userInfo[2]);
	request.setAttribute("UserID", userInfo[3]);
	if(userInfo[2]==null)
	{
		request.getRequestDispatcher("menu2.jsp").forward(request, response);
	}else{
		request.getRequestDispatcher("menu1.jsp").forward(request, response);
	}
}else{
	request.setAttribute("error", "please check you id and password");
	request.getRequestDispatcher("login.jsp").forward(request, response);
}


conn.close();
rs.close();
%>