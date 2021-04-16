<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}

input {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
 	background-color: DarkCyan;
  	color: white;
	padding: 14px 20px;
 	margin: 8px 0;
 	border: none;
  	cursor: pointer;
  	width: 50%; 
  	transform: translate(50%);
}

button:hover {
  	opacity: 0.8;
}

.container {
  	padding: 16px;
}

.modal {
	background-color: grey; 
 	padding-top: 60px;
  	padding-bottom: 60px;
}

.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

</style>

</head>
<body>

	<div id="id01" class="modal">

	<form class="modal-content animate" action="LoginServlet" method="post" >
		<h1 align ="center"> Login Form</h1>
		
		<div class="container">
		User Name <input type="text" name="username" placeholder = "Enter user username"><br><br><br>
		Password <input type="password" name="password" placeholder = "Enter user password"><br><br><br><br>
		
		<button type="submit" name="submit"> Login </button>
	</div>	
	
	</form>
	
	</div>
	
</body>
</html>