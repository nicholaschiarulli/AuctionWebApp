<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>alert</title>
</head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<%
int jewelryID = Integer.parseInt(request.getParameter("id"));
String type = request.getParameter("type");
String name = request.getParameter("name");
String color = request.getParameter("color");
String size = request.getParameter("size");
String brand = request.getParameter("brand");

out.print("The Jewelry ID that you set an alert on is "+jewelryID);
try {
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String email = ""+session.getAttribute("username");
String str = "INSERT INTO alert values (?, ?, ?, ?, ?, ?, ?);";
PreparedStatement ps = con.prepareStatement(str);
ps.setString(1, email);
ps.setInt(2, jewelryID);
ps.setString(3, name);
ps.setString(4, type);
ps.setString(5, color);
ps.setString(6, size);
ps.setString(7, brand);
ps.executeUpdate();
out.print("<h1>Alerted. All of your alerts will appear on the basic DashBoard.</h1>");
con.close();
} catch (Exception x) {
out.print("<h1>You have already placed an alert on this item</h1>");
}
%>
<p><a href='dash.jsp'>Click this to go back to basic dashboard</a></p>
</body>
</html>