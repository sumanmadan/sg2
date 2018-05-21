<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1; Content-Disposition; attachment; filename="blah.xls"  >
<meta http-equiv="Content-type" content="application/x-www-form-urlencoded; charset=UTF-8"/>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.js"></script>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>




<head>

<style type="text/css">


/*table th:first-child {
    text-align: left;
}
table tr:first-child th:first-child {
    border-top-left-radius:3px;
    border-left: 0;
}
table tr:first-child th:last-child {
    border-top-right-radius:3px;
}

table td:first-child {
    text-align: left;
    border-left: 0;
    position:fixed;
}

table tr:last-child td {
    border-bottom:0;
}
table tr:last-child td:first-child {
    border-bottom-left-radius:3px;
}
table tr:last-child td:last-child {
    border-bottom-right-radius:3px;
}
*/

.fixme {
    position: relative;
    left: expression( ( 20 + ( ignoreMe2 = document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft ) ) + 'px' );
    background-color: #FFFFFF;
}
 able a:link {
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
 
 
.headcol {
        position:relative;
        width:100%;
        left:0;
        top:auto;
        border-right: 0px none black;
        border-top-width:3px; /*only relevant for first row*/
        margin-top:-3px; /*compensate for top border*/
        background-color:lightblue
 }
 .headcol:before {}
 .long { background:yellow; letter-spacing:1em; }
    
   table tr:first-child th{
    background-color:#000268;
    color:#FFFFFF;text-align:center;
   
    }
    
    
</style>
<script>
<%java.sql.Connection con;
java.sql.Statement s;
java.sql.ResultSet rs;
java.sql.PreparedStatement pst;
con=null;
s=null;
rs=null;

String url="jdbc:mysql://localhost:3306/test";
String id= "root";
String pass = "";
String ssq ="";

%>


$( document ).ready( function() {
	
	
	
	

});
</script>
</head>

<body>

<h1>Test Request System Summary (Under construction)</h1>

<form method="post" action="updateServlet" >
<input type=submit id="done" name="done" value="Update"  style="float:center;" >

<div id="wrapper">
<table id = tt>


<tr>
<!--  <td style="width:200px; background-color:lightblue;position:RELATIVE;">TicketNo </td> -->
<th class="headcol">TicketNo </th>
<th class="headcol">G1</th>
<th class="headcol">G2</th>
<th class="headcol">G3</th>
<th>Comment</th>
<th>LotPurpose</th>
<th>Lot</th>
<th>Wafers</th>
<th>Sampling</th>
<th>Temp</th>
<th>Submitted By</th>
<th>Fname</th>
<th>Sdate</th>
<th>Rdate</th>
<th>Latest Status</th>
<th>Assignee</th>
<th>Set Status</th>
<th>Set Assignee</th>
<th>Any Comments</th>
</tr>

<tbody>
<% 

try{

Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);

}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}
//String sql="select ticket_no,g1,g2,g3,comment,lotpurpose,lot,wafers,sampling,temp,login_id,fname,sdate,rdate,status,assignee from msr_data";
String sql="select d.ticket_no,d.g1,d.g2,d.g3,d.comment,d.lotpurpose,d.lot,d.wafers,d.sampling,d.temp,d.login_id,d.fname,d.sdate,d.rdate,a.status,a.assignee from msr_data d left join (select * from msr_assign order by UPDATED_TIME DESC limit 1 )a on a.ticket_no=d.ticket_no and a.status !='Completed'";

try{
s = con.createStatement();
rs = s.executeQuery(sql);
%>
 
<%
int i=0;
while( rs.next() ){
	i++;
%>


<!--  Ticket is made as a text box since it is easily passed and read at the servlet -->
<tr>
<!--  <td style="width:200px; background-color:lightblue;position:RELATIVE;"><input type = text id = ticckk name = "ticckk" readonly value=<%= rs.getString("ticket_no").trim() %>></td> -->
<td class="headcol"><input type = text id = ticckk name = "ticckk" readonly value=<%= rs.getString("ticket_no").trim() %>></td>
<td class="headcol"><%= rs.getString("g1") %></td>
<td class="headcol" ><%= rs.getString("g2") %></td>
<td class="headcol"><%= rs.getString("g3") %></td>
<td ><%= rs.getString("comment") %></td>
<td><%= rs.getString("lotpurpose") %></td>
<td ><%= rs.getString("lot") %></td>
<td><%= rs.getString("wafers") %></td>
<td ><%= rs.getString("sampling") %></td>
<td><%= rs.getString("temp") %></td>
<td><%= rs.getString("login_id") %></td>
<td><a href=<%= rs.getString("fname") %>><%= rs.getString("fname") %></a></td>
<td ><%= rs.getString("sdate") %></td>
<td><%= rs.getString("rdate") %></td>
<td><%= rs.getString("status") %></td>
<td ><%= rs.getString("assignee") %></td>
<td> <select id = category name="category">
<option value="None">None</option>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     	url="jdbc:mysql://localhost:3306/test"
     	user="root"  password=""/>
     		<sql:query dataSource="${snapshot}" var="res">
        SELECT distinct username as tt FROM msr_account 
       </sql:query>
        <c:forEach var="row" items="${res.rows}">
        <option value="${row.username}">${row.username}</option>';
        </c:forEach>
 </select>
</td>
<td> <select id = sstatus name="sstatus">
<option value="None">None</option>
      <sql:query dataSource="${snapshot}" var="rest">
        SELECT distinct sstatus FROM msr_status_list
       </sql:query>
        <c:forEach var="row" items="${rest.rows}">
       
          <option value="${row.sstatus}">${row.sstatus}</option>';
      </c:forEach>
 
</select>
</td>
<td ><input type = text id = ccomment name = "ccomment" value=""></td>
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