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
<p>Create an account for a customer representative</p>
<br>
<form method="post" action="createCustomerRep.jsp">
<table>
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
<input type="submit" value="submit" class="button">
</form>

<br>
<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>