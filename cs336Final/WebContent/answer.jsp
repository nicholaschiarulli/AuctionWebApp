<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>answer</title>
</head>
<body>
<%int idforum = Integer.parseInt(request.getParameter("idforum")); %>
<form method="post" action="answerPage.jsp?idforum=<%=idforum %>">
<table border="4">
<tr>
<td> <font size="+3">Answer to Question:</font></td><td><textarea name="answer" rows ="10" > </textarea></td>
</tr>

</table>

<br>
<input type="submit" value="submit" class="button">
</form>
</body>
</html>


