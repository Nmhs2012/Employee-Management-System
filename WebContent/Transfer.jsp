<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transfer Page</title>
</head>
<body>

	
	<table>
	
	<c:forEach var="Employee" items="${empDetails}">
	
	<c:set var ="id" value ="${Employee.id}"/>
	<c:set var ="name" value ="${Employee.name}"/>
	<c:set var ="address" value ="${Employee.address}"/>
		
		<tr>
			<td>1.Name:</td>
			<td>${Employee.name}</td>
		</tr>
		<tr>
			<td>2. Address:</td>
			<td>${Employee.address}</td>
		</tr>
		<tr>
			<td>3. Staff No:</td>
			<td>${Employee.id}</td>
		</tr>
		
	</c:forEach>
	
	<c:forEach var="Department" items="${depDetails}">
	
	
	<c:set var ="dname"  value ="${Department.dname}"/>
	<c:set var ="dlocation" value ="${Department.dlocation}"/>
	<c:set var ="manager" value ="${Department.manager}"/>
		
		<tr>
			<td>4. Department:</td>
			<td>${Department.dname}</td>
		</tr>
		
	</c:forEach>
	</table>
	
	<table>
		<tr>
			<td>5. Employee Records:</td>
		</tr>
		<tr>
			<td></td>
			<td>Branch </td>
			<td>Department </td>
			<td>Period From </td>
			<td>Period To </td>
			<td>Job Title </td>
		</tr>
	</table>
	
	
	
	6. Work Place now Requested (Order of Preference):
	<form action="InsertTransferServlet" method="post">
	<table>	
		<tr>
			<td>Branch:</td>
			<td>

			<input type="text" name="tBranch">

			</td>
		</tr>
		<tr>
			<td>Department: </td>
			<td>
			
			<input type="text" name="tDepartment">	

			</td>
			<td> <input type="submit" name="Submit" value = "Add" ></td>
		</tr>
	
	</table>
	
	<table>
		<tr>
			<td>7. Reason for Transfer:</td>
			<td> <textarea name="reason" rows="6" cols="40"> Comments...</textarea></td>
		</tr>
	</table>
	<table>
		<tr>
			<td>8. Department Head:<br> (For Approval)</td>
			<td> <input type="text" name="approval"></td>
			<td> <button type="button" onclick="#"> Select </button> </td>
		</tr>
	
	</table>
	
	<input type="submit" value="Submit">
	</form>
	

</body>
</html>