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
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
	<!--  <script type="text/javascript" src="js/jquery-1.9.1.js"></script>-->

	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/view.js"></script>
<style>


</style>
</head>









<body>

<%
String sql = request.getParameter("sql");

System.out.println("sql " + sql);

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

String Priority = "";
String Ticket_number = "";
String Test_Type = "";
String Test_Family = "";
String Technology="";
String Product="";
String Temp="";
String Submitted_by="";
String FName="";
String dt1 = "";
String dt2 = "";
String ff = "";
String desc="";


out.println("<table id='pt' style='display:table' BORDER=\"1\" style='width:100%'>");
out.println("<thead>");
out.println("<tr>");
out.println("<th>Priority</th>");
out.println("<th>Ticket_number</th>");	
out.println("<th>Test_Type</th>");
out.println("<th>Test_Family</th>");
out.println("<th>Technology</th>");
out.println("<th>Product</th>");
out.println("<th>Temp</th>");
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


try{
s = con.createStatement();
rs = s.executeQuery(sql);

int i=0;
while( rs.next() ){
	i++;

	Priority = rs.getString("priority").trim();
	//System.out.println("Priority" + Priority);
	
	if ( Priority == null) {
		
		Priority = "";
	}
	
	//Ticket_number = String.valueOf(rs.getInt("ticket_no")).toString();
	Test_Type = rs.getString("g2").trim();
	//System.out.println("g2" + Test_Type);
	
	if ( Test_Type == null) {
		
		Test_Type = "";
	}
	
	
	Test_Family = rs.getString("g3").trim();
	//System.out.println("g3" + Test_Family);
	
	if ( Test_Family == null) {
		
		Test_Family = "";
	}
	
	
	
	Technology=rs.getString("tech").trim(); 
	//System.out.println("tech" + Technology);
	
	if ( Technology == null) {
		
		Technology = "";
	}
	
	
	
	
	
	Product=rs.getString("prod").trim();
	//System.out.println("prod" + Product);
	
	if ( Product == null){
		
		Product = "";
	}
	
	

	
	
	
	Temp=rs.getString("temp").trim();
	//System.out.println("Temp" + Temp);
	
	if ( Temp == null){
		
		Temp = "";
	}
	
	

	Submitted_by=rs.getString("login_id").trim();
	//System.out.println("Submitted_by" + Submitted_by);
	
	if ( Submitted_by == null){
		
		Submitted_by = "";
	}
	
	FName=rs.getString("fname");
	//System.out.println("FName" + FName);
	
	if ( FName == null ){
		
		FName = "";
	}
	
	dt1 = rs.getString("rdate").trim();
	//System.out.println("dt1" + dt1);
	
	if ( dt1 == null){
		
		dt1 = "";
	}
	
	
	dt2 = rs.getString("add_time").trim();
	
	if ( dt2 == null){
		
		dt2 = "";
	}
	//System.out.println("dt2" + dt2);
	
desc = rs.getString("full_list");

if ( desc == null) {
	
	desc  = "None";
} else {
	
	desc = desc.replaceAll("#", "\r\n");
}
	
	
out.println("<tr>");
out.println("<td>" +Priority + "</td>");

String idd ="select * from msr_data_p where ticket_no=" + rs.getString("ticket_no"); 
//System.out.println("yyyyyyyyyyyyy " + idd);
%>
<td><a href="<%=request.getContextPath()%>/QueryStringD_P?id=<%=idd%>" target="_Blank"><%=rs.getString("ticket_no")%></a></div></td>
<% 
//out.println("<td>" + "<a href=" + request.getContextPath() + "/QueryStringD_P?id=" + idd  + "target='_Blank'>" + rs.getString("ticket_no") + "</a></td>");

out.println("<td style='text-transform:uppercase'>" + Test_Type + "</td>");
out.println("<td style='text-transform:uppercase'>" + Test_Family + "</td>");
out.println("<td style='text-transform:uppercase'>" + Technology + "</td>");
out.println("<td style='text-transform:uppercase'>" + Product+ "</td>");

out.println("<td style='text-transform:uppercase'>" +Temp + "</td>");
out.println("<td style='text-transform:uppercase'>" + Submitted_by + "</td>");

  if ( FName.trim().equalsIgnoreCase("No attachment")) {
	   
	    ff  = "No attachment" ;
	  
	  // out.println("<td style='text-transform:uppercase'>" + ff + "</td>");
	    %>
	    <td><div class="one"><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>">Click to open file</a></td></div>
	     <% 
	
   } else {
	 
       ff =  FName;
     
       %>
       <td><div class="one"><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>">Click to open file</a></td></div>
       <% 
   }
 


out.println("<td>" + dt1 + "</td>");
out.println("<td>" + dt2 + "</td>");
out.println("<td style='white-space: pre'>" +  desc + "</td>");

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



