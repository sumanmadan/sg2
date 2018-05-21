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

String ticket_no = "";
String days = "";
String hours = "";
String minutes = "";
String seconds = "";



out.println("<table id='pt' style='display:table' BORDER=\"1\" style='width:100%'>");
out.println("<thead>");
out.println("<tr>");
out.println("<th>TicketNo</th>");
out.println("<th>Start</th>");	
out.println("<th>End</th>");
out.println("<th>Days</th>");
out.println("<th>Hours</th>");
out.println("<th>Minutes</th>");
out.println("<th>Seconds</th>");

out.println("</tr></thead><tbody>");

try{
Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);
}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();
}


try{
s = con.createStatement();
s.executeQuery("alter session set nls_date_format= 'YYYY-MM-DD HH24:MI:SS'");
System.out.println("This is done");
s=con.createStatement();
rs = s.executeQuery(sql);

int i=0;
while( rs.next() ){
	i++;

/*ticket_no = String.valueOf(rs.getInt("ticket_no")).toString();
days = String.valueOf(rs.getInt(4)).toString();
hours = String.valueOf(rs.getInt(5)).toString();
minutes = String.valueOf(rs.getInt(6)).toString();
seconds = String.valueOf(rs.getInt(7)).toString();*/

String idd ="select * from msr_data_p where ticket_no=" + rs.getString("ticket_no"); 
out.println("<tr>");
%>
<td><a href="<%=request.getContextPath()%>/QueryStringD_P?id=<%=idd%>" target="_Blank"><%=rs.getString("ticket_no")%></a></td>
<% 
//out.println("<td>" +ticket_no + "</td>");
out.println("<td>" +rs.getString("start_date") + "</td>");
out.println("<td>" +rs.getString("end_date") + "</td>");
out.println("<td>" +rs.getInt(4) + "</td>");
out.println("<td>" +rs.getInt(5) + "</td>");
out.println("<td>" +rs.getInt(6) + "</td>");
out.println("<td>" +rs.getInt(7) + "</td>");
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


//2nd TABLE 

sql = " select dt, "  + 
		" max(TRUNC(to_date(end_date)-to_date(start_date))) as maxdays , "  + 
		" min(TRUNC(to_date(end_date)-to_date(start_date))) as mindays,  " + 
		" avg(TRUNC(to_date(end_date)-to_date(start_date))) as average " + 
		" from ( " + 
 		" Select   " + 
  		" to_char( to_date(updated_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') as dt, "  + 
        " max(to_char(  to_date(updated_time,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'))end_date  , " + 
  		" min(to_char(  to_date(updated_time,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS')) start_date " + 
  		" from msr_assign_p group by ticket_no, to_char( to_date(updated_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM')  " + 
  		" order by to_char( to_date(updated_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM')  ) group by dt " ;


out.println("<table id='pt1' style='display:table' BORDER=\"1\" style='width:100%'>");
out.println("<thead>");
out.println("<tr>");
out.println("<th>Month</th>");
out.println("<th>Max</th>");	
out.println("<th>Min</th>");
out.println("<th>Average</th>");
out.println("</tr></thead><tbody>");

try{
Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);
}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();
}


try{
s = con.createStatement();
s.executeQuery("alter session set nls_date_format= 'YYYY-MM-DD HH24:MI:SS'");
System.out.println("This is done");
s=con.createStatement();
rs = s.executeQuery(sql);

int i=0;
while( rs.next() ){
out.println("<tr>");
out.println("<td>" +rs.getString("dt") + "</td>");
out.println("<td>" +rs.getInt(2) + "</td>");
out.println("<td>" +rs.getInt(3) + "</td>");
out.println("<td>" +rs.getInt(4) + "</td>");
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

















%>

</body>
</html>



