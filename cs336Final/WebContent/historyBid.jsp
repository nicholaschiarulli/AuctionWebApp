<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css" />
<title>Bid History</title>
</head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<%
int jewelryID = Integer.parseInt(request.getParameter("id"));%>

<form method ="post">
<%
try {
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();

	String str = "select BidID, email, cost from Bid where jewelryID =" + jewelryID + ";";
	ResultSet result = stmt.executeQuery(str);
	if(result.next())
	{%>
	<table border="4">
			<tr>
				<th>BidID</th>
				<th>Bidder Email</th>
				<th>Bid Amount</th>
				
				
			</tr>
			
			<tr>
				<td><% out.println(result.getInt("BidID"));%></td>
				<td><% out.println(result.getString("email"));%></td>
				<td><% out.println(result.getFloat("cost"));%></td>
				</tr>
			<%
			while(result.next()){%>
				
				<tr>
				<td><% out.println(result.getInt("BidID"));%></td>
				<td><% out.println(result.getString("email"));%></td>
				<td><% out.println(result.getFloat("cost"));%></td>
				</tr><%
				}%>
			</table>
			<br>
			<%
	}
   }
   catch (Exception ex)
{
out.println(ex);
out.println("error");
}
out.print("<a href='jewelryPage.jsp?id=" + jewelryID + "'>Go back to Jewelry Item</a>");

%></form>
</body>
</html>