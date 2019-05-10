<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>remove</title>
</head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

<%

//Find next highest value in cost column for bid for jewelryId. 
///set that value to the new currentBid on that jewelryID
//Then remove the bid using the bidID to complete the process
try{
int cost = 0;
int bid =0;
int initialBid = 0;
String email = "";
String emailParam = request.getParameter("email");
int jewelryID = Integer.parseInt(request.getParameter("jewelryID"));
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String str0 = "SELECT * FROM CurrentBid where jewelryID ="+jewelryID+" and email ='"+emailParam+"';";
ResultSet result0 = stmt.executeQuery(str0);
if(result0.next()){



String str = "SELECT * FROM Bid where jewelryID ="+jewelryID+" ORDER BY cost DESC LIMIT 2;";
ResultSet result = stmt.executeQuery(str);
if(result.next()){
initialBid = result.getInt("BidID");

}
if(emailParam!= result.getString("email")){
out.println("<h1>A customer cannot request to remove the bid of another customer</h1>");
}
else{
while(result.next()){
cost= result.getInt("cost");
bid = result.getInt("BidID");
email = result.getString("email");


}
str ="DELETE FROM Bid WHERE BidID = "+initialBid+" ";
PreparedStatement ps1 = con.prepareStatement(str);
ps1.executeUpdate();

str ="INSERT INTO CurrentBid values(?,?,?,?)";
PreparedStatement ps = con.prepareStatement(str);
ps.setInt(1, jewelryID);
ps.setInt(2, bid);
ps.setString(3, email);
ps.setInt(4, cost);
ps.executeUpdate();
out.println(cost);
}
}
else{
out.println("<h1>You cannot remove this bid it is not the current bid</h1>");
	
}
con.close();
} catch(Exception x) {
	out.println(x);

}
%>
<a href='customerRepresentativePage.jsp'>Back to Customer Representative Page</a>
</body>
</html>