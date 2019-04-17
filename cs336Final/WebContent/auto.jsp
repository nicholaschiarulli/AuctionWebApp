<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>auto</title>
</head>
<body>
<%String act = "autoBidTester.jsp?id=" + request.getParameter("id") + "&name=" + request.getParameter("name"); %>
<form method="post" action=<%=act%>>
<p> Jewelry ID: <font color = "green"> <% out.print(request.getParameter("id")); %></font> </p>
<table>
<tr >    
<td>Max Value: </td>
<td> <input type="text" name="maxVal"> </td>
</tr>
</table>
<br>
<input type="submit" value="Set Auto Bid" class="button">
</form>
<% out.print("<a href='jewelryPage.jsp?id=" + request.getParameter("id") + "&name=" + request.getParameter("name") + "'>cancel</a>"); %>
</body>
</html>