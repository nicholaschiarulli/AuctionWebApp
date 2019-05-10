
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>CR Page</title>
</head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<ul>
  <li> <a href='jewelryData.jsp'>View Jewelry and IDs</a></li>
    <li><a href='CRforum.jsp'>Answer Questions on the Forum</a></li>
   <li> <a href='email.jsp'>Send an Email</a></li>
  <li><a href='logout.jsp'>Log out</a></li>
</ul>
<%
String email_username = ""+session.getAttribute("username");
out.println("<h1>Hello Customer Representative  " + email_username+"</h1>");
%>
<br>
<br>
<h3>EMAILS SENT TO YOU</h3>

<table border="4">
<tr>
<td>From</td>
<td>Subject</td>
<td>Content</td>
<td>Time Sent</td>
<td>Remove Email</td>
</tr>
<%
ApplicationDB db = new ApplicationDB();	
	
Connection con = db.getConnection();
Statement state = con.createStatement();
 	
String str = "select * from Email where toCol='CR' OR toCol=" + "'"+email_username+"';";
ResultSet result = state.executeQuery(str);
while(result.next()){
			
String fromCol = result.getString("fromCol");
String content = result.getString("content");
String date_time = result.getString("date_time");
String theSubject = result.getString("theSubject");
String toCol = result.getString("toCol");
out.print("<tr><th>" +fromCol + "</th>");
out.print("<th>" + theSubject +"</th>");
out.print("<th>"+content + "</th>");
out.print("<th>"+date_time+"</th>");  
out.print("<th><a href='crDeleteEmail.jsp?f=" + fromCol+ "&t=" + toCol+ "&d=" + date_time+"'>Delete</a></th><tr>");   
	
}
con.close();
	
%>
</table>
<br>
<br>
<b>Reset Password</b>
<form method="post" action="reset.jsp">

<table border="4">
<tr>
<td>Customer Email:</td><td><input type="text" name="email"></td>
</tr>

<tr>
<td>New Password:</td><td><input type="password" name="password"></td>
</tr>
</table>
<br>
<input type="submit" value="Reset Password" class="button">
</form>

<br>
<br>
<b>Remove a Bid</b>
<b>NOTE: Only remove a bid if it is the current bid of an item</b>
<form method="post" action="remove.jsp">
<table border="4">
<tr>
<td>ID of Jewelry:</td><td><input type="text" name="jewelryID"></td>
</tr>

<tr>
<td>Customer Email:</td><td><input type="text" name="email"></td>
</tr>
</table>

<br>
<input type="submit" value="Remove Bid" class="button">
</form>


<br>

<b>Remove Illegal Auction</b>
<form method="post" action="auctionRemove.jsp">
<table border="4">
<tr>
<td>ID of Jewelry:</td><td><input type="text" name="jewelryID"></td>
</tr>

</table>

<br>
<input type="submit" value="Remove Auction" class="button">
</form>

<br>

<br>
<p><a href=crForum.jsp>Answer Questions on the Forum</a></p>
<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>


