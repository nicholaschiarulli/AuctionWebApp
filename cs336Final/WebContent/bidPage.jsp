<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>bidPage</title>
</head>
<body>
<%
String email = ""+session.getAttribute("username");
int jewelryID = Integer.parseInt(request.getParameter("id"));
int bidParam = Integer.parseInt(request.getParameter("bidAmount"));
try{
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String str="INSERT INTO Bid (duration, cost, jewelryID, email) values (?, ?, ?, ?);";
PreparedStatement ps = con.prepareStatement(str);
Timestamp duration = new Timestamp(System.currentTimeMillis());
ps.setTimestamp(1,duration);
ps.setInt(2,bidParam);
ps.setInt(3,jewelryID);
ps.setString(4,email);
ps.executeUpdate();
con.close();
} catch (SQLException ex) {
//out.println(ex);
if(ex.getSQLState().equals("20000")){
try{
//out.println("hello");
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String str="delete from Bid where jewelryID="+jewelryID+" and cost="+bidParam;
stmt.execute(str);
con.close();
out.println("<p>Your bid must be at least whatever the seller's increment number was plus the current price of the item!</p>");				
out.println("<p>You can go back to the previous item and read the increment and current price</p>");

} catch (Exception x){
out.println(x);				
}
} 
else if (ex.getSQLState().equals("10000")){
	out.println("<p>Your bid must be at least whatever the seller's increment number was plus the starting price of the item!</p>");
out.println("<p>You can go back to the previous item and read the increment and starting price</p>");
}

else{
	
	try{
		
		ApplicationDB db = new ApplicationDB();	
		
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String str="select * from infoOfBid where jewelryID="+jewelryID;
		ResultSet result1 = stmt.executeQuery(str);
		int increment = 0;
		String e="";
		if(result1.next()){
			increment = result1.getInt("increment");
		}
		bidParam = increment+bidParam;
		str = "select * from Auto where jewelryID ="+jewelryID;
		ResultSet result2 = stmt.executeQuery(str);
		if(result2.next()){
			e=result2.getString("email");
		}
		str = "UPDATE Bid set cost = "+bidParam+" where jewelryID="+jewelryID+" and email='"+e+"' order by cost limit 1";
		PreparedStatement ps = con.prepareStatement(str);
		ps.executeUpdate();
		con.close();
	} catch (Exception xx){
		out.println(xx);
	}
}

	
}
%>
<p><a href='jewelryPage.jsp?id=<%=jewelryID%>'>Click to go back to jewelry item you were looking at</a></p>
<a href='dash.jsp'>Click to go back to dashboard</a>
</body>
</html>