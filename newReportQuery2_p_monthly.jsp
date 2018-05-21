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
String str_sql =  "select  xx.dt ,    " +
         " max(decode(xx.tech,'10BK',xx.cc, 0)) as AA , " +
		" max(decode(xx.tech,'14BK',xx.cc, 0)) as BB , " + 
		" max(decode(xx.tech,'14LPE',xx.cc, 0)) as CC, " + 
		" max(decode(xx.tech,'32EDRAM',xx.cc, 0))  as DD, " + 
		" max(decode(xx.tech,'28NM',xx.cc, 0)) as EE , " + 
		" max(decode(xx.tech,'28BK',xx.cc, 0)) as FF , " + 
		" max(decode(xx.tech,'20NM',xx.cc, 0)) as GG from  " + 
		" (  select tech,  "  + 
		  "  count(tech) as cc,  " + 
		   " to_char(  to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') as dt    " +  
		   " from msr_data_p a  group by tech, to_char( to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') )xx " + 
		    " group by  xx.dt  order by xx.dt  " ;  


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
String transposeHead = "<tr><th>Tech</th>";
String t1 = "<tr><td>10BK</td>";
String t2 = "<tr><td>14BK</td>";
String t3 = "<tr><td>14LPE</td>";
String t4 = "<tr><td>32EDRAM</td>";
String t5 = "<tr><td>28NM</td>";
String t6 = "<tr><td>28BK</td>";
String t7 = "<tr><td>20NM</td>";



out.println("<table id='pt' style='display:table' BORDER=\"2\" style='width:100%'>");
out.println("<thead>");
/*out.println("<tr>");
out.println("<th>Month-Year</th>");
out.println("<th>10BK</th>");	
out.println("<th>14BK</th>");
out.println("<th>14LPE</th>");
out.println("<th>32EDRAM</th>");
out.println("<th>28NM</th>");
out.println("<th>28BK</th>");
out.println("<th>20NM</th>");
out.println("</tr></thead><tbody>"); */

try{
Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);
}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();
}


try{
s = con.createStatement();
rs = s.executeQuery(str_sql);

int i=0;
while( rs.next() ){
	i++;

	dDate = rs.getString("dt").trim();
	//System.out.println("Priority" + Priority);
	
	if ( dDate == null) {
		
		dDate = "";
	}
	
	//Ticket_number = String.valueOf(rs.getInt("ticket_no")).toString();
	//Count = String.valueOf(rs.getInt("AA")).toString();
	//System.out.println("g2" + Test_Type);
	transposeHead += "<th>" + dDate + "</th>";


t1 += "<td>" +rs.getInt(2) + "</td>";
t2 += "<td>" +rs.getInt(3) + "</td>";
t3 += "<td>" +rs.getInt(4) + "</td>";
t4 += "<td>" +rs.getInt(5) + "</td>";
t5 += "<td>" +rs.getInt(6) + "</td>";
t6 += "<td>" +rs.getInt(7) + "</td>";
t7 += "<td>" +rs.getInt(8) + "</td>";


}

}  catch(Exception e)
{
		e.printStackTrace();
		System.out.println("sql " +  str_sql );
}
	finally{
				if(rs!=null) rs.close();
				if(s!=null) s.close();
			    if(con!=null) con.close();
	} 
	
t1 += "</tr>";
t2 += "</tr>";
t3 += "</tr>";
t4 += "</tr>";
t5 += "</tr>";
t6 += "</tr>";
t7 += "</tr>";
transposeHead += "</tr></thead><tbody>" + t1  + t2 + t3 + t4 + t5 + t6 + t7 + "</tbody></table>" ;
out.println(transposeHead);
//out.println("</tbody></table>");
%>

</body>
</html>



