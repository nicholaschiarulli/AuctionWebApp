<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>Password Forgot</title>
</head>
<body>
<%
String emailParam = request.getParameter("email");
String newPasswordParam = request.getParameter("password");
Timestamp currentTime = new Timestamp(System.currentTimeMillis());
try{
ApplicationDB DB = new ApplicationDB();	
Connection con = DB.getConnection();
String str = "insert into Email values (?, ?, ?, ?,?);";
PreparedStatement ps = con.prepareStatement(str);
ps.setString(1, emailParam);
ps.setString(2, "CR");
ps.setTimestamp(3, currentTime);
ps.setString(4,"ResetMyPassword");
ps.setString(5,"Please set my new password to: "+newPasswordParam);
ps.executeUpdate();
out.println("Succesful");
con.close();
} catch (Exception x) {
out.println(x);
}
%>
<a href='index.jsp'>Back to login page</a>
</body>
</html>