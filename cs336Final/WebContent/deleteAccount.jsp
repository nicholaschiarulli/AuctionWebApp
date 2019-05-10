<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>DeleteAccount</title>
</head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<%
String passwordParam = request.getParameter("password");
String passwordConfirmParam = request.getParameter("passwordConfirm");
String password ="";
String emailParam = ""+session.getAttribute("username");

if(passwordParam.isEmpty() || emailParam.isEmpty()) {
out.println("<h1>Password field was empty. Please fill both in.</h1>");
} 
else if(passwordParam.equals(passwordConfirmParam)==false){
	out.println("<h1>Password does not match confirm password please try again.</h1>");
}
else {
try { 	
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String str = "SELECT password FROM customer WHERE email=" + "'"+emailParam+"';" ;
ResultSet result = stmt.executeQuery(str);
if(result.next()){
 password = result.getString("password");
}
con.close();
if(passwordParam.equals(password)==false){
	out.println("<h1>Password does not match password in the database! Please try again.</h1>");

}
else{
	





%>

<h1>ARE YOU SURE YOU WANT TO DEACTIVATE YOUR ACCOUNT?</h1>
<h1>THIS CANNOT BE UNDONE!</h1>
<h1>ALL OF YOUR INFORMATION WILL STILL APPEAR ON THE WEBSITE</h1>
<h1>IT IS RECCOMENDED THAT YOU REQUEST A CUSTOMER REPRESEANTIVE TO REMOVE ANY CURRENT BIDS YOU MAY HAVE</h1>
<h1>IF YOU DO NOT GET THEM REMOVED YOU WILL STILL BE RESPONSIBLE FOR PURCHASING THEM IF YOU END UP AS THE WINNER OF THE AUCTION!</h1>

<form method="post" action="confirmDeleteAccount.jsp">

<br>
<input type="submit" value="confirmDeactivate" class="button">
</form>
<br>

<%
}
}catch (Exception x) {
	out.print("<h1>Error in your information.</h1>");
	}
}
%>
<form method="post" action="Dash.jsp">
<input type="submit" value="Back to Buyer/Basic Dashboard" class="button">
</form>
</body>
</html>