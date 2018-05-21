<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1; Content-Disposition; attachment; filename="blah.xls"  >
<meta http-equiv="Content-type" content="application/x-www-form-urlencoded; charset=UTF-8"/>


<%@ page import="java.io.*,java.util.*,java.sql.*"%>
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
	    @import "js/TableTools-2.2.1/css/dataTables.tableTools.css";
		@import "js/TableTools-2.2.1/css/dataTables.tableTools.min.css";
		@import "js/TableTools-2.2.1/FixedColumns-3.0.2/css/dataTables.fixedColumns.css"; 
	
	</style>
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/highcharts-more.js"></script>
	<script type="text/javascript" src="js/exporting.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/view.js"></script>
	<script type="text/javascript" src="js/TableTools-2.2.1/js/dataTables.tableTools.js"></script>
	<script type="text/javascript" src="js/TableTools-2.2.1/FixedColumns-3.0.2/js/dataTables.fixedColumns.js"></script>
	<script type="text/javascript" src="js/bootstrap-3.2.0-dist/js/bootstrap.js"></script>
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!--  Suman Bharadwaj, Apr-May 2013 
	  This is for the the Test Reqeust System
	  #Jan 2014
	  ###Changes to include the priority
-->

<link rel="stylesheet" href="//cdn.datatables.net/responsive/1.0.6/css/dataTables.responsive.css"></script>
<script type="text/javascript" src="//cdn.datatables.net/responsive/1.0.6/js/dataTables.responsive.js"></script>

<style type="text/css">

body {
   
    margin-left:20px;    
 
}

th:last-child,td:last-child{background:white;border-color:grey;border:grey}
/*input[type="text"] 
{
background-color:grey;
border: 0px solid;
color:black;
width:auto;
}*/
 input[type="text"] {
     width: auto; 
     box-sizing: border-box;
     -webkit-box-sizing:border-box;
     -moz-box-sizing: border-box;
   
}
  
input.balagade {
float : right;
/*width:200px;*/
width:auto;
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

#tt {
margin: 0 auto;
clear: both;
width: auto%;
/*width: auto;
min-width: 30px;*/
table-layout: fixed;
 
 
}
/*
th, td {
    white-space: nowrap;
}*/

.mycontent
{
    display:none;
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

String url=  "jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1";
String id= "f8tdtest";
String pass = "f8tdtest";


%>
function aoColumns() {
    var ao = [];
    $("#table th").each(function(i) {
        switch (i) {
            case 10 : 
                ao.push({"sWidth": "20px"});
                break;
            case 11 : 
                ao.push({"sWidth": "20px"});
                break;
            default :
                ao.push({"sWidth": "25px"});
                break;
        }
    });
    return ao;
}

$( document ).ready( function() {
	
	
	
	/*var password = "admin";
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
}*/
	
	
$("#main").removeAttr('disabled');
$('#main').show();
/*var table = $('#tt').DataTable({
	 "sScrollX": "80%",
	 "sScrollXInner": "150%",
	 "scrollY": "300px",
	 "bScrollCollapse": true,
	  "bPaginate" : false,
   "paging": false,
	"aaSorting": [[ 2, "desc" ]],
	"bJQueryUI": true,
	"sPaginationType": "full_numbers",
	"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
"tableTools": {
"sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
"aButtons": ["copy", "csv", "pdf"]
}
}); */


var datatables_options = {
	  
	    "responsive": true,
	    "sDom": '<"top"i>rt<"bottom"flp><"clear">',           
	    "bPaginate": false,   
	    "sPaginationType": "full_numbers", 
	    "iDisplayLength": -1,
	    "bSort": true, 
	    "bFilter": false, 
	    "aaSorting": [], 
	    "bInfo": false, 
	    "bStateSave": false, 
	    "iCookieDuration": 0, 
	   //s  "bScrollAutoCss": true, 
	    "bProcessing": true, 
	    "bJQueryUI": true ,
	    
	 
	  //s  "paging": false,
	 	"aaSorting": [[ 2, "desc" ]],
	    "sPaginationType": "full_numbers",
		"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
	"tableTools": {
	"sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
	"aButtons": ["copy", "csv", "pdf"]
	}
	};

	/*datatables_options["sScrollY"] = "450px";
	datatables_options["sScrollX"] = "100%";
	datatables_options["bScrollCollapse"] = true;*/

	// add this
	//datatables_options["sScrollXInner"] = '150%';
	//
	                   
	var table = $('#tt').DataTable(datatables_options);
	//new $.fn.dataTable.FixedColumns(table);

	//new $.fn.dataTable.FixedColumns( table, {
   //     leftColumns: 4
  //  } );




	
	var vv = "None";
	var xx = "None";
	
	$('.selectClassOne').change(function(e){
	   
	     vv = $(this).val();
	     
	    
	});
			
		 
	$('.selectClassTwo').change(function(e){
		var xx = $(this).val();
		
		
		if ( vv != "None" && xx != "None") {
			//alert(vv + xx);
		    $("#done").removeAttr("disabled")
		}
		
		if (vv === "None" || xx === "None" ) {
			
			 $('#done').attr("disabled", true);
		}
		
		
		
	});
	
	//$('#too-long').popover();

	//$('[rel=popover]').popover();
	/*$('[rel=popover]').popover({
	    html:true,
	    placement:'right',
	    content:function(){
	        return $($(this).data('contentwrapper')).html();
	    }
	});*/
	$('.danger').popover({ 
	    html : true,
	    content: function() {
	     // return $('#popover_content_wrapper').html();
	      return $(this).next('#popover_content_wrapper').html();
	    }
	  });
	

});
</script>
</head>

<body>
<div id = "main" style="display:none">
<h1>Test Request System (WET):Assignment/Status Update</h1>
<div id = r>
<ul>
<li><a href="mainPage.jsp" target=_blank> Main Menu </a></li>
</ul>
<br>
<br>
<hr>

<form method="post" action="updateServlet_assign_p_db_P" >
<div style="height: auto; overflow: hidden;">
<input type=submit id="done" name="done" value="Update" class="balagade" disabled>
</div>

<div id="wrapper">
 <table id = tt style= "display:'table';border=1;width:auto">
 <!--<table id = tt style= "display:'table';border=1;width:auto">-->
<thead>
<tr>
<th>Assignee</th>
<th>TicketNo</th>
<th>TicketNoRef#</th>
<th>Technology</th>
<th>Product</th>
<!--  
<th>Test Type</th>
<th>Test Family</th>-->
<th>Comment</th>
<!--Request to remove from Sirajum, 5May2015  <th>LotPurpose</th>
<th>Lot</th>
<th>Sampling</th>
<th>Temp</th> -->
<th>Submitted By</th>
<th>Attachment</th>
<th>Submitted date</th>
<th>Required date</th> <!--  now it is wanted By Sirajum Jan 2016. -->
<!-- <th class="fixed-width">Requestor Email</th>   now not wanted By Sirajum Jan 2016. -->
<!--<th>PreviousRemarks</th>-->
<th class="fixed-width">Latest Status</th>
<th>Initial Priority</th>
<th>Updated Priority</th>
<th>Set/Change Assignee</th>
<th>Set/change Status</th>
<th>Set/Change Priority</th>
<th>Enter your Comments</th>

<th style="display:none">displyno1</th>
<th style="display:none">displyno2</th>

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
//String sql="select ticket_no,g1,g2,g3,comment,lotpurpose,lot,wafers,sampling,temp,login_id,fname,sdate,rdate,status,assignee from msr_data";
//String sql="select d.ticket_no,d.g1,d.g2,d.g3,d.comment,d.lotpurpose,d.lot,d.wafers,d.sampling,d.temp,d.login_id,d.fname,d.sdate,d.rdate,a.status,a.assignee from msr_data_p d left join (select * from msr_assign order by UPDATED_TIME DESC limit 1 )a on a.ticket_no=d.ticket_no and a.status !='Completed'";
//String sql="select pp.ticket_no,pp.g1, pp.g2, pp.g3,pp.comments,pp.lotpurpose,pp.lot, pp.wafers, pp.sampling, pp.temp, pp.login_id,pp.fname,pp.sdate,pp.rdate, aa.status, aa.assignee, ROW_NUMBER() OVER (PARTITION BY aa.ticket_no ORDER BY aa.updated_time DESC)  FROM  msr_data_p pp left JOIN  msr_assign AA on pp.ticket_no =  AA.ticket_no";



//String sql="select g.ticket_no, x.updated_time,x.*, g.* from msr_data_p g left outer join (select * from (select n.*, row_number() over (partition by ticket_no order by updated_time desc) rn from msr_assign n ) where rn = 1 ) X on ( g.ticket_no = x.ticket_no )where x.status is null or x.status = 'Assigned' order by g.ticket_no desc";

//correct one
//String sql="select g.*,xx.*,xx.status Ssstatus, xx.assignee Aassignee from msr_data_p g left outer join (select * from (select n.*, row_number() over (partition by ticket_no order by updated_time desc) rn from msr_assign_p n ) where rn = 1 ) xx on ( g.ticket_no = xx.ticket_no )where xx.status is null or xx.status like '%ssigned' order by g.ticket_no desc";
//latest one to include priority
String sql="select g.*,xx.*,xx.status Ssstatus, xx.assignee Aassignee, xx.priority ppriority, xx.comments rremarks from msr_data_p g left outer join (select * from (select n.*, row_number() over (partition by ticket_no order by updated_time desc) rn from msr_assign_p n ) where rn = 1 ) xx on ( g.ticket_no = xx.ticket_no )where xx.status is null or xx.status like '%ssigned' order by g.ticket_no desc";
%>


<%
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
<td ><%= rs.getString("Aassignee") + "_" + rs.getString("ticket_no")%></td>
<td ><%= rs.getString("ticket_no").trim() %></td>
<% String idd ="select * from msr_data_p where ticket_no=" + rs.getString("ticket_no"); %>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1"
user="f8tdtest"  password="f8tdtest"/>
<sql:query dataSource="${snapshot}" var="residref"> 
SELECT (SELECT alphaticket FROM msr_alpha_ticket WHERE ticketno = <%=rs.getString("ticket_no")%> ) AS aid FROM DUAL
</sql:query>
        <c:forEach var="row" items="${residref.rows}">
            <c:set var="idalpha" value="${row.aid}" /> 
           
             	<td>${idalpha}</td>
        
   
        	
        </c:forEach>
<td><a href="<%=request.getContextPath()%>/QueryStringD_P?id=<%=idd%>" target="_Blank"><%=  rs.getString("tech")%></a></td>
<td><%=rs.getString("prod")%></td>
<!--  <td ><%= rs.getString("g2") %></td>  -->
<%String dd  = rs.getString("comments");%>
<!--   <td><%= rs.getString("g3") %></td> -->
<td>
<!--  <div class="mycontent"> </div>
<a href="javascript: void(0)" id="member1" data-contentwrapper=".mycontent" rel="popover">long text</a> </td>-->

<a class='danger' data-placement='above' title="#Poptoopenclose" href='#'><img src="images/notepad1.jpg"></a>
<div id="popover_content_wrapper" style="display: none">
  <div><%=dd%></div>
</div>

</td>
<!--  
<td><%=rs.getString("lotpurpose") %></td>
<td><%=rs.getString("lot") %></td>
<td><%=rs.getString("sampling") %></td>
<td><%=rs.getString("temp") %></td>
-->
<td><%= rs.getString("login_id") %></td>
<!--  <td><a href=<%= rs.getString("fname") %>><%= rs.getString("fname") %></a></td> -->
<% 
  if ( rs.getString("fname").equalsIgnoreCase("No attachment")) {
	   
	  //String ff  = "No attachment" ;
	   String ff  = "None" ;
	   %>
	  <!--  <td><a href="<%=request.getContextPath()%>/QueryString?id=ff%"><%=ff%></a></td>-->
	  <td class="fixed-width"><%=ff%></td>
   <% } else {
	 
      String ff =  rs.getString("fname");
     
      %>
     <td class="fixed-width"><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>"><img src="images/document1.jpg"></a></td>
     <% 
   }
%>

<td class="fixed-width" ><%=rs.getString("sdate")%></td>
<td class="fixed-width"><%= rs.getString("rdate")%></td> <!-- Removed the commented part since it is wanted by Sirajim in Jan 2016-->

<!--<td><%=rs.getString("eemail")%></td>-->
<!--<td ><%= rs.getString("rremarks") %></td>-->
<td class="fixed-width"><span><%= rs.getString("Ssstatus") %></span></td>

<td><%= rs.getString("Priority") %></td>
<td><%= rs.getString("ppriority") %></td>
<td><select class="selectClassOne" id = category name="category">
<option value="None">None</option>
<!--<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     	url="jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1"
     	user="f8tdtest"  password="f8tdtest"/>-->
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

<td> <select class="selectClassTwo" id = prio name="prio">

      <sql:query dataSource="${snapshot}" var="rest">
        SELECT distinct priority FROM msr_priority order by priority asc
       </sql:query>
        <c:forEach var="row" items="${rest.rows}">
       
          <option value="${row.priority}">${row.priority}</option>';
      </c:forEach>
 
</select>
</td>

<td ><input type = text id = ccomment name = "ccomment" value=""></td>

<td style="display:none"><input type = text id = ticckk name = "ticckk" readonly value=<%= rs.getString("ticket_no").trim() %>></td>
<td style="display:none"><input type = text id = eemail name = "eemail" readonly value=<%=rs.getString("eemail")%>></td>

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