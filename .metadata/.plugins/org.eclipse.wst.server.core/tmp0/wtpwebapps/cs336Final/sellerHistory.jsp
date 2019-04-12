<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<title>Seller's History</title>
</head>
<body>
<h2>Seller's History!</h2>

<table border='4'>
<tr>
<th>JID</th>
<th>Date Posted</th>
<th>Jewelry Name</th>
</tr>
<%
try {
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	Statement stmt = con.createStatement();
	
	String email_username = request.getParameter("id"); //"jack@gmail.com";
	out.println(email_username);
	
	String str = "SELECT p.JID,p.datePosted, j.name FROM Post as p, jewelry as j WHERE seller_email=" + "'"+email_username+"' and p.JID = j.jewelryID;" ;
	
	ResultSet result = stmt.executeQuery(str);
	
	if(result != null){
		while(result.next()){
			String jID = result.getString("p.JID");
			
			String DatePosted= result.getString("p.datePosted");
			
			String jName = result.getString("j.name");
		
		out.print("<th> "+ jID + "</th>");
		out.print("<th> "+ DatePosted + "</th>");
		out.print("<th>"+ jName + "</th></tr>");
	}
	
	
				
	con.close();
	}

}


catch (Exception ex) {
out.println(ex);
out.println("error");
}
%>
</table>
<p><a href='dash.jsp'>Click this link for the basic dashboard</a></p>
<p><a href='logout.jsp'>Log out</a></p>

</body>
</html>