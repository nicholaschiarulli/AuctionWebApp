<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>Admin</title>
</head>
<body>
<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<h3>Create an Account for a Customer Representative</h3>
<br>
<br>
<form method="post" action="createCustomerRep.jsp">
<table border ="4">
<tr>
<td>First Name:</td><td><input type="text" name="firstName"></td>
</tr>

<tr>
<td>Last Name:</td><td><input type="text" name="lastName"></td>
</tr>

<tr>
<td>Email:</td><td><input type="text" name="email"></td>
</tr>

<tr>
<td>Password:</td><td><input type="password" name="password"></td>
</tr>

</table>
<br>

<br>
<input type="submit" value="Create Customer Representative" class="button">
</form>
<br>

<br>
<form method="get" action="salesHistory.jsp" name="salesReport">
<table border="4">
<tr>
	<td>Get Sales Report:</td>
	<td>
	<select name="sales">
	<option></option>
	<option value="1">Total Earnings</option>
	<option value="2">Earnings Per Jewelry</option>
	<option value="3">Earnings Per Jewelry Type</option>
	<option value="4">Earnings Per Seller</option>
	<option value="5">Best Selling Jewelry </option>
	<option value="6">Best Buyers </option>
	</select>
	</td>
</tr>
</table>
<br>

<br>
<input type="submit" value="Get Sales Report" class="button">
</form>
<br>


<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>