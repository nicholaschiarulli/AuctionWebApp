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
<p>Welcome <%out.print(session.getAttribute("name")); %></p>
<p><a href='searchItems.jsp'>Click this link to search for jewelry</a></p>
<p>Your current alerts</p>
<table border='4'>
<tr>
<th>Name of Jewelry</th>
<th>Current Bid</th>
<th>Closing date</th>
</tr>
<% 
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String str = "SELECT j.jewelryID, j.name, iob.closingDate FROM jewelry as j JOIN infoOfBid as iob on j.jewelryID = iob.jewelryID JOIN alert as a on a.jewelryID = j.jewelryID WHERE a.email = '" + session.getAttribute("username") + "';";
ResultSet result = stmt.executeQuery(str);
while(result.next()){
int id= result.getInt("j.jewelryID");
String name = result.getString("j.name");
String date = result.getString("iob.closingDate");
String currentCost = "This item has no bids";
String str1 = "SELECT cb.cost FROM CurrentBid as cb join jewelry as j on cb.jewelryID = j.jewelryID WHERE j.jewelryID = " + id;
Statement stmt1 = con.createStatement();
ResultSet result1 = stmt1.executeQuery(str1);
if(result1.next()){
currentCost = result1.getString("cb.cost");
}
out.print("<tr><th><a href='jewelryPage.jsp?id=" + id + "'>" +name + "</a></th>");
out.print("<th>" + currentCost +"</th>");
out.print("<th>"+ date + "</th></tr>");
				
}
con.close();
%>
</table>
<p>Email</p>
<table border='4'>
<tr>
<td>From</td>
<td>Subject</td>
<td>Content</td>
<td>Time</td>
</tr>
<%
Connection con1 = db.getConnection();
Statement stmt2 = con1.createStatement();
 	
str = "SELECT fromCol, date_time, theSubject, content FROM Email WHERE toCol='"+session.getAttribute("username")+"'";
ResultSet result1 = stmt2.executeQuery(str);
while(result1.next()){
String fromCol = result1.getString("fromCol");
String date_time = result1.getString("date_time");
String theSubject = result1.getString("theSubject");
String content = result1.getString("content");
out.print("<tr><th>" +fromCol + "</th>");
out.print("<th>" + theSubject +"</th>");
out.print("<th>"+content + "</th>");
out.print("<th>"+date_time+"</th></tr>");	
}
%>
</table>

<br>
<a href='EmailPage.jsp'>Send an email to a customer representative</a>
<br>
<br>
<br>
<p><a href='buyerHistory.jsp'>Click this link to see your history of bidding</a></p>
<p><a href='sellerDash.jsp'>Click this link for the seller dashboard</a></p>
<p><a href='q.jsp'>Click this link to ask a question</a></p>
<p><a href='removeBid.jsp'>Click this link to request to remove a bid</a></p>
<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>