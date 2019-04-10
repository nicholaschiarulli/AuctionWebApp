/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.93
 * Generated at: 2019-04-10 05:46:30 UTC
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

public final class dash_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/index.css\"/>\n");
      out.write("<title>Dashboard</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<p>Welcome ");
out.print(session.getAttribute("name")); 
      out.write("</p>\n");
      out.write("<p><a href='searchItems.jsp'>Click this link to search for jewelry</a></p>\n");
      out.write("<p>Your current alerts</p>\n");
      out.write("<table border='4'>\n");
      out.write("<tr>\n");
      out.write("<th>Name of Jewelry</th>\n");
      out.write("<th>Current Bid</th>\n");
      out.write("<th>Closing date</th>\n");
      out.write("</tr>\n");
 
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String str = "SELECT j.jewelryID, j.name, iob.closingDate FROM jewelry as j JOIN infoOfBid as iob on j.jewelryID = iob.jewelryID JOIN alert as a on a.jewelryID = j.jewelryID WHERE a.email = '" + session.getAttribute("username") + "';";
ResultSet result = stmt.executeQuery(str);
while(result.next()){
int id= result.getInt("j.jewelryID");
String name = result.getString("j.name");
String date = result.getString("iob.closingDate");
String currentCost = "This item has no bids";
String str1 = "SELECT cb.cost FROM CurrentBid as cb join jewelry as j on cb.jewelryID = j.jewelryID WHERE j.jewelryID = " + id;
Statement stmt1 = con.createStatement();
ResultSet result1 = stmt1.executeQuery(str1);
if(result1.next()){
currentCost = result1.getString("cb.cost");
}
out.print("<tr><th><a href='jewelryPage.jsp?id=" + id + "'>" +name + "</a></th>");
out.print("<th>" + currentCost +"</th>");
out.print("<th>"+ date + "</th></tr>");
				
}
con.close();

      out.write("\n");
      out.write("</table>\n");
      out.write("<p>Email</p>\n");
      out.write("<table border='4'>\n");
      out.write("<tr>\n");
      out.write("<td>From</td>\n");
      out.write("<td>Subject</td>\n");
      out.write("<td>Content</td>\n");
      out.write("<td>Time</td>\n");
      out.write("</tr>\n");

Connection con1 = db.getConnection();
Statement stmt2 = con1.createStatement();
 	
str = "SELECT fromCol, date_time, theSubject, content FROM Email WHERE toCol='"+session.getAttribute("username")+"'";
ResultSet result1 = stmt2.executeQuery(str);
while(result1.next()){
String fromCol = result1.getString("fromCol");
String date_time = result1.getString("date_time");
String theSubject = result1.getString("theSubject");
String content = result1.getString("content");
out.print("<tr><th>" +fromCol + "</th>");
out.print("<th>" + theSubject +"</th>");
out.print("<th>"+content + "</th>");
out.print("<th>"+date_time+"</th></tr>");	
}

      out.write("\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("<a href='EmailPage.jsp'>Send an email to a customer representative</a>\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<p><a href='buyerHistory.jsp'>Click this link to see your history of bidding</a></p>\n");
      out.write("<p><a href='sellerDash.jsp'>Click this link for the seller dashboard</a></p>\n");
      out.write("<p><a href='question.jsp'>Click this link to ask a question</a></p>\n");
      out.write("<p><a href='askToRemoveBid.jsp'>Click this link to request to remove a bid</a></p>\n");
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
