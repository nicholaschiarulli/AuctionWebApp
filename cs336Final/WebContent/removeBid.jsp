<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>removeB</title>
</head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<div>
<h1>This is the Form to Request the Removal of a Bid</h1>
<h2>NOTE: You should only request a bid removal if you have the current bid of this item</h2>

<form method="post" action="removeBidPage.jsp">
<table>
<tr>    
<td>Your Email: </td><td><input type="text" name="email"></td>
</tr>
<tr>
<td>Jewelry ID: </td><td><input type="text" name="jewelryID"></td>
</tr>
</table>
<br>
<input type="submit" value="Request Removal of Bid" class="button">
</form>
</div>
<br>
<a href='dash.jsp'>Buyer Dashboard</a>

</body>
</html>