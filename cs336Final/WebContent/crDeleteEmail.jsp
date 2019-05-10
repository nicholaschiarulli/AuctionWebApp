<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>Delete Email</title>
</head>
<body>
<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<%

try{

	String fromCol = (request.getParameter("f"));
	String toCol = (request.getParameter("t"));
	String date_time = (request.getParameter("d"));

	//out.print(date_time);
ApplicationDB DB = new ApplicationDB();	
Connection con = DB.getConnection();
String str = "DELETE FROM Email WHERE fromCol = '"+fromCol+"' and toCol = '"+toCol+"' and date_time = '"+date_time+"';";
PreparedStatement ps = con.prepareStatement(str);
ps.executeUpdate();
out.print("Successfully deleted email sent to you.");
con.close();
} 
catch (Exception x){
out.print("Something prevented you from deleting this email. Please try again.");
}
%>
<a href='customerRepresentativePage.jsp'>Back to Customer Representative Page</a>
</body>
</html>