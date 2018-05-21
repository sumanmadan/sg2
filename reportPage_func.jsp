<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1; Content-Disposition; attachment; filename="blah.xls"  >
<meta http-equiv="Content-type" content="application/x-www-form-urlencoded; charset=UTF-8"/>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<LINK rel="StyleSheet" type="text/css" href="style.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="jquery.tablesorter.min.js"></script>
<script src="jquery.fittext.js"></script>


<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<html>
<head>
<style>


 td.fixed-width {
    
   /* background-color:#b0e0e6;*/
    max-width: 100%;
   /* max-width:100%;
    min-width:100%;*/
    white-space: nowrap;
    white-space: pre;
    text-align: right;
	padding: 10px;
    
  }
         
          
            



.one ul
{
list-style-type:none;
margin:0;
padding:0;

}
.one li
{
float:left;
}

.one a:link,a:visited
{
display:block;
width:120px;
font-weight:bold;
color:#FFFFFF;
background-color:#98bf21;
text-align:center;
padding:4px;
text-decoration:none;
text-transform:uppercase;
}
.one a:hover,a:active
{
background-color:#7A991A;
}
.one a
{
display:block;
width:60px;
 

.oneColLiqCtr #main {
padding: 0 20px; /* remember that padding is the space inside the div box and margin is the space outside the div box */
}
</style>










<script>

 

$( document ).ready( function() {
	
	
	//$("#tt").tablesorter();
	
	
	var password = "admin";
	msg = ""
    var x = prompt("Enter in the password");
	
	if (!(x)){
		window.location='mainPage.jsp';
	} else if (x.toLowerCase() == password) {
      // alert("Come right in \n \n You've entered in the right password");
       $("#main").removeAttr('disabled');
       $('#main').show()
       $("#tt").tablesorter();
   }
else {
	 alert(" You've entered in the wrong password");
	 window.location='mainPage.jsp';
}
	
  
});


jQuery("#responsive_headline").fitText();
jQuery("#responsive_headline").fitText(1.2, { minFontSize: '20px', maxFontSize: '40px' })

</script>
</head>
<body class=oneColLiqCtr>

<title>Summary Page</title>
<div id = main style="display:none">
<img  src='Coll_Logo.png' class='center' alt='My image' />
<h1>Functional Test Summary Page</h1>
<right><h3><i>( TD Test Request System )</h3></i></right>
<div id = r class = "one">
<ul>
<li><a href="mainPage.jsp" target=_blank> Main Menu </a></li>
</ul>
</div>
<br>
<br>
<hr>




<form id="f1" name = "f1"  >


<%java.sql.Connection con;
java.sql.Statement s;
java.sql.ResultSet rs;
java.sql.PreparedStatement pst;
con=null;
s=null;
rs=null;

String url=  "jdbc:oracle:thin:@fc8orad02.gfoundries.com:1521:F8TDD1";
String id= "f8tdtest";
String pass = "f8tdtest";
String ssq ="";

%>



<div id="tableWrap" style="position:relative; width:100%;height:100%; overflow-x:scroll;  overflow-y:scroll;" >
<table id="tt" class="tablesorter">
<thead> 
<TR>
<!--  <th class="fixed-width">Ticket #</th> -->
<th>     Ticket #</th>
<th>     Test Type</th>
<th>     Test Family</th>
<!--  <th>     Comment</th>
<th>     LotPurpose</th>
<th>     Lot</th>
<th>     Wafers</th>
<th>     Sampling</th> -->
<th>     Technology</th>
<th>     Product</th>
<th>     SubProduct</th>
<th>     Submitted By</th>
<th>     Fname</th>
<th>     Required date</th>
<th>     Submitted date</th>
<!--  <th>Current Status</th>
<th>Assignee</th>
<th>updatedTime</th>-->
<th>    Status List</th>

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
//String sql="select d.ticket_no,d.g1,d.g2,d.g3,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,a.status,a.assignee,a.updated_time  " + 
//" from msr_data_p d left join (select * from msr_assign order by UPDATED_TIME DESC ) a on a.ticket_no=d.ticket_no" ;
//String sql = "select ticket_no,g1,g2,g3,comment,lotpurpose,lot,wafers,sampling,temp,login_id,fname,rdate,add_time,status,assignee from msr_data";

//String sql = "select d.ticket_no,d.g1,d.g2,d.g3,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,aa.status,aa.assignee,aa.updated_time from msr_data_f d left join (select * from msr_assign order by UPDATED_TIME DESC ) aa on aa.ticket_no=d.ticket_no";

String sql ="select d.ticket_no,d.g1,d.g2,d.g3,d.comments,d.tech,d.prod,d.lotpurpose,d.lot,wafers,d.sampling,d.spdt,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list";
sql = sql + " from msr_data_f d ";
sql = sql + "left join (SELECT ticket_no, " ;
//sql = sql + " rtrim(dbms_xmlgen.convert(xmlagg(xmlelement(e, updated_time  || ':'  || Status  ||':'  || Assignee  || '_'  )).extract('//text()').getClobVal(), 1), '_')plist" ;

sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee ||':' || nvl(comments,'') || '#' ))))alll " ;
sql = sql + " FROM msr_assign_f group by ticket_no) ";
sql = sql + "aa on aa.ticket_no=d.ticket_no";

System.out.println("blllll->" + sql);
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

<TR bgcolor="pink">
 <% } else { //if there isn't a remainder we will do the else %>
<TR bgcolor="pink">
<%}%>
<!-- <td class="fixed-width"><%= rs.getString("ticket_no").trim()%></td>  -->
<% String idd ="select * from msr_data_f where ticket_no=" + rs.getString("ticket_no"); %>
<td><div class="one"><a href="<%=request.getContextPath()%>/QueryStringD_F?id=<%=idd%>" target="_Blank"><%=  rs.getString("ticket_no")%></a></td></div>
<!--  <td class="fixed-width"><%= rs.getString("g1") %></td> -->
<td style="text-transform:uppercase"><%=rs.getString("g2") %></td>
<td style="text-transform:uppercase"><%=rs.getString("g3") %></td>
<td style="text-transform:uppercase"><%=rs.getString("tech") %></td>
<td style="text-transform:uppercase"><%=rs.getString("prod") %></td>
<!--  
<td><%= rs.getString("comments") %></td>
<td><%= rs.getString("lotpurpose") %></td>
<td><%= rs.getString("lot") %></td>
<td class="fixed-width"><%= rs.getString("wafers") %></td> 
<td><%= rs.getString("sampling") %></td>
-->
<td><%= rs.getString("spdt") %></td>
<td><%= rs.getString("login_id") %></td>
<!--  <td><a href=<%= rs.getString("fname") %>><%= rs.getString("fname") %></a></td>-->
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
<td class="fixed-width"><%= rs.getString("add_time") %></td>
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
</form>

</div>
</body>
</html>