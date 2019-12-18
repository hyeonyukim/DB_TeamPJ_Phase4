<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%@page import="java.sql.*"%>   
<head>
<script type="text/javascript">
	function sendPost() {
		var f=document.paging;
		alert("sdf");
        f.Fname.value = requst.getParameter("Fname");
        f.Lname.value = requst.getParameter("Lname");
        f.AdminID.value = requst.getParameter("AdminID");
        f.UserID.value = requst.getParameter("UserID");
        f.action="/secondMenu.jsp";
        f.method="post";
        f.submit();
	}
</script>
<link rel="stylesheet" href="font.css">
</head> 
<body>
<form>
		<input type="hidden" name="Fname"/>
		<input type="hidden" name="Lname"/>
		<input type="hidden" name="AdminID"/>
		<input type="hidden" name="UserID"/>
</form>
<%
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
   String Fname = request.getParameter("Fname");
   String Lname = request.getParameter("Lname");
   String AdminID = request.getParameter("AdminID");
   String userID = request.getParameter("UserID");
   String newIF = request.getParameter("newIF");
   String SL = request.getParameter("select");
   if(request.getParameter("back")!=null){
	   request.setAttribute("Fname", Fname);
		request.setAttribute("Lname", Lname);
		request.setAttribute("AdminID", AdminID);
		request.setAttribute("UserID", userID);
		if(AdminID.equals("null"))
			request.getRequestDispatcher("menu2.jsp").forward(request, response);
		else
			request.getRequestDispatcher("menu1.jsp").forward(request, response);
   }
   String sql;
   switch(SL){
      case "1":
         sql = "UPDATE USER_ACCOUNT SET Fname='" + newIF + "' WHERE User_id='" + userID + "'";
         st.executeUpdate(sql);
         break;
      case "2":
         sql = "UPDATE USER_ACCOUNT SET Lname='" + newIF + "' WHERE User_id='" + userID + "'";
         st.executeUpdate(sql);
         break;
      case "3":
         sql = "UPDATE USER_ACCOUNT SET Address='" + newIF + "' WHERE User_id='" + userID + "'";
         st.executeUpdate(sql);
         break;
      case "4":
         sql= "UPDATE USER_ACCOUNT SET Birth_date='" + newIF + "' WHERE User_id='" + userID + "'";
         st.executeUpdate(sql);
         break;
      case "5":
         sql="UPDATE USER_ACCOUNT SET Password='" + newIF + "' WHERE User_id='" + userID + "'";
         st.executeUpdate(sql);
         break;
      case "6":
         sql="UPDATE USER_ACCOUNT SET Phone='" + newIF + "' WHERE User_id='" + userID + "'";
         st.executeUpdate(sql);
         break;
      case "7":
         sql="UPDATE USER_ACCOUNT SET Gender='" + newIF + "' WHERE User_id='" + userID + "'";
         st.executeUpdate(sql);
         break;
      case "8":
         sql="UPDATE USER_ACCOUNT SET Occupation='" + newIF + "' WHERE User_id='" + userID + "'"; 
         st.executeUpdate(sql);
         break;
         
      default:
         break;
   }
   sql = "commit";
   st.executeUpdate(sql);
   
   if(request.getParameter("Submit")!=null){
	   out.write("<script type='text/javascript'>\n");
	   out.write("alert('Your account has been updated successfully!');\n");
	   out.write("setTimeout(function(){},1000);");
	   out.write("</script>\n");
	
		request.setAttribute("Fname", Fname);
		request.setAttribute("Lname", Lname);
		request.setAttribute("AdminID", AdminID);
		request.setAttribute("UserID", userID);
		if(AdminID.equals("null"))
			request.getRequestDispatcher("menu2.jsp").forward(request, response);
		else
			request.getRequestDispatcher("menu1.jsp").forward(request, response);
   }
%>
</body>