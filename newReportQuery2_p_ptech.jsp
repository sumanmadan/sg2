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

/*String sql = " select " +
" xx.mmyy, " +
"  max(decode(xx.tech,'10BK',xx.cc)) as" + " \"10BK\", " + 
//--max(decode(xx.tech,'None',xx.cc)) as "NN",
" max(decode(xx.tech,'14BK',xx.cc)) as" + " \"14BK\", " + 
"  max(decode(xx.tech,'14LPE',xx.cc)) as" + " \"14LPE\", " + 
" max(decode(xx.tech,'32EDRAM',xx.cc))  as" + " \"32EDRAM\", " + 
" max(decode(xx.tech,'28NM',xx.cc)) as" + " \"28NM\", " + 
" max(decode(xx.tech,'28BK',xx.cc)) as" + " \"28BK\", " + 
" max(decode(xx.tech,'20NM',xx.cc)) as" + " \"20NM\" " + 
" from " +
"( " +
" select tech," +
"  count(tech) as cc, " +
" to_char(  to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') as mmyy  " +
" from msr_data_p a " +
" group by tech, to_char( to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM')  )xx " + 
"  group by xx.tech, xx.cc, xx.mmyy " +
" order by xx.mmyy  " ;*/
System.out.println("For testing " + sql) ;


%> 


<%


java.sql.Connection con;
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

String dDate = "";
String Count = "";



out.println("<table id='pt' style='display:table' BORDER=\"1\" style='width:100%'>");
out.println("<thead>");
out.println("<tr>");
out.println("<th>Month-Year</th>");
out.println("<th>10BK</th>");	
out.println("<th>14BK</th>");
out.println("<th>14LPE</th>");
out.println("<th>32EDRAM</th>");
out.println("<th>28NM</th>");
out.println("<th>28BK</th>");
out.println("<th>20NM</th>");
out.println("</tr></thead><tbody>");

try{
Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);
}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();
}


try{
s = con.createStatement();
rs = s.executeQuery(sql);

int i=0;
while( rs.next() ){
	i++;

	dDate = rs.getString("mmyy").trim();
	//System.out.println("Priority" + Priority);
	
	if ( dDate == null) {
		
		dDate = "";
	}
	
	//Ticket_number = String.valueOf(rs.getInt("ticket_no")).toString();
	Count = String.valueOf(rs.getInt("10BK")).toString();
	//System.out.println("g2" + Test_Type);
	

out.println("<tr>");
out.println("<td>" +dDate + "</td>");
out.println("<td>" +Count + "</td>");
Count = String.valueOf(rs.getInt("14BK")).toString();
out.println("<td>" +Count + "</td>");
Count = String.valueOf(rs.getInt("14LPE")).toString();
out.println("<td>" +Count + "</td>");
Count = String.valueOf(rs.getInt("32EDRAM")).toString();
out.println("<td>" +Count + "</td>");
Count = String.valueOf(rs.getInt("28NM")).toString();
out.println("<td>" +Count + "</td>");
Count = String.valueOf(rs.getInt("28BK")).toString();
out.println("<td>" +Count + "</td>");
Count = String.valueOf(rs.getInt("20NM")).toString();
out.println("<td>" +Count + "</td>");
out.println("</tr>");
}

}  catch(Exception e)
{
		e.printStackTrace();
		System.out.println("sql " +  sql );
}
	finally{
				if(rs!=null) rs.close();
				if(s!=null) s.close();
			    if(con!=null) con.close();
	} 
	
	
out.println("</tbody></table>");
%>

</body>
</html>



