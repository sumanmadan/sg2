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
 table a:link {
    color: #666;
    font-weight: bold;
    text-decoration:none;
}
table a:visited {
    color: #999999;
    font-weight:bold;
    text-decoration:none;
}
table a:active,
table a:hover {
    color: #bd5a35;
    text-decoration:underline;
}
table {
    font-family:Arial, Helvetica, sans-serif;
    color:#666;
    font-size:12px;
    background:#eaebec;
    border:#ccc 1px solid;
    border-radius:3px;
    border-collapse:collapse; border-spacing: 0; 
    box-shadow: 0 1px 2px #d1d1d1;
   /* table-layout: fixed;*/
    width: 100%;
}
table th {
    padding:10px 10px 10px 10px;
    border-top:0;
    border-bottom:1px solid #e0e0e0;
    border-left: 1px solid #e0e0e0;

    background: #ededed;
}
/*thead {background-color:#000268;color:#FFFFFF;text-align:center; position:fixed; top:0px;}*/
thead th { height:50px; width:120px;}

table td {
    padding:10px;
    border-bottom:1px solid #e0e0e0;
    border-left: 1px solid #e0e0e0;
    background: #fafafa;
    width:100px;
    word-wrap: break-word;       /* Internet Explorer */
    white-space: normal;         /* Firefox */
    white-space: -moz-pre-wrap;  /* Other Mozilla, since 1999 */
    white-space: pre-wrap;       /* css-3 */
    white-space: -pre-wrap;      /* Opera 4-6 */
    white-space: -o-pre-wrap;    /* Opera 7 */

}

/* tbody {background-color:grey;color:black;text-align:center;overflow-y:scroll; margin:0px;} */

table tr {
    text-align: center;
}

table tr:hover td {
    background: #f2f2f2;

}

thead th, tbody td {
  width: 155px;
  max-width:155px;
  min-width:155px;
  
}
#wrapper {
     max-width: 100%;
     overflow-x:scroll;  
     overflow-y:scroll; 
     margin-left:5em;
     overflow-y:visible;
     padding-bottom:1px;
}


input[type="text"] {
background-color:transparent;
border: 0px solid;
height:20px;
width:160px;
color:black;

}

td {
 white-space: nowrap;
 white-space: pre;
}


ul
{
list-style-type:none;
margin:0;
padding:0;

}
li
{
float:left;
}
a:link,a:visited
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
a:hover,a:active
{
background-color:#7A991A;
}
a
{
display:block;
width:60px;
}

 td.fixed-width {
                width: 100%;
                background-color:aqua
            }


input[type="text"] {
background-color:transparent;
border: 0px solid;
height:20px;
width:160px;
color:black;

}

</style>




<title>Summary Page</title>
<center><h1>Parametric Test List(Under construction, pending feedback)</h1></center>
<right> <h2>Test Request System</h2></right>
<div id = r>
<ul>
<li><a href="mainPage.jsp" target=_blank> Main Menu </a></li>
</ul>
</div>
<br>
<br>
<hr>




<script>


$( document ).ready( function() {

	$("#tt").tablesorter();
 
});




</script>
</head>
<body>
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



<div id="tableWrap" style="position:relative; width:100%; overflow:scroll; height:100%">
<table id="tt" class="tablesorter">
<thead> 
<TR>
<th>TicketNo</th>
<th>G1</th>
<th>G2</th>
<th>G3</th>
<th>Comment</th>
<th>LotPurpose</th>
<th>Lot</th>
<th>Wafers</th>
<th>Sampling</th>
<th>Temp</th>
<th>Submitted By</th>
<th>Fname</th>
<th>Rdate</th>
<th>Submitted long date</th>
<!--  <th>Current Status</th>
<th>Assignee</th>
<th>updatedTime</th>-->
<th>All Status</th>

</tr>
</thead> 
<tbody> 
<% 

try{
Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);

//String sql="select d.ticket_no,d.g1,d.g2,d.g3,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,a.status,a.assignee,a.updated_time  " + 
//" from msr_data_p d left join (select * from msr_assign order by UPDATED_TIME DESC ) a on a.ticket_no=d.ticket_no" ;
//String sql = "select ticket_no,g1,g2,g3,comment,lotpurpose,lot,wafers,sampling,temp,login_id,fname,rdate,add_time,status,assignee from msr_data";

//String sql = "select d.ticket_no,d.g1,d.g2,d.g3,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,aa.status,aa.assignee,aa.updated_time from msr_data_p d left join (select * from msr_assign order by UPDATED_TIME DESC ) aa on aa.ticket_no=d.ticket_no";
//String sql="select d.ticket_no,d.g1,d.g2,d.g3,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time" + ", eplace(aa.alll,'**',chr(10))'eall' from msr_data_p d left join (SELECT ticket_no,  rtrim(dbms_xmlgen.convert(xmlagg(xmlelement(e, Assignee  || ', '  || Status  ||', '  || updated_time  || '**'  )).extract('//text()').getClobVal(), 1), '*')alll FROM msr_assign group by ticket_no) aa on aa.ticket_no=d.ticket_no";

//String sql ="select d.ticket_no,d.g1,d.g2,d.g3,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,  replace(aa.plist,'_',chr(13))full_list  ";
String sql ="select d.ticket_no,d.g1,d.g2,d.g3,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,(aa.alll)full_list ";
sql = sql + " from msr_data_p d ";
sql = sql + "left join (SELECT ticket_no, "  ;
//sql = sql + " rtrim(dbms_xmlgen.convert(xmlagg(xmlelement(e, updated_time  || ':'  || Status  ||':'  || Assignee  || '_'  )).extract('//text()').getClobVal(), 1), '_')plist" ;

sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
sql = sql + " FROM msr_assign group by ticket_no,comments) ";
sql = sql + "aa on aa.ticket_no=d.ticket_no ";




System.out.println("blllll->" + sql);

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
<td><%= rs.getString("ticket_no") %></td>
<td><%= rs.getString("g1") %></td>
<td><%= rs.getString("g2") %></td>
<td><%= rs.getString("g3") %></td>
<td><%= rs.getString("comments") %></td>
<td><%= rs.getString("lotpurpose") %></td>
<td><%= rs.getString("lot") %></td>
<td><%= rs.getString("wafers") %></td>
<td><%= rs.getString("sampling") %></td>
<td><%= rs.getString("temp") %></td>
<td><%= rs.getString("login_id") %></td>
<% //String root = "/users/service/fc8tdtsr/msr_files/";

   if ( rs.getString("fname").equalsIgnoreCase("No attachment")) {
	   
	   String ff  = "No attachment" ;
	   %>
	  <!--  <td><a href="<%=request.getContextPath()%>/QueryString?id=ff%"><%=ff%></a></td>-->
	  <td><%=ff%></td>
   <% } else {
	 
      String ff =  rs.getString("fname");
     
      %>
     <td><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>">Click to open file</a></td>
     <% 
   }
%>

<td><%= rs.getString("rdate") %></td>
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



</form>

</body>
</html>