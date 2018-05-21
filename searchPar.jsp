<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script src="http://ajax.aspenetcdn.com/ajax/jquery.validation/1.9/jquery.validate.min.js"></script> 
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<head>
<style>




td.fixed-width {
    
   /* background-color:#b0e0e6;*/
    max-width: 100%;
   /* max-width:100%;
    min-width:100%;*/
    white-space: nowrap;
    white-space: pre;
    text-align: center;
	padding: 10px;
    
  }  
</style>

<script>
</script>
</head>


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


String emailSearch = request.getParameter("pdt");
// emailSearch = "mark.dexter@globalfoundries.com";
//System.out.println("searching for ..." + emailSearch);
%>

<body>
<div id="dropdownp" >
<p> Your Search Result : </p>
<table id="tt">
<thead> 

<TR>
<th class="fixed-width"> Ticket number</th>
<th> Test Type</th>
<th> Test Family</th>
<th>     Technology</th>
<th>     Product</th>
<th> Sampling</th>
<th> Temp</th>
<th> Submitted By</th>
<th> Fname</th>
<th> Required date</th>
<th> Submitted date</th>
<th> All Status</th>

</tr>


</thead> 
<tbody> 
<% 

try{
Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);
}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();
}

String sql ="select d.ticket_no,d.g1,d.g2,d.g3,d.comments,d.tech,d.prod,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list";
sql = sql + " from msr_data_p d ";
sql = sql + "left join (SELECT ticket_no, " ;
sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee ||':' || nvl(comments,'') || '#' ))))alll " ;
sql = sql + " FROM msr_assign_p group by ticket_no) ";
sql = sql + "aa on aa.ticket_no=d.ticket_no where d.eemail = '" + emailSearch +"'";



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

<% if ((i %2) == 0 ) { //this means if there is a remainder  %>

<TR bgcolor="LightYellow">
 <% } else { //if there isn't a remainder we will do the else %>
<TR bgcolor="LightBlue">
<%}%>
<!--  <td class="fixed-width"><%= rs.getString("ticket_no") %></td> -->
<% String idd ="select * from msr_data_p where ticket_no=" + rs.getString("ticket_no"); %>
<td class="fixed-width"><div class="one"><a href="<%=request.getContextPath()%>/QueryStringD_P?id=<%=idd%>" target="_Blank"><%=  rs.getString("ticket_no")%></a></div></td>
<!--  <td class="fixed-width"><%= rs.getString("g1") %></td>-->
<td class="fixed-width" style="text-transform:uppercase"><%= rs.getString("g2") %></td>
<td class="fixed-width" style="text-transform:uppercase"><%= rs.getString("g3") %></td>
<td style="text-transform:uppercase"><%=rs.getString("tech") %></td>
<td style="text-transform:uppercase"><%=rs.getString("prod").trim() %></td>

<!--   <td class="fixed-width"><%= rs.getString("comments") %></td>
<td class="fixed-width"><%= rs.getString("lotpurpose") %></td>
<td class="fixed-width"><%= rs.getString("lot") %></td>
<td class="fixed-width"><%= rs.getString("wafers") %></td> -->
<td><%= rs.getString("sampling") %></td>
<td><%= rs.getString("temp") %></td>
<td><%= rs.getString("login_id") %></td>
<!--  <td><a href=<%= rs.getString("fname") %>><%= rs.getString("fname") %></a></td> -->
<% 
  if ( rs.getString("fname").equalsIgnoreCase("No attachment")) {
	   
	   String ff  = "No attachment" ;
	   %>
	  <!--  <td><a href="<%=request.getContextPath()%>/QueryString?id=ff%"><%=ff%></a></td>-->
	  <td class="fixed-width"><%=ff%></td>
   <% } else {
	 
      String ff =  rs.getString("fname");
     
      %>
    <td class="fixed-width"><div class="one"><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>">Click to open file</a></td></div>
     <% 
   }
%>




<td class="fixed-width"><%= rs.getString("rdate") %></td>
<td><%= rs.getString("add_time") %></td>
<% String desc = rs.getString("full_list"); %>
<td class="fixed-width"><%= desc.replaceAll("#", "\n")%></td>

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

%>

</tbody> 
</table>
</div>



</body>
</html>