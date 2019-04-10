<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>create customer rep</title>
</head>
<body>
<%
try {
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String email = request.getParameter("email");
String password = request.getParameter("password");
if (email.isEmpty() || password.isEmpty()){
out.print("<p>Your password or email field was empty. Please fill both of them in.</P>");
} else {
String insertCR = "INSERT INTO customerRepresentative values (?, ?, ?, ?);";
PreparedStatement ps = con.prepareStatement(insertCR);
ps.setString(1, email);
ps.setString(2, firstName);
ps.setString(3, lastName);
ps.setString(4, password);
ps.executeUpdate();
out.print("<p>Customer Rep account created</p>");
} 
con.close();
} catch (Exception ex) {
}
%>
<form method="post" action="administrativeStaffPage.jsp">
<input type="submit" value="Back"><br>
</form>
</body>
</html>