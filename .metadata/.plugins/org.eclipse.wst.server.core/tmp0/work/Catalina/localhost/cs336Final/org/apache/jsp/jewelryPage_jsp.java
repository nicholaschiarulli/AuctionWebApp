/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.93
 * Generated at: 2019-04-10 04:45:36 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.cs336.pkg.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class jewelryPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


String name = "";
String condition = "";
String color = "";
String type = "";
String brand = "";
String datePosted = "";
String emailOfSeller = "";
String closingDate = "";
String currentBid = "";
int startingPrice = 0;
int increment = 0;
int status = 0;

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/index.css\"/>\n");
      out.write("<title>Jewelry</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write('\n');
 
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
		

      out.write("\n");
      out.write("\n");
      out.write("<table>\n");
      out.write("<tr>\n");
      out.write("<td>Name: </td><td>");
      out.print(name );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>Type: </td><td>");
      out.print(type );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>Brand: </td><td>");
      out.print(brand );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>Condition: </td><td>");
      out.print(condition );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>Color: </td><td>");
      out.print(color );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>Initial Price: </td><td>");
      out.print(startingPrice );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>Increment: </td><td>");
      out.print(increment );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>Current Bid: </td><td>");
      out.print(currentBid );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>Closing Date: </td><td>");
      out.print(closingDate );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>Email of Seller: </td><td>");
      out.print(emailOfSeller );
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("\t\n");

out.println("<p><a href='alert.jsp?id="+jewelryID+"'>Click this link to put an alert on this item</a></p>");
if (status == 0){
out.println("<p><a href='ifOnlySeller.jsp?id="+jewelryID+"'>Click this link to place a bid</a></p>");
out.println("<p><a href='historyBid.jsp?id="+jewelryID+"'>Click this link to see the bid history</a></p>");
out.println("<p><a href='sellerHistory.jsp?id="+emailOfSeller+"'>Click this link to see "+emailOfSeller+"'s history</a></p>");
out.println("<p><a href='similar.jsp?id="+jewelryID+"&type="+type+"'>Click this link to see similar items</a></p>");
out.println("<p><a href='searchItems.jsp'>Back to searching jewelry</a></p>");
out.println("<p><a href='dash.jsp'>Buyer Dashboard</a></p>");
}

      out.write("\n");
      out.write("<p><a href='logout.jsp'>Log out</a></p>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}