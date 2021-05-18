<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 	<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Account</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
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
 	padding-top: 20px;
  	padding-bottom: 20px;
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
  width: 97%; 
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




	<div class="modal-content animate" id="report">
	
	<h5 style="margin: 20px">Date: <%=new Date().toString() %></h5>
		
		<h1 align ="center"> Pending Leave Details </h1>
		
	<div class="container">

	<table>
	<tr>
		<td> Leave ID </td>
		<td> Employee ID </td>
		<td> Leave Code </td>
		<td> From </td>
		<td> To </td>
		<td> Type </td>
		<td> Reason </td>
		<td> Status </td>
		
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
	
	
	
	<tr>
		<td>${leave.leaveID}</td>
		<td>${leave.empID}</td>
		<td>${leave.leaveCode}</td>
		<td>${leave.fdate}</td>
		<td>${leave.tdate}</td>
		<td>${leave.type}</td>
		<td>${leave.reason}</td>
		<td>${leave.status}</td>
		
	</tr>

	</c:forEach>
	</table>
	
	</div>
	</div>
	
	<button onclick="print()">Download Report</button>
<script>

function print(){
		var element = document.getElementById("report");
		var opt = {
  		margin:       0.2,
  		filename:     'pendingLeave.pdf',
  		image:        { type: 'jpeg', quality: 0.98 },
  		html2canvas:  { scale: 2 },
  		jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
		};
 
		// New Promise-based usage:
		html2pdf().from(element).set(opt).save();
}
</script>	
	
</body>
</html>