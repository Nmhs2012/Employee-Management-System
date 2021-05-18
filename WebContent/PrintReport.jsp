<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: "Lato", sans-serif;
  padding: 10px;
  margin-top: 20px;
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
   
  
  opacity: 0.9;
  padding: 20px;
  margin:30px;
  height: auto;
  
}


table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 15px;
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


		
	
	
		<div class="container" id="list">
		<h5 style="margin: 20px">Date: <%=new Date().toString() %></h5>
		<button onclick=print() style="float: right; padding: 8px">Download</button>
			<h1 style="text-align: center;margin-top:20px; font-size:30px">Requested Transfers</h1>


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
				<td>17.05.2021</td>
			</tr>
		
	</c:forEach>					   
	</c:forEach>
	</table>
	
	</div>
	
	

	
<script>

function print(){
		var element = document.getElementById("list");
		var opt = {
  		margin:       0.6,
  		filename:     'pendingTransfer.pdf',
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