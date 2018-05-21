<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1; Content-Disposition; attachment; filename="blah.xls"  >
<meta http-equiv="Content-type" content="application/x-www-form-urlencoded; charset=UTF-8"/>


<%@ page import="java.io.*,java.util.*,java.sql.*, javax.xml.transform.*,javax.xml.transform.dom.*,javax.xml.transform.stream.*"%>
<%@ page import="javax.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
	<title>Test System Request Parametric Page Report</title>
	<link rel="stylesheet"  href="css/reset.css" />
	<link rel="stylesheet"  href="css/smoothness/jquery-ui-1.10.3.custom.css" />	
	<link rel="stylesheet"  href="css/table.css" />
	<style type="text/css" title="currentStyle">
		@import "css/demo_page.css";
		@import "css/demo_table_jui.css";
		@import "css/jquery-ui-1.8.4.custom.css";
	 
	
	</style>
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>

	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/view.js"></script>
<style>


</style>
</head>

<body>

<%
String sql = request.getParameter("sql");
System.out.println("ssss  " + sql);
%> 


<%java.sql.Connection con;
java.sql.Statement s;
java.sql.ResultSet rs;
java.sql.PreparedStatement pst;
con=null;
s=null;
rs=null;

String url=  "jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1";
String id= "f8tdtest";
String pass = "f8tdtest";
String ssq ="";





out.println("<table id='pt' style='display:table' BORDER=\"1\" style='width:100%'>");
out.println("<thead>");
out.println("<tr>");
out.println("<th>Priority</th>");
out.println("<th>Ticket_number</th>");	
out.println("<th>Test_Type</th>");
out.println("<th>Test_Family</th>");
out.println("<th>Technology</th>");
out.println("<th>Product</th>");
out.println("<th>Submitted_by</th>");
out.println("<th>FName</th>");
out.println("<th>RequiredDate</th>");
out.println("<th>SubmittedDate</th>");
out.println("<th>All_status</th>");
out.println("</tr></thead><tbody>");

try{
Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);
}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();
}



//System.out.println("blllll->" + sql);
try{
s = con.createStatement();
rs = s.executeQuery(sql);
%>

<%
int i=0;
while( rs.next() ){
	i++;
%>

<tr>
<td><%= rs.getString("priority") %></td>
<% String idd ="select * from msr_data_f where ticket_no=" + rs.getString("ticket_no"); %>
<td><div class="one"><a href="<%=request.getContextPath()%>/QueryStringD_F?id=<%=idd%>" target="_Blank"><%=  rs.getString("ticket_no")%></a></div></td>

<td style="text-transform:uppercase"><%= rs.getString("g2") %></td>
<td style="text-transform:uppercase"><%= rs.getString("g3") %></td>
<td style="text-transform:uppercase"><%=rs.getString("tech") %></td>
<td style="text-transform:uppercase"><%=rs.getString("prod").trim() %></td>
<td><%= rs.getString("login_id") %></td>
<% 
  if ( rs.getString("fname").equalsIgnoreCase("No attachment")) {
	   
	   String ff  = "No attachment" ;
	   %>
	
	  <td><%=ff%></td>
   <% } else {
	 
      String ff =  rs.getString("fname");
     
      %>
    <td><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>">Click to open file</a></td></div>
     <% 
   }
%>




<td><%= rs.getString("rdate") %></td>
<td><%= rs.getString("add_time") %></td>
<% String desc = rs.getString("full_list"); %>
<td><%= desc.replaceAll("#", "\n")%></td>

</tr>

 <%
 
}
%>

<%

}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
}

out.println("</tbody></table>");
%>
</body>
</html>





