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
Timestamp duration = new Timestamp(System.currentTimeMillis());
try{
if(emailParam.isEmpty()|| newPasswordParam.isEmpty()){
out.println("Please fill in both fields");		
}
else{
ApplicationDB DB = new ApplicationDB();	
Connection con = DB.getConnection();
String str = "insert into Email values (?, ?, ?, ?,?);";
PreparedStatement ps = con.prepareStatement(str);
ps.setString(1, emailParam);
ps.setString(2, "CR"); 
ps.setTimestamp(3, duration);
ps.setString(4,"ResetMyPassword");
ps.setString(5,"Please set my new password to: "+newPasswordParam);
ps.executeUpdate();
out.println("<h1>Succesfully sent a reset password request to a customer representative. When a customer representative logs in they will see your request and change it if they believe it is appropriate.</h1>");
con.close();
}
} catch (Exception x) {
out.println("could not submit request email does not exist in our database. You may have entered your information wrong.");
}
%>
<a href='index.jsp'>Back to log in</a>
</body>
</html>