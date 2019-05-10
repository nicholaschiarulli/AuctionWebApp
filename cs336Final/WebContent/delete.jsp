<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>Delete</title>
</head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<h1>FORM TO DEACTIVATE YOUR ACCOUNT</h1>
<form method="post" action="deleteAccount.jsp">
<table>
<tr>
<td >Password: </td><td><input type="password" name="password"></td>
</tr>
<tr>
<td >Confirm Password: </td><td><input type="password" name="passwordConfirm"></td>
</tr>
</table>
<br>
<input type="submit" value="Deactivate" class="button">
</form>
<br>
<form method="post" action="Dash.jsp">
<input type="submit" value="Back to Buyer/Basic Dashboard" class="button">
</form>

</body>
</html>