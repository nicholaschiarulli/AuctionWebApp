<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css" />
<title>Similar Items</title>
<head></head>
<body>

<%if(session.getAttribute("username") == null){
	response.sendRedirect("invalidated.jsp");
} %>

	<h3>Similar Items</h3>
	<h4>Similar Items are Determined by Color and Type</h4>
	<%
	int jewelryID = Integer.parseInt(request.getParameter("id"));
		try {
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			String type = request.getParameter("type");
			String color = request.getParameter("color");
			
			String str = "SELECT *FROM jewelry where jewelry.type = '"
					+ type + "'and jewelry.color = '" + color + "';";
			ResultSet result = stmt.executeQuery(str);

			if (result.next()) {
	%>
	<table border="4">
		<tr>
			<th>JID</th>
			<th>Name</th>
			<th>Type</th>
			<th>Color</th>
			<th>Brand</th>
			<th>Size</th>
			<th>Condition</th>
			<th>Email of Seller</th>
		</tr>
		
		<tr>
			<td>
				<%
					out.println(result.getInt("jewelryID"));
				%>
			</td>
			<td>
				<%if(jewelryID==result.getInt("jewelryID")){
					out.println(result.getString("name")+"(This is the current item you're viewing)");
					
				}else{
					out.println(result.getString("name"));
				}
				%>
			</td>
			<td>
				<%
					out.println(result.getString("type"));
				%>
			</td>
			<td>
				<%
					out.println(result.getString("color"));
				%>
			</td>
			<td>
				<%
					out.println(result.getString("brand"));
				%>
			</td>
				<td>
				<%
					out.println(result.getString("size"));
				%>
			</td>
				<td>
				<%
					out.println(result.getString("conditionn"));
				%>
			</td>
			<td>
				<%
					out.println(result.getString("emailOfSeller"));
				%>
			</td>
		</tr>
		<%
		while (result.next()) {
		%>

		<tr>
			<td>
				<%
					out.println(result.getInt("jewelryID"));
				%>
			</td>
			<td>
				<%if(jewelryID==result.getInt("jewelryID")){
					out.println(result.getString("name")+"(This is the current item you're viewing)");
					
				}else{
					out.println(result.getString("name"));
				}
				%>
			</td>
			<td>
				<%
					out.println(result.getString("type"));
				%>
			</td>
			<td>
				<%
					out.println(result.getString("color"));
				%>
			</td>
			<td>
				<%
					out.println(result.getString("brand"));
				%>
			</td>
				<td>
				<%
					out.println(result.getString("size"));
				%>
			</td>
				<td>
				<%
					out.println(result.getString("conditionn"));
				%>
			</td>
			<td>
				<%
					out.println(result.getString("emailOfSeller"));
				%>
			</td>
		</tr>
		<%
			} 
		%>
	</table>
	<%
		} else {
	%>
	<h1>No Items Similar to this One in the Database Currently</h1>
	<%
		}
			con.close();
		}

		catch (Exception x) {
			//out.println(x);
			out.println("error");
		}
		out.print("<br>");
	out.print("<a href='jewelryPage.jsp?id=" + jewelryID + "'>Go back to Jewelry Item</a>");

	%>
	
		<a href='searchItems.jsp'>Back to search</a>
	
		<a href='logout.jsp'>Log out</a>
	
</body>
</html>