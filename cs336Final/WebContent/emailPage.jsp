<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>email Page</title>
</head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<%
String emailParam = request.getParameter("email");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String email_username = ""+session.getAttribute("username");
String newPasswordParam = request.getParameter("password");
Timestamp duration = new Timestamp(System.currentTimeMillis()- (60 * 60 * 4000));
try{
ApplicationDB DB = new ApplicationDB();	
Connection con = DB.getConnection();
String str = "insert into Email values (?, ?, ?, ?,?);";
PreparedStatement ps = con.prepareStatement(str);
ps.setString(1, email_username);
ps.setString(2, emailParam);
ps.setTimestamp(3, duration);
ps.setString(4,subject);
ps.setString(5, content);
ps.executeUpdate();
out.println("Succesfully sent an email to  "+emailParam+" ");
con.close();
} catch (Exception x) {
out.println("could not submit request email does not exist in our database. You may have entered your information wrong.");
}
%>
<a href='dash.jsp'>Back to buyer/basic Dashboard</a>
<a href='sellerDash.jsp'>Back to seller Dashboard</a>

</body>
</html>