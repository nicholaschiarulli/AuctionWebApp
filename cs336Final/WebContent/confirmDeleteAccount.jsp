<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>reset</title>
</head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<%
try{
String emailParam = ""+session.getAttribute("username");
String newPasswordParam = request.getParameter("password");
int removed = 1;
ApplicationDB DB = new ApplicationDB();	
Connection con = DB.getConnection();
String str = "UPDATE customer SET removed='"+removed+"' where email = '"+emailParam+"';";
PreparedStatement ps = con.prepareStatement(str);
ps.executeUpdate();
out.println("Successfully Deactivated Account!");
session.invalidate();
response.sendRedirect("index.jsp");
} catch (Exception xx){
out.println("Something went wrong and deactivation did not work.");
}
%>
<a href='dashjsp'>Back to Dashboard</a>
</body>
</html>