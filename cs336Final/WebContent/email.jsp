<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>email</title>
</head>
<body>
<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>
<ul>
<li><a href='dash.jsp'>Buyer Dashboard</a></li>
<li><a href='sellerDash.jsp'>Seller Dashboard</a></li>
  <li><a href='searchItems.jsp'>Search for Jewelry</a></li>
    <li>  <a href='question.jsp'>Ask a Question</a></li>
     <li><a href='forum.jsp'>Browse Questions Asked</a></li>
  <li><a href='logout.jsp'>Log out</a></li>
</ul>
<div>
<h1>Send an Email to a Customer Representative or another User</h1>
<form method="post" action="emailPage.jsp">
<table>
<tr>    
<td>Email To: </td><td><input type="text" name="email"></td>
</tr>
<tr>    
<td>Subject: </td><td><input type="text" name="subject"></td>
</tr>
<tr>
<td>Content: </td><td><textarea name="content" rows ="10" > </textarea></td>
</tr>
</table>
<br>
<input type="submit" value="Send" class="button">
</form>
</div>
</body>
</html>