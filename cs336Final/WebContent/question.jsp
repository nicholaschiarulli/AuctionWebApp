<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post Question</title>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<body>
<ul>
<li><a href='dash.jsp'>Buyer Dashboard</a></li>
<li><a href='sellerDash.jsp'>Seller Dashboard</a></li>
  <li><a href='searchItems.jsp'>Search for Jewelry</a></li>
  <li><a href='forum.jsp'>Browse Questions Asked</a></li>
   <li> <a href='email.jsp'>Send an Email</a></li>
  <li><a href='logout.jsp'>Log out</a></li>
</ul>
<form method = "post" action = "submitQuest.jsp">
<table>
<tr><td><font color = 'white'>NAME:</font></td> <td><font color = 'white'> <%out.println(" " + session.getAttribute("name")); %></font> </td> </tr>
<tr><td><font color = 'white'>SUBJECT:</font></td> <td><input type="text" name="subject"></td></tr>
<tr><td valign = "top"><font color = 'white'>QUESTION:</font></td> <td valign = "top"> <textarea name="question" rows="10" cols="18"></textarea>   </td></tr>

<tr><td><input type="submit" value="POST" class="button"></td><td> <a href='dash.jsp'>Cancel</a> </td></tr>
</table>
</form>


</body>
</html>