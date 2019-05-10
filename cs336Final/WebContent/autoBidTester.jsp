<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>Auto Bid</title>
</head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<%
int id = Integer.parseInt(request.getParameter("id"));
int maxVal = Integer.parseInt(request.getParameter("maxVal"));
int cost=0;
int increment =0;
//out.println("id = " + id + "\nmaxVal = " + maxVal + "\nemail = " + session.getAttribute("username").toString());

String email = session.getAttribute("username").toString();
try
{
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();

String str0 = "select email from Auto where jewelryID = "+id+";";

ResultSet result0 = stmt.executeQuery(str0);
Statement stmtz = con.createStatement();
String strz = "SELECT emailOfSeller FROM jewelry WHERE jewelryID = "+id;
ResultSet resultz = stmtz.executeQuery(strz);

if(result0.next()){
	out.println("<h1>Sorry someone has already set an Auto Bid on this item.</h1>");
	out.println("<h1>We have a policy that not more than one account can have an Auto Bid on an item.</h1>");

	con.close();
}




else if(resultz.next()){
if(resultz.getString("emailOfSeller").equals(email)){
out.println("You cannot place an Auto Bid on your own item!");
//	out.print("below are two links. You can either head back to the jewelry page or become a buyer as well!");
con.close();
//out.println("<a href='becomeBuyer.jsp'>Become a buyer as well</a>");
}
}
else{


String str = "select increment from infoOfBid where jewelryID = "+id+";";
ResultSet result = stmt.executeQuery(str);

if(result.next()){
	 increment = result.getInt("increment");
}

 str = "select cost from CurrentBid where jewelryID = "+id+";";
  result = stmt.executeQuery(str);

 if(result.next()){
 	 cost = result.getInt("cost");
 }
 str = "Insert into Auto values('" + email + "'," + id + ", " + maxVal + ");";
PreparedStatement preparedStmt = con.prepareStatement(str);
preparedStmt.executeUpdate();

con.close();
int total = increment + cost;
if(total> maxVal){
	out.println("Your max value set is less than the current bid plus the increment please set one higher than "+total+"");	
}else{
out.println("The Auto bid is set up!");
response.sendRedirect("bidPage.jsp?id=" + request.getParameter("id") + "&bidAmount=" + total+ "");
}
}
}
catch (Exception ex) 
{
//out.println(ex);
out.println("error");
}

out.println("<p><a href='jewelryPage.jsp?id=" + request.getParameter("id")+"'>Back</a></p>");
out.println("<p><a href='dash.jsp'>Buyer Dashboard</a></p>");
out.println("<p><a href='logout.jsp'>Log out</a></p>");
%>

</body>
</html>