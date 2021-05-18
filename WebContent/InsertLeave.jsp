<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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

button :hover {
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


input,select{
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


</style>
</head>
<body>








	<div class="header">
	
		<img src="Images/uplift.png" class="logo" alt="company logo">
		<div class="header-right">
  		<h1>Employee Management System</h1>
  		<p>Uplift Digital Marketing PVT. LTD.</p>
  		</div>
  	
	</div>

		<button class="ab" onclick="#" >Home</button>
		<button class="ab" onclick="#" >Admin</button>
		<button class="ab" onclick="#" >Contact</button>
		<button class="ab" onclick="#" >About Us</button>
		
		
		
		
		
		
		
		
		
		
		

	<div class="modal-content animate">
		
		<h1 align ="center"> Leaves </h1>
		
		<div class="container">
		
	<form action="InsertLeaveServlet" method="post">
		
		Employee ID <input type="text" name="empID" required><br>
		Leave Code 
		<select id="type" name="leaveCode" required>
			<option value="">Select One..</option>
			<option value="Personal Leave"> Personal Leave </option>
			<option value="Casual Leave"> Casual Leave </option>
			<option value="Sick Leave"> Sick Leave </option>
			<option value="Annual Leave"> Annual Leave </option>
			<option value="Duty Leave"> Duty Leave </option>
		</select><br>
		From <input type="date" name="fdate" required><br>
		To <input type="date" name="tdate" required><br>
		Type 
		<select id="type" name="type" required>
			<option value="">Select One..</option>
			<option value="Whole Day"> Whole Day </option>
			<option value="Half Day"> Half Day </option>
		</select><br>
		Reason <input type="text" name="reason" required><br>
		Status <input type="text" name="status" value="Pending" readonly><br>
		
		<input type="submit" value="Add Leave"> 
	</form>
	</div>
	</div>
	
	<div class="footer">
 		 <h2>-Copyright 2021@ Employee Management System-</h2>
	</div>

</body>
</html>