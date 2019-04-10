<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>SearchItemsPage</title>
</head>
<body>
<p>Jewelry available based off of your filters</p>

<table border="4">
<tr>
<th>Click The Item Name</th>
<th>Current Bid</th>
<th>Closing date</th>
</tr>
	
<%
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String type = request.getParameter("type");
String sort = request.getParameter("sort");
String keyword =request.getParameter("keyword");
String condition = request.getParameter("condition");
String color = request.getParameter("color");
	
if(keyword.isEmpty()){
keyword = "";
} 
else {
keyword = " and j.name like '%"+keyword+"%'";
}
if(type.isEmpty()){
type = "";
} 
else {
type = " and j.type = '"+type+"'";
}
if(condition.isEmpty()){
condition = "";
} 
else {
condition = " and j.condition='" + condition+"'";
}
if(color.isEmpty()){
color = "";
} 
else {
color = " and j.color='"+color+"'"; 
}
if(sort.isEmpty()){
sort="";
} 
else {
sort = " order by "+ sort;
}
			
String str = "SELECT j.jewelryID FROM jewelry as j WHERE j.status=0"+keyword+type+condition+color+sort;
ResultSet result = stmt.executeQuery(str);
while(result.next()){
int jewelry_ID=result.getInt("j.jewelryID");
String str1 ="SELECT j.jewelryID, j.name, iob.closingDate FROM jewelry as j join infoOfBid as iob on j.jewelryID = iob.jewelryID WHERE j.jewelryID =" + jewelry_ID;
Statement stmt1 = con.createStatement();
ResultSet result1 = stmt1.executeQuery(str1);
while(result1.next()){
int id= result1.getInt("j.jewelryID");
String nameOfJewelry = result1.getString("j.name");
String closingDate = result1.getString("iob.closingDate");
String currentCost = "jewelry item has no bids";
String str2 = "SELECT cb.cost FROM CurrentBid as cb join jewelry as j on cb.jewelryID = j.jewelryID WHERE j.jewelryID = " + id;
Statement stmt2 = con.createStatement();
ResultSet result2 = stmt2.executeQuery(str2);
if(result2.next()){
currentCost = result2.getString("cb.cost");
}
out.print("<tr><th><a href='jewelryPage.jsp?id=" + id + "'>"+ nameOfJewelry+ "</a></th>");
out.print("<th>" + currentCost +"</th>");
out.print("<th>"+ closingDate + "</th></tr>");
}
}
con.close();
%>
</table>
<p><a href='searchItems.jsp'>Back to search</a></p>
<p><a href='dash.jsp'>Buyer's Dashboard</a></p>
<p><a href='logout.jsp'>Log out</a></p>
</body>
</html>