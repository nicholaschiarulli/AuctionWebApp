<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>Jewelry</title>
</head>
<body>


<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<% 

String name = "";
String condition = "";
String color = "";
String type = "";
String brand = "";
String size = "";
String datePosted = "";
String emailOfSeller = "";
String closingDate = "";
String currentBid = "";
int startingPrice = 0;
int increment = 0;
int status = 0;
int jewelryID = Integer.parseInt(request.getParameter("id"));
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String str = "SELECT * FROM jewelry WHERE jewelryID = '" + jewelryID + "';";
ResultSet result = stmt.executeQuery(str);
if(result.next()){
name = result.getString("name");
condition = result.getString("conditionn");
color = result.getString("color");
type = result.getString("type");
brand = result.getString("brand");
datePosted = result.getString("datePosted");
emailOfSeller = result.getString("emailOfSeller");
status = result.getInt("status");
size = result.getString("size");
} 
str = "SELECT * FROM infoOfBid WHERE jewelryID = '" + jewelryID + "';";
result = stmt.executeQuery(str);
if(result.next()){
startingPrice = result.getInt("startingPrice");
closingDate = result.getString("closingDate");
increment = result.getInt("increment");
}
str = "SELECT * FROM CurrentBid WHERE jewelryID = '" + jewelryID + "';";
result = stmt.executeQuery(str);
if(result.next()){
currentBid = ""+result.getInt("cost");
			
} else {
currentBid = "No current bids available.";
} 
con.close();
		
%>

<ul>
  <li><a href='dash.jsp'>Buyer/basic Dashboard</a></li>
  <li><a href='sellerDash.jsp'>Seller Dashboard</a></li>
<li><a href='alert.jsp?id=<%=jewelryID%>&type=<%=type%>&color=<%=color%>&brand=<%=brand%>&size=<%=size%>&name=<%=name%>'>Place an Alert on this Item</a></li>
  <li><a href='searchItems.jsp'>Search for Jewelry</a></li>
  
   
    
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Menu</a>
    <div class="dropdown-content">
      <a href='buyerHistory.jsp'>View Your History of Bidding</a>
      <a href='sellerHistory.jsp?id=<%=emailOfSeller%>'>This Seller's History</a>
     <a href='removeBid.jsp'>Request to remove a bid</a>
     <a href='similar.jsp?id=<%=jewelryID%>&type=<%=type%>&color=<%=color%>'>Similar Items</a>
     <a href='historyBid.jsp?id=<%=jewelryID%>'>History for this Auction</a>
    </div>
  </li>

  
  
  <li><a href='logout.jsp'>Log out</a></li>
</ul>
<br>
<br>


<table border = "4">
<tr>
<td>Name: </td><td><%=name %></td>
</tr>
<tr>
<td>Type: </td><td><%=type %></td>
</tr>
<tr>
<td>Brand: </td><td><%=brand %></td>
</tr>
<tr>
<td>Condition: </td><td><%=condition %></td>
</tr>
<tr>
<td>Color: </td><td><%=color %></td>
</tr>
<tr>
<td>Size: </td><td><%=size %></td>
</tr>
<tr>
<td>Initial Price: </td><td><%=startingPrice %></td>
</tr>
<tr>
<td>Increment: </td><td><%=increment %></td>
</tr>
<tr>
<td>Current Bid: </td><td><%=currentBid %></td>
</tr>
<tr>
<td>Closing Date: </td><td><%=closingDate %></td>
</tr>
<tr>
<td>Email of Seller: </td><td><%=emailOfSeller %></td>
</tr>
</table>
	<br>
	
<%
if (status == 0){
out.println("<p><a href='ifOnlySeller.jsp?id="+jewelryID+"'>Place a Bid on this Item</a></p>");
out.println("<p><a href='auto.jsp?id="+jewelryID+"'>Place an AUTO bid on this Item</a></p>");
out.println("<p><a href='dash.jsp'>Buyer Dashboard</a></p>");
out.println("<p><a href='sellerDash.jsp'>Seller Dashboard</a></p>");

}
else{
	out.println("<h2>THIS ITEM'S AUCTION ENDED</h2>");
	out.println("<p><a href='dash.jsp'>Buyer/basic Dashboard</a></p>");
	out.println("<p><a href='sellerDash.jsp'>Seller Dashboard</a></p>");

	
}
%>
<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>