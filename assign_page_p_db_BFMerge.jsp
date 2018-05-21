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

.fixme 
{
    position: relative;
    left: expression( ( 20 + ( ignoreMe2 = document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft ) ) + 'px' );
    background-color: #FFFFFF;
}
 table a:link 
 {
    color: #666;
    font-weight: bold;
    text-decoration:none;
}
table a:visited 
{
    color: #999999;
    font-weight:bold;
    text-decoration:none;
}
table a:active,
table a:hover 
{
    color: #bd5a35;
    text-decoration:underline;
}
table 
{
    font-family:Arial, Helvetica, sans-serif;
    color:#666;
    font-size:12px;
    background:#eaebec;
    border:#ccc 1px solid;
    border-radius:3px;
    border-collapse:collapse; border-spacing: 0; 
    box-shadow: 0 1px 2px #d1d1d1;

}
table th 
{
    padding:10px 10px 10px 10px;
    border-top:0;
    border-bottom:1px solid #e0e0e0;
    border-left: 1px solid #e0e0e0;

    background: #ededed;
}
/*thead {background-color:#000268;color:#FFFFFF;text-align:center; position:fixed; top:0px;}*/
thead th { height:50px; width:120px;}

table td 
{
    /*padding:10px;*/
    border-bottom:1px solid #e0e0e0;
    border-left: 1px solid #e0e0e0;
    background: #fafafa;
}

/* tbody {background-color:grey;color:black;text-align:center;overflow-y:scroll; margin:0px;} */

table tr 
{
    text-align: center;
}

table tr:hover td 
{
    background: #f2f2f2;

}

thead th, tbody td 
{
  width: 155px;
  /*max-width:155px;
  min-width:155px;*/
  
}
#wrapper 
{
     max-width: 100%;
     overflow-x:scroll;  
     overflow-y:scroll; 
     margin-left:5em;
     overflow-y:visible;
     padding-bottom:1px;
}


input[type="text"] 
{
background-color:transparent;
border: 0px solid;
height:20px;
width:160px;
color:black;

}
 

 
.headcol 
{
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
    
table tr:first-child th
{
    background-color:#000268;
    color:#FFFFFF;text-align:center;
   
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
  
input.balagade {
float : right;
width:200px;
padding: 10px 20px 11px !important;
font-size: 16px !important;
background-color: #cccccc;
font-weight: bold;
text-shadow: 1px 1px #F36C8C;
color: black;
border-radius: 100px;
-moz-border-radius: 100px;
-webkit-border-radius: 100px;
border: 1px solid #F36C8C;
cursor: pointer;
box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;
-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;
-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;
border: 1px solid #f0eed9




}    

.disabledbutton{	color: #FFFFFF; font-family: arial, verdana, sans-serif; font-size: 12px; border: 1px solid #f0eed9;; background-color: #cccccc;}


table td.fixed-width {
width: 100%;
max-width:100%;
min-width:100%;
white-space: nowrap;

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

String url=  "jdbc:oracle:thin:@fc8orad03.gfoundries.com:1521:F8TDD1";
String id= "f8tdtest";
String pass = "f8tdtest";



%>


$( document ).ready( function() {
	
	
	
	var password = "admin";
	msg = ""
    var x = prompt("Enter in the password");
	
	if (!(x)){
		window.location='mainPage.jsp';
	} else if (x.toLowerCase() == password) {
      // alert("Come right in \n \n You've entered in the right password");
       $("#main").removeAttr('disabled');
       $('#main').show()
      // $("#tt").tablesorter();
   }
else {
	 alert(" You've entered in the wrong password");
	 window.location='mainPage.jsp';
}
	
	
	
	var vv = "None";
	var xx = "None";
	
	$('.selectClassOne').change(function(e){
	   
	     vv = $(this).val();
	     
	    
	});
			
		 
	$('.selectClassTwo').change(function(e){
		var xx = $(this).val();
		
		
		if ( vv != "None" && xx != "None") {
			alert(vv + xx);
		    $("#done").removeAttr("disabled")
		}
		
		if (vv === "None" || xx === "None" ) {
			
			 $('#done').attr("disabled", true);
		}
		
		
		
	});
	

});
</script>
</head>

<body>
<div id = "main" style="display:none">
<h1>Test Request System(Parametric) : Assignment/Status Update</h1>
<div id = r>
<ul>
<li><a href="mainPage.jsp" target=_blank> Main Menu </a></li>
</ul>
<br>
<br>
<hr>

<form method="post" action="updateServlet_assign_p_db" >
<div style="height: auto; overflow: hidden;">
<input type=submit id="done" name="done" value="Update" class="balagade" disabled>
</div>

<div id="wrapper">
<table id = tt>


<tr>
<!--  <td style="width:200px; background-color:lightblue;position:RELATIVE;">TicketNo </td> -->
<th class="headcol">TicketNo </th>
<th class="headcol">Group</th>
<th class="headcol">Test Type</th>
<th class="headcol">Test Family</th>
<th>Comment</th>
<th>LotPurpose</th>
<th>Lot</th>
<!--   <th>Wafers</th> -->
<th>Sampling</th>
<th>Temp</th>
<th>Submitted By</th>
<th>Attachment</th>
<th>Submitted date</th>
<th>Required date</th>
<th>Latest Status</th>
<th>Assignee</th>
<th>Set Assignee</th>
<th>Set Status</th>
<th>Enter your Comments</th>
<th>Requestor Email</th>
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
//String sql="select d.ticket_no,d.g1,d.g2,d.g3,d.comment,d.lotpurpose,d.lot,d.wafers,d.sampling,d.temp,d.login_id,d.fname,d.sdate,d.rdate,a.status,a.assignee from msr_data_p d left join (select * from msr_assign order by UPDATED_TIME DESC limit 1 )a on a.ticket_no=d.ticket_no and a.status !='Completed'";
//String sql="select pp.ticket_no,pp.g1, pp.g2, pp.g3,pp.comments,pp.lotpurpose,pp.lot, pp.wafers, pp.sampling, pp.temp, pp.login_id,pp.fname,pp.sdate,pp.rdate, aa.status, aa.assignee, ROW_NUMBER() OVER (PARTITION BY aa.ticket_no ORDER BY aa.updated_time DESC)  FROM  msr_data_p pp left JOIN  msr_assign AA on pp.ticket_no =  AA.ticket_no";



//String sql="select g.ticket_no, x.updated_time,x.*, g.* from msr_data_p g left outer join (select * from (select n.*, row_number() over (partition by ticket_no order by updated_time desc) rn from msr_assign n ) where rn = 1 ) X on ( g.ticket_no = x.ticket_no )where x.status is null or x.status = 'Assigned' order by g.ticket_no desc";

String sql="select g.*,xx.*,xx.status Ssstatus, xx.assignee Aassignee from msr_data_p g left outer join (select * from (select n.*, row_number() over (partition by ticket_no order by updated_time desc) rn from msr_assign_p n ) where rn = 1 ) xx on ( g.ticket_no = xx.ticket_no )where xx.status is null or xx.status like '%ssigned' order by g.ticket_no desc";




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
<% String idd ="select * from msr_data_p where ticket_no=" + rs.getString("ticket_no"); %>
<td><a href="<%=request.getContextPath()%>/QueryStringD_P?id=<%=idd%>" target="_Blank"><%=  rs.getString("g1")%></a></td>
<!--  <td class="headcol"><%= rs.getString("g1") %></td> -->
<td class="headcol" ><%= rs.getString("g2") %></td>
<td class="headcol"><%= rs.getString("g3") %></td>
<td class="fixed-width" ><%= rs.getString("comments") %></td>
<td class="fixed-width"><%= rs.getString("lotpurpose") %></td>
<td class="fixed-width"><%= rs.getString("lot") %></td>
<!--  <td class="fixed-width"><%= rs.getString("wafers") %></td> -->
<td class="fixed-width" ><%= rs.getString("sampling") %></td>
<td class="fixed-width"><%= rs.getString("temp") %></td>
<td class="fixed-width"><%= rs.getString("login_id") %></td>
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
     <td class="fixed-width"><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>">Click to open file</a></td>
     <% 
   }
%>



<td class="fixed-width" ><%=rs.getString("sdate")%></td>
<td class="fixed-width"><%= rs.getString("rdate")%></td>
<td><%= rs.getString("Ssstatus") %></td>
<td><%= rs.getString("Aassignee") %></td>
<td> <select class="selectClassOne" id = category name="category">
<option value="None">None</option>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     	url="jdbc:oracle:thin:@fc8orad02.gfoundries.com:1521:F8TDD1"
     	user="f8tdtest"  password="f8tdtest"/>
     		<sql:query dataSource="${snapshot}" var="res">
        SELECT distinct UNAME FROM msr_account 
       </sql:query>
        <c:forEach var="row" items="${res.rows}">
        <option value="${row.UNAME}">${row.UNAME}</option>';
        </c:forEach>
 </select>
</td>
<td> <select class="selectClassTwo" id = sstatus name="sstatus">
<option value="None">None</option>
      <sql:query dataSource="${snapshot}" var="rest">
        SELECT distinct sstatus FROM msr_status_list_p
       </sql:query>
        <c:forEach var="row" items="${rest.rows}">
       
          <option value="${row.sstatus}">${row.sstatus}</option>';
      </c:forEach>
 
</select>
</td>
<td ><input type = text id = ccomment name = "ccomment" value=""></td>
<td><input type = text id = eemail name = "eemail" readonly value=<%=rs.getString("eemail")%>></td>
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
</div>
</body>
</html>