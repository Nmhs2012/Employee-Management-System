<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
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
  width: auto;
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
.bar {
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

.bar :hover {
  background-color: #777;
}



/* Middle part */
.card {
  background-image: url("Images/transferbackground.jpg");
  background-size:     cover;                     
  background-repeat:   no-repeat;
  background-position: center center;
  padding: 15px;
  margin-top: 70px;
  display: -webkit-flex;
  display: flex;
}


 /*Footer*/
.footer {
  padding: 5px;
  text-align: center;
  background: LightGrey;
  margin-top: 20px;
  font-size: 8px;
}
/*Vertical navigation*/
ul {
  list-style-type: none;
  margin: -40px;
  
 
  
 
  }
  

li a {
  display: block;
  color: white;
  text-padding: 10px;
  padding: 30px;
  text-decoration: none;
  width:160px;
  border: none;
  background-color: #000038;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
  padding-left: 18px;
  margin-right: 0px;
  
}

li a.active {
  background-color: SteelBlue;
  color: black;
}

li a:hover:not(.active) {
  background-color: SteelBlue;
  color: black;
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

.container {
   
  background-color: LightSteelBlue; 
  opacity: 0.9;
  padding: 20px;
  margin-left: 0%;
  margin-top: -40px;
  margin-bottom: -28px;
  margin-right: -15px;
  height: 500px;
  
}

.navigation{
-webkit-flex: 1;
  -ms-flex: 1;
  flex: 1;
  background: linear-gradient(to bottom, #003366 0%, #336699 100%);
  opacity: 0.9;
  padding-top: 150px;
  margin-left: -15px;
  margin-bottom: -30px;
  margin-top: -40px;
  padding-right: 80px;
  padding-left: 50px;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 10px;
  font-size: 12px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: MidNightBlue;
  color: white;
}

@media screen and (max-width: 2000px) {
    width: 100%;
    padding: 0;
  }
</style>
</head>
<body>

	<div class="header">
	
		<img src="Images/uplift.png" class="logo" alt="company logo">
		<div class="header-right">
  		<h1>Employee Management System</h1>
  		<p>Uplift Digital Marketing (Pvt) Ltd.</p>
  		</div>
  	
	</div>

		<button class="bar" onclick="#" >Home</button>
		<form action="ViewPendingServlet" method="post"><button class="bar" onclick="RequestedTransfer.jsp" >Admin</button></form>
		<button class="bar" onclick="#" >Contact</button>
		<button class="bar" onclick="#" >About Us</button>
	
	<div class="card">
	
    	<div  class="navigation">
      		<ul>
  				<li><a href="ViewPendingServlet" class="active">Requested Transfers</a></li>
  				<li style="margin-top:10px;"><a href="ViewCheckServlet">Checked Transfer History</a></li>
 				
		    </ul>
		</div>
		
	
	
		<div class="container">
		<form action="ReportViewServlet" method="post"><button style="float: right; padding: 8px">Print Report</button></form>
			<h1 style="text-align: center;font-size:30px">Requested Transfers</h1>


	<table style="width: 80px; border: 2px solid #000000; margin-top: 10px;">
	
			<tr>
				<th>Transfer ID</th>
				<th>Staff No</th>
				<th>Name</th>
				<th>Transfer Branch</th>
				<th>Transfer Department</th>
				<th>Reason</th>
				<th>Status</th>
				<th>Date</th>
				<th>Approve</th>
				<th>Reject</th>
								
				
			</tr>
	
	<c:forEach var="Transfer" items="${RtransferDetails}">
	
		<c:set var ="tranID" value ="${Transfer.tranID}"/>
		<c:set var ="cBranch" value ="${Transfer.cBranch}"/>
		<c:set var ="cDepartment" value ="${Transfer.cDepartment}"/>
		<c:set var ="tBranch" value ="${Transfer.tBranch}"/>
		<c:set var ="tDepartment" value ="${Transfer.tDepartment}"/>
		<c:set var ="reason" value ="${Transfer.reason}"/>
		<c:set var ="approveBy" value ="${Transfer.approveBy}"/>
		<c:set var ="status" value ="${Transfer.status}"/>
		<c:set var ="empID" value ="${Transfer.empID}"/>
		
		<c:forEach var="Employee" items="${emploDetails}">
	
		<c:set var ="name" value ="${Employee.name}"/>
		
		
				
			<tr>
				<td>${Transfer.tranID}</td>
				<td>${Transfer.empID}</td>
				<td>${Employee.name}</td>
				<td>${Transfer.tBranch}</td>
				<td>${Transfer.tDepartment}</td>
				<td>${Transfer.reason}</td>
				<td>${Transfer.status}</td>
				<td><%=new SimpleDateFormat("dd/MM/yy").format(new Date()) %></td>
				<td><form action="RequestApproveServlet" method="post"><input type="hidden" name="tranID" value="${Transfer.tranID}"><button class="icon"><i style="font-size:24px" class="fa fa-check"></i></button></form></td>
				<td><form action="RequestRejectServlet" method="post"><input type="hidden" name="tranID" value="${Transfer.tranID}"><button class="icon"><i style="font-size:24px" class="fa fa-close"></i></button></form></td>
			</tr>
		
	</c:forEach>					   
	</c:forEach>
	</table>
	
	</div>
	</div>
	

	<div class="footer">
 		 <h2>-Copyrights 2020@ Employee Management System-</h2>
	</div>

</body>
</html>