<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>User Account</title>

<style>

* {
  box-sizing: border-box;
}

body {
  font-family: "Lato", sans-serif;
  padding: 10px;
  background: SteelBlue;
}

.reportBtn{
background-color: DarkCyan;
  color: white;
  margin-left:40%;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 6px 16px;
  font-size: 18px;
  width: 25%;
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
  width: 90%; 
}

table {
  border-collapse: collapse;
  width: 100%;
}

td {
  text-align: left;
  padding: 8px;
}

table{
  background-color: LightGrey;
  
}
tr:nth-child(1){
  background-color: DarkCyan;
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
		<form action="ViewLeaveServlet" method="post"><button>Admin</button></form>
		<button onclick="#" >Contact</button>
		<button onclick="#" >About</button>

	<div class="modal-content animate">
		
		<h1 align ="center"> My Leave Details </h1>
		
	<div class="container">

	<table>
	<tr>
		<td> Leave ID </td>
		<td> Leave Code </td>
		<td> From </td>
		<td> To </td>
		<td> Type </td>
		<td> Reason </td>
		<td> Status </td>
		<td> Edit </td>
		<td> Delete </td>
	</tr>
	
	<c:forEach var="leave" items="${leaveDetails}">
	
	<c:set var="leaveID" value="${leave.leaveID}"/>
	<c:set var="empID" value="${leave.empID}"/>
	<c:set var="leaveCode" value="${leave.leaveCode}"/>
	<c:set var="fdate" value="${leave.fdate}"/>
	<c:set var="tdate" value="${leave.tdate}"/>
	<c:set var="type" value="${leave.type}"/>
	<c:set var="reason" value="${leave.reason}"/>
	<c:set var="status" value="${leave.status}"/>
	
	<c:url value="UpdateLeave.jsp" var="leaveUpdate">
		<c:param name="leaveID" value="${leaveID}"/>
		<c:param name="empID" value="${empID}"/>
		<c:param name="leaveCode" value="${leaveCode}"/>
		<c:param name="fdate" value="${fdate}"/>
		<c:param name="tdate" value="${tdate}"/>
		<c:param name="type" value="${type}"/>
		<c:param name="reason" value="${reason}"/>
		<c:param name="status" value="${status}"/>
	</c:url>
	
	<c:url value="DeleteLeave.jsp" var="leaveDelete">
		<c:param name="leaveID" value="${leaveID}"/>
		<c:param name="empID" value="${empID}"/>
		<c:param name="leaveCode" value="${leaveCode}"/>
		<c:param name="fdate" value="${fdate}"/>
		<c:param name="tdate" value="${tdate}"/>
		<c:param name="type" value="${type}"/>
		<c:param name="reason" value="${reason}"/>
		<c:param name="status" value="${status}"/>
	</c:url>
	
	<tr>
		<td>${leave.leaveID}</td>
		<td>${leave.leaveCode}</td>
		<td>${leave.fdate}</td>
		<td>${leave.tdate}</td>
		<td>${leave.type}</td>
		<td>${leave.reason}</td>
		<td>${leave.status}</td>
		<td> 
			<a href="${leaveUpdate}"><button><i style="font-size:24px" class="fa">&#xf044;</i></button></a>
		</td>
		<td> 
			<a href="${leaveDelete}"><button><i style="font-size:24px" class="fa">&#xf014;</i></button></a>
		</td>
	</tr>

	</c:forEach>
	</table>
	
	</div>
	
	</div>
	
	
	
	<div class="footer">
 		 <h2>-Copyright 2021@ Employee Management System-</h2>
	</div>
	
</body>
</html>