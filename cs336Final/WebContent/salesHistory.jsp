<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.lang.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>Sales History</title>
</head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<h1>Sales History</h1>
<%double earnings = 0.0;%>

<%
try {
	
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();

String sales = request.getParameter("sales");
if(sales.equals("1") == true)
{
String str = "SELECT SUM(cost) 'Total Earnings' FROM Sold;";
ResultSet result = stmt.executeQuery(str);
if(result.next()){
%>
<h3>Total Earnings</h3>

<%




 out.println("<h3>$ "+result.getFloat("Total Earnings")+"</h3>");

}

else{
	out.println("There is not any data available for that currently.");
}
}

else if(sales.equals("2") == true)
{
String str = "SELECT s.jewelryID, j.brand, j.name, SUM(s.cost) 'Earnings Per' FROM Sold s, jewelry j where j.jewelryID = s.jewelryID GROUP BY s.jewelryID order by SUM(s.cost) DESC;";
ResultSet result = stmt.executeQuery(str);
if(result.next()){%>
<h3>Earnings Per Jewelry</h3>
<table border ="4">
<tr>
<th>Jewelry ID</th>

<th>Brand Name</th>

<th>Jewelry Name</th>

<th>Total Earnings</th>
			
</tr>


<tr>
<td><% out.println(result.getString("s.jewelryID"));%></td>
<td><% out.println(result.getString("j.brand"));%></td>
<td><% out.println(result.getString("j.name"));%></td>
<td><% out.println(result.getFloat("Earnings Per"));%></td>

						
</tr>
<%
while(result.next()){
%>
<tr>
<td><% out.println(result.getString("s.jewelryID"));%></td>
<td><% out.println(result.getString("j.brand"));%></td>
<td><% out.println(result.getString("j.name"));%></td>
<td><% out.println(result.getFloat("Earnings Per"));%></td>
						
</tr><%
}
%>
</table><%
}
	
else{
out.println("There is not any data available for that currently.");
}
}

else if(sales.equals("3") == true)
{
String str = "SELECT s.type, SUM(s.cost)'Earnings Per Type' FROM Sold s GROUP BY s.type;";
ResultSet result = stmt.executeQuery(str);
if(result.next()){%>
<h3>Earnings Per Types of Jewelry</h3>
<table border="4">
<tr>
<th>Jewelry Type</th>
<th>Earnings</th>
</tr>
<tr>
<td><% out.println(result.getString("s.type"));%></td>
<td><% out.println(result.getFloat("Earnings Per Type"));%></td>
</tr>
<%
			
while(result.next()){
%>
<tr>
<td><% out.println(result.getString("s.type"));%></td>
<td><% out.println(result.getFloat("Earnings Per Type"));%></td>
			
</tr><%
}%>
</table><%
}

else{
	out.println("There is not any data available for that currently.");
}
}

else if(sales.equals("4") == true)
{
String str = "SELECT email, SUM(cost)'Sell' FROM Sold GROUP BY email ORDER BY email;";
ResultSet result = stmt.executeQuery(str);
if(result.next()){
%>
<h3>Earnings Per Seller</h3>
<table border="4">
<tr>
<th>Seller's Email</th>
<th>Seller's Earnings</th>
</tr>
<tr>
<td><% out.println(result.getString("email"));%></td>
<td><% out.println(result.getFloat("Sell"));%></td>
			
</tr>
<%
			
while(result.next()){
%>
<tr>
<td><% out.println(result.getString("email"));%></td>
<td><% out.println(result.getFloat("Sell"));%></td>
			
</tr><%
}%>
</table><%
}
		
else{
out.println("There is not any data available for that currently.");
}
}
	
else if(sales.equals("5") == true)
{
String str = "SELECT s.jewelryID,j.name, COUNT(s.color)'itemSold', SUM(s.cost)'itemEarning' FROM Sold s, jewelry j where j.jewelryID = s.jewelryID GROUP BY s.jewelryID order by SUM(s.cost) DESC;";
ResultSet result = stmt.executeQuery(str);
if(result.next()){
%>
<h3>Best Selling Jewelry Items from Best to Worst</h3>
<table border ="4">
<tr>
<th>Jewelry ID</th>

<th>Jewelry Name</th>

<th>Quantity</th>

<th>Total Earnings</th>
			
</tr>
<tr>
<td><% out.println(result.getString("s.jewelryID"));%></td>
<td><% out.println(result.getString("j.name"));%></td>
<td><% out.println(result.getInt("itemSold"));%></td>
<td><% out.println(result.getFloat("itemEarning"));%></td>
						
</tr>
<%
while(result.next()){%>
<tr>
<td><% out.println(result.getString("s.jewelryID"));%></td>
<td><% out.println(result.getString("j.name"));%></td>
<td><% out.println(result.getInt("itemSold"));%></td>
<td><% out.println(result.getFloat("itemEarning"));%></td>
						
</tr><%
}%>
</table><%
}
}

else if(sales.equals("6") == true)
{
String str = "SELECT b.email'Buyer_Email', COUNT(b.email)'Bids_Bought', SUM(s.cost)'amount_spent' FROM Buyer b, Sold as s where b.email = s.email GROUP BY Buyer_Email order by amount_spent DESC;";
ResultSet result = stmt.executeQuery(str);
if(result.next())
{%>
<h3>Best Buyers from Best to Worst</h3>
<table border ="4">
<tr>
<th>Email of Buyer</th>

<th>Number of Bought Bids</th>

<th>Amount spent</th>
			
</tr>
<tr>
<td><% out.println(result.getString("Buyer_Email"));%></td>

<td><%out.println(result.getInt("Bids_Bought"));%></td>

<td><%out.println(result.getFloat("amount_spent"));%></td>
					
</tr>
<% 
while (result.next()){
%>
<tr>
<td><% out.println(result.getString("Buyer_Email"));%></td>

<td><%out.println(result.getInt("Bids_Bought"));%></td>

<td><%out.println(result.getFloat("amount_spent"));%></td>
					
</tr><%
} 
%>
</table>
<%
}
else{
	out.println("There is not any data available for that currently.");
}
		
}
else
{
	out.println("You have to Choose an Option.");
}
con.close();
}
catch (Exception x)
{
out.println(x);
out.println("error");
}
%>

<p><a href='administrativeStaffPage.jsp'>Go back to Admin Page</a></p>
<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>