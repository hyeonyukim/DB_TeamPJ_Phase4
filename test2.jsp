<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>

<%
	String Fname=request.getParameter("FirstName");
	String Lname=request.getParameter("LastName");
	String Password=request.getParameter("password");
	String Address=request.getParameter("Address");
	String Phone=request.getParameter("Phone");
	String Birth_Date=request.getParameter("Birth_Date");
	String Gender=request.getParameter("Gender");
	String Occupation=request.getParameter("Occupation");
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
	
	
	String [][] RegInfo = new String [2][10];
	RegInfo[0][0] = "User_ID";		RegInfo[0][5] = "Password";
	RegInfo[0][1] = "Address";		RegInfo[0][6] = "Phone";
	RegInfo[0][2] = "Birth_Date(format : yyyy-mm-dd)";
	RegInfo[0][7] = "Gender";
	RegInfo[0][3] = "First name";	RegInfo[0][8] = "Occupation";
	RegInfo[0][4] = "Last name";	RegInfo[0][9] = "Admin_ID";
	RegInfo[1][3] = Fname;
	RegInfo[1][4] = Lname;
	RegInfo[1][5] = Password;
	RegInfo[1][6] = (Phone.equals(""))?"NULL":Phone;
	RegInfo[1][1] = (Address.equals(""))?"NULL":Address;
	RegInfo[1][2] = (Birth_Date.equals(""))?"NULL":Birth_Date;
	RegInfo[1][7] = (Gender.equals(""))?"NULL":Gender;
	RegInfo[1][8] = (Occupation.equals(""))?"NULL":Occupation;
	String sql = "select user_id from user_account where admin_id IS null";
	ResultSet rs =  st.executeQuery(sql);
	while(rs.next()) {
	RegInfo[1][9]=""+rs.getInt(1);
	}
	String sql2 = "select MAX(user_id) from USER_ACCOUNT";
	ResultSet rs2=st.executeQuery(sql2);
	while(rs2.next()) {
        RegInfo[1][0]=""+(rs2.getInt(1)+1);
	}
	StringBuffer acc = new StringBuffer();
	acc.append("INSERT INTO USER_ACCOUNT VALUES" + "(" +RegInfo[1][0] + ", ");
	if(RegInfo[1][1].equals("NULL"))
		acc.append(RegInfo[1][1] + ", ");
	else
		acc.append("'"+RegInfo[1][1] + "', ");
	
	if(RegInfo[1][2].equals("NULL"))
		acc.append(RegInfo[1][2] + ", ");
	else
		acc.append("TO_DATE('"+RegInfo[1][2] + "','YYYY-MM-DD'), ");
	
	acc.append("'" + RegInfo[1][3] + "', '" + RegInfo[1][4] + "', '" + RegInfo[1][5] + "', ");
	
	if(RegInfo[1][6].equals("NULL"))
		acc.append(RegInfo[1][6] + ", ");
	else
		acc.append("'"+RegInfo[1][6] + "', ");
	
	if(RegInfo[1][7].equals("NULL"))
		acc.append(RegInfo[1][7] + ", ");
	else
		acc.append("'"+RegInfo[1][7] + "', ");
	
	if(RegInfo[1][8].equals("NULL"))
		acc.append(RegInfo[1][8] + ", ");
	else
		acc.append("'"+RegInfo[1][8] + "', ");
	
	if(RegInfo[1][9].equals("NULL"))
		acc.append(RegInfo[1][9] + ");\r\n");
	else
		acc.append(RegInfo[1][9] + ")\r\n");
	sql2=acc.toString();
    st.executeUpdate(sql2);
    out.write("<script type='text/javascript'>\n");
    out.write("alert('successful your userid is "+RegInfo[1][0]+"');\n");
    out.write("setTimeout(function(){window.location.href='login.jsp'},1000);");
    out.write("</script>\n");
%>
