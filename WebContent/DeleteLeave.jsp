<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Leave</title>
	<style>
	* {
  box-sizing: border-box;
}

body {
  font-family: "Lato", sans-serif;
  padding: 10px;
  background: SteelBlue;
}

/* Header */
.header {

  padding: 1px;
  text-align: center;
  background: linear-gradient(to bottom, #003399 0%, #669999 100%);
}

.header h1 {
  font-size: 40px;
  color: MidnightBlue;
  text-shadow: 2px 2px LightBlue;
  font-style: italic;
}

.header p{
	font-size: 20px;
	font-weight: bold;
	font-style: italic;
	margin-top: -11px;
	
}
/*Horizontal navigation Bar*/
button {
  background-color: MidnightBlue;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 6px 16px;
  font-size: 18px;
  width: 25%;
}

button:hover {
  background-color: #777;
}
/*Footer*/
.footer {
  padding: 5px;
  text-align: center;
  background: #ddd;
  margin-top: 20px;
  font-size: 8px;
}

.header-right {
    float: middle;
  }
  .header img {
  float: left;
  padding: 12px;
  margin-top: 20px;
  width: 150px;
  height: 100px;
  margin-left: 20px;

}
	
	
input[type=submit]{
 	background-color: MidNightBlue;
  	color: white;
	padding: 14px 20px;
 	margin: 8px 0;
 	border: none;
  	cursor: pointer;
  	width: 50%; 
  	transform: translate(50%);
}

input[type=submit]:hover {
  	opacity: 0.8;
}

.container {
  	padding: 16px;
}

body {
	background-color: grey; 
 	padding-top: 60px;
  	padding-bottom: 60px;
    font-family: Arial, Helvetica, sans-serif;
}
input, select{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
.modal-content {
  background-color: white;
  margin: 5% auto 15% auto; 
  border: 1px solid #888;
  width: 80%; 
}

table {
  border-collapse: collapse;
  width: 100%;
}

td {
  text-align: left;
  padding: 8px;
}

tr {
  background-color: LightGrey
  }
</style>
</head>
<body>

<div class="header">
	
		<img src="Images/uplift.png" class="logo" alt="company logo">
		<div class="header-right">
  		<h1>Uplift Digital Marketing (Pvt) Ltd.</h1>
  		<p>Employee Mangement System</p>
  		</div>
  	
	</div>

		<button onclick="#" >Home</button>
		<button onclick="#" >Home</button>
		<button onclick="#" >Home</button>
		<button onclick="#" >Home</button>



	<div class="modal-content animate">
		
		<h1 align ="center"> Delete My Leave </h1>
		      	
	<div class="container">	

	<%
		String leaveID = request.getParameter("leaveID");
		String empID = request.getParameter("empID");
		String leaveCode = request.getParameter("leaveCode");
		String fdate = request.getParameter("fdate");
		String tdate = request.getParameter("tdate");
		String type = request.getParameter("type");
		String reason = request.getParameter("reason");
		String status = request.getParameter("status");
	%>
		
	<form action="DeleteLeaveServlet" method="post">
	<table>
		<tr>
		<td>Leave ID</td>
			<td><input type="text" name="leaveID" value="<%= leaveID %>" readonly></td>
		</tr>
		<tr>
		<tr>
			<td>Employee ID</td>
			<td><input type="text" name="empID" value="<%= empID %>" readonly></td>
		</tr>
		<tr>
			<td>Leave Code</td>
			<td><input type="text" name="leaveCode" value="<%= leaveCode %>" readonly></td>
		</tr>
		<tr>
			<td>From</td>
			<td><input type="text" name="fdate" value="<%= fdate %>" readonly></td>
		</tr>

		<tr>
			<td>To</td>
			<td><input type="text" name="tdate" value="<%= tdate %>" readonly></td>
		</tr>
		
		<tr>
			<td>Type</td>
			<td><input type="text" name="type" value="<%= type %>" readonly></td>
		</tr>
		<tr>
			<td>Reason</td>
			<td><input type="text" name="reason" value="<%= reason %>" readonly></td>
		</tr>
		<tr>
			<td>Status</td>
			<td><input type="text" name="status" value="<%= status %>" readonly></td>
		</tr>		
	</table>
	<br>
	
	
	<input type="submit" value="Delete My Leave">
	</form>
	</div>
	</div>
	
	<div class="footer">
 		 <h2>-Copyright 2021@ Employee Management System-</h2>
	</div>

</body>
</html>