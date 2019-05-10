<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>Dashboard</title>
</head>
<body>

<%if(session.getAttribute("username") ==null){
	response.sendRedirect("invalidated.jsp");
} %>
<ul>
<li><a href='sellerDash.jsp'>Seller Dashboard</a></li>
  <li><a href='searchItems.jsp'>Search for Jewelry</a></li>
    
   <li> <a href='email.jsp'>Send an Email</a></li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Menu</a>
    <div class="dropdown-content">
      <a href='buyerHistory.jsp'>View Your History of Bidding</a>
      <a href='forum.jsp'>Browse Questions Asked</a>
      <a href='question.jsp'>Ask a Question</a>
     <a href='removeBid.jsp'>Request to Remove a Bid</a>
    </div>
  </li>

  
  
  <li><a href='logout.jsp'>Log out</a></li>
  <li><a href='delete.jsp'>Deactivate your Account</a></li>
</ul>

<div class="box">

<h1>Welcome <%out.print(session.getAttribute("name")); %></h1>



<h3>Your Current Alerts: Shows only Available Items</h3>
<table border='4'>
<tr>
<th>Item Similar to your Alert</th>
<th>The Item you Based the Alert on</th>
</tr>
<%
ApplicationDB db = new ApplicationDB();    
Connection con = db.getConnection();
Statement stmtt = con.createStatement();
String strr = "SELECT * FROM alert WHERE email = '" + session.getAttribute("username") + "';";

ResultSet resultt = stmtt.executeQuery(strr);
while(resultt.next()){
	String na = resultt.getString("name");
	int jid = resultt.getInt("jewelryID");

String t = resultt.getString("type");
String c = resultt.getString("color");
String s = resultt.getString("size");
String b = resultt.getString("brand");
String stringg = "SELECT distinct jewelryID, name FROM jewelry where status = 0 and jewelry.type = '"
		+ t + "'and jewelry.color = '" + c + "' and jewelry.color = '"
				+ c + "' and jewelry.size = '"
						+ s + "' and jewelry.brand = '"
								+ b + "';";
Statement stmttt = con.createStatement();
ResultSet resulttt = stmttt.executeQuery(stringg);
while(resulttt.next()){
	int id= resulttt.getInt("jewelryID");
	String name = resulttt.getString("name");
	if(jid==id){}
	else{
	out.print("<tr><th><a href='jewelryPage.jsp?id=" + id + "'>NAME: " +name + "  ID: "+id+"</a></th>");
	out.print("<th><a href='jewelryPage.jsp?id=" + jid + "'>NAME: " +na + "  ID: "+jid+"</a></th>");

	}
	
}
}	

con.close();
%>
</table>
<br>
<br>
<h3>EMAILS SENT TO YOU</h3>
<table border='4'>
<tr>
<td>From</td>
<td>Subject</td>
<td>Content</td>
<td>Time Sent</td>
<td>Remove Email</td>
</tr>
<%
Connection con1 = db.getConnection();
Statement stmt2 = con1.createStatement();
	 
String str = "SELECT toCol, fromCol, date_time, theSubject, content FROM Email WHERE toCol='"+session.getAttribute("username")+"'";
ResultSet result1 = stmt2.executeQuery(str);
while(result1.next()){
String fromCol = result1.getString("fromCol");
String date_time = result1.getString("date_time");
String theSubject = result1.getString("theSubject");
String content = result1.getString("content");
String toCol = result1.getString("toCol");
out.print("<tr><th>" +fromCol + "</th>");
out.print("<th>" + theSubject +"</th>");
out.print("<th>"+content + "</th>");
out.print("<th>"+date_time+"</th>");
out.print("<th><a href='deleteEmail.jsp?f=" + fromCol+ "&t=" + toCol+ "&d=" + date_time+"'>Delete</a></th><tr>");   
}
con1.close();
%>
</table>
<br>
<br>
<br>
<br>
<h3>EMAILS FROM BUYME</h3>
<table border='4'>
<tr>
<td>Type Of Notification</td>
<td>ID of jewelry</td>
<td>Content</td>
<td>Time Sent</td>
</tr>
<%
Connection con2 = db.getConnection();
Statement stmt3 = con2.createStatement();
	 
str = "SELECT name, id, content, timeOF FROM auctionInfo WHERE email='"+session.getAttribute("username")+"'";
ResultSet result2 = stmt3.executeQuery(str);
while(result2.next()){
String name = result2.getString("name");
String id = result2.getString("id");
String content = result2.getString("content");
String time = result2.getString("timeOF");
out.print("<tr><th>" +name + "</th>");
out.print("<th>" + id +"</th>");
out.print("<th>"+content + "</th>");
out.print("<th>"+time+"</th></tr>");    
}
con2.close();
%>
</table>

<br>

<p><a href='sellerDash.jsp'>Seller Dashboard</a></p>
<p><a href='logout.jsp'>Log out</a></p>
</div>
</body>
</html>
