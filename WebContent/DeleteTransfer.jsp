<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transfer Page</title>
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
  height:auto;
  
}
/*Input Feilds*/
input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 2px solid #000;
  border-radius: 4px;
  resize: vertical;
  
 
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
  padding-right: 100px;
  padding-left: 50px;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: MidNightBlue;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
  margin-top: 10px;
}

input[type=submit]:hover {
  background-color: SteelBlue;
}

table, th, td {
  border: 2px solid #000000;
  border-collapse: collapse;
}

td {
  text-align: center;
}

th {
  padding-left: 10px;
  padding-right: 10px;
}

@media screen and (max-width: 800px) {
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

		<button onclick="#" >Home</button>
		<button onclick="#" >Admin</button>
		<button onclick="#" >Contact</button>
		<button onclick="#" >About Us</button>
	
	<div class="card">
	
    	<div  class="navigation">
      		<ul>
  				<li><a href="DisplayDetailsServlet">Request Transfer</a></li>
  				<li style="margin-top:10px;"><a href="ApprovedTransferServlet">Approved Transfer History</a></li>
  				<li style="margin-top:10px;"><a href="PendingTransferServlet" class="active" href="PendingTransfer.jsp">Pending Transfer History</a></li>
 				
		    </ul>
		</div>
		
	
	
		<div class="container">
		
		<h1 style="text-align: center;font-size:30px">Delete Transfer Requisition Details</h1>
	
		
	<%
		String tranID = request.getParameter("tranID");
		String cBranch = request.getParameter("cBranch");
		String cDepartment = request.getParameter("cDepartment");
		String tBranch = request.getParameter("tBranch");
		String tDepartment = request.getParameter("tDepartment");
		String reason = request.getParameter("reason");
		String approveBy = request.getParameter("approveBy");
	%>	
		
					
	
	<form action="DeleteTransferServlet" method="post">
			
			<label>1.  Transfer ID:</label>
			<input type="text" name="tranID" value="<%= tranID %>" readonly>
			
			<label>2.  Current Branch:</label>
			<input type="text" name="cBranch" value="<%= cBranch %>" readonly>
			
			<label>3.  Current Department:</label>
			<input type="text" name="cDepartment" value="<%= cDepartment %>" readonly>
	
			<label>4.  Transfer Branch:</label>
			<select id="type" name="tBranch" required>
          		<option value="<%= tBranch %>"><%= tBranch %></option>
          		<option value="Colombo">Colombo</option>
          		<option value="Gampaha">Gampaha</option>
          		<option value="Galle">Galle</option>
        	</select>

			
			<label>5.  Transfer Department:</label>
			<select id="type" name="tDepartment" readonly>
				<option value="<%= tDepartment%>"><%= tDepartment%></option>
          		<option value="HR">HR</option>
          		<option value="Marketing">Marketing</option>
          		<option value="Accounting & Finance">Accounting and Finance</option>
          		<option value="Production">Production</option>
          		<option value="Supplies">Supplies</option>
        	</select>	
			
			
			<label>6.  Reason for Transfer:</label><br/>
			 <input type="text" name="reason" value="<%= reason%>"  maxlength="100" placeholder="Comments..." readonly> <br/>
				<p>(100 words maximum)</p>
		
			<label>7.  Department Head:<br> (For Approval)</label>
			 <select id="type" name="approveBy" readonly>
			 	<option value="<%= approveBy%>"><%= approveBy%></option>
          		<option value="Colombo">A.P.Kaurnanayake</option>
          		<option value="Gampaha">G.L.Gamage</option>
          		<option value="Galle">A.D.Rajapaksha</option>
          		<option value="Galle">E.K. Perera</option>
          		<option value="Galle">A.D.P.De Silva</option>
        	</select>
	
	<input type="submit" value="Delete">
	</form>
	</div>
	</div>
	

	<div class="footer">
 		 <h2>-Copyrights 2020@ Employee Management System-</h2>
	</div>

</body>
</html>