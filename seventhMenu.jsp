<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="font.css">
<title>COMP322:Databases-Team9</title>
</head>
<body>
	<h1>7.Modify Vehicle</h1>
	<p>What is the ID of the vehicle you want to modify ?</p>
	<form method="post" action="seventhMenuResult.jsp">
		ID : <input type="text" name="ID">
		
		<br/>
		<p>Select the attribute you want to modify</p>
		<br/>
		<select name="Choice">
  			<option value="1">Model year</option>
  			<option value="2">Kilometers</option>
  			<option value="3">Price</option>
 			<option value="4">Detailed model</option>
 			<option value="5">Model</option>
 			<option value="6">Engine</option>
 			<option value="7">Transmission</option>
 			<option value="8">Fuel</option>
 			<option value="9">Color</option>
 			<option value="10">Category</option>
 			<option value="11">Make</option>
 			<option value="12">Visibility</option>
 			<option value="13">ProducingCountry</option>
 			<option value="14">PopularModel</option>
		</select>
		<br/>
		<br/>
		Enter the new value for this field : <input type="text" name="newVal">
		<br/>
		<br/>
		<input type="submit" name="Submit">	
		<input type="hidden" name="Fname" value="<%=request.getParameter("Fname")%>"/>
		<input type="hidden" name="Lname" value="<%=request.getParameter("Lname")%>"/>
		<input type="hidden" name="AdminID" value="<%=request.getParameter("AdminID")%>"/>
		<input type="hidden" name="UserID" value="<%=request.getParameter("UserID")%>"/>
	</form>

</body>
</html>