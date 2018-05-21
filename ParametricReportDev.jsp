<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>


<head>	

	<title>Parametric Report - Test Request System </title>
	
	<link rel="stylesheet"  href="css/reset.css" />
	<link rel="stylesheet"  href="css/smoothness/jquery-ui-1.10.3.custom.css" />	
	<link rel="stylesheet"  href="css/table.css" />
	<style type="text/css" title="currentStyle">
		@import "css/demo_page.css";
		@import "css/demo_table_jui.css";
		@import "css/jquery-ui-1.8.4.custom.css";
		@import "js/TableTools-2.2.1/css/dataTables.tableTools.css";
		@import "js/TableTools-2.2.1/css/dataTables.tableTools.min.css"; 
		
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
	<script type="text/javascript" src="js/TableTools-2.2.1/js/dataTables.tableTool.min.js"></script>
	
   


<style>

body {
font: 100% Verdana, Arial, Helvetica, sans-serif;
background: white;
margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
text-align: center; /* this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector */


}
#pt table,td,th,tr{
 
  		    text-align: center;
  			 border-bottom:solid;
 			 border-width : 2px;
 			
		}

.goButton {
	display: inline-block;
	padding-right: 150px;
	padding-left: 120px;
	padding: 0 5px 5px 5px;
	font-size: auto;
	padding: 14px;
	
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
font-weight:bold;
color:#FFFFFF;
background-color:#98bf21;
text-align:center;
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
}
            



input.btype {
<!--float : right; -->
width:200px;
padding: 10px 20px 11px !important;
font-size: 12px !important;
background-color: Orange;
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

</style>


<script>


$( document ).ready( function() {
	

	 var ql = "select distinct trim(tech) from msr_techprd_p";
	 var posting = $.post("getTreports.jsp", {tech : ql});
     posting.done(function( data ) {   
     	  $("#dropdownt").empty().append(data); 
     	  $("#dropdownt").show(); 
     });
 
     
     if ($('#dropdownt option:selected').length == 0) { alert('nothing selected'); }
  	    if (!$("#dropdownt option:selected").length) {
  	  
  	    	  var ssql = "select distinct product from msr_techprd_p";
  	    	  var posting = $.post("getPreports.jsp", {pdt : ssql});
  	         	posting.done(function( data ) { 
  	         		 alert("kjljl" +  data);
  	          		  $("#dropdownp").empty().append(data);  
  	            
  	           		 $("#dropdownp").show(); 
  	         
  	         });
  	      } else {
  	    	
  	      var mb = $('#dropdownt option:selected').text();
  	  	  if (!$("#dropdownt option:selected").length) {
  	  		 //alert("gosh  " + mb);
  	  		    var ssql = "select distinct product from msr_techprd_p";
  	  		 } else {
  	  	    	 var ssql = "select distinct product from msr_techprd_p where tech =" + "'" + mb + "'";
  	  			 
  	  		 }
  	    }
  	    
  	   
    
    //get the Priority
    var posting = $.post("getPrioReports.jsp");
    posting.done(function( data ) {   
    	  $("#dropdownPrio").empty().append(data); 
    });
    
    //get the status
    var posting = $.post("getStatusreports.jsp");
    posting.done(function( data ) {   
    	  $("#dropdownStatus").empty().append(data); 
    });
    
  //get the status
    var posting = $.post("getAssigneereports.jsp");
    posting.done(function( data ) {   
    	  $("#dropdownAssignee").empty().append(data); 
    });
    
    
    
 $('#dropdownt').bind('change', function() {
      	 
	}); 
 
 $('#dropdownp').bind('change', function() {
   	 
	}); 
 $("#dropdownt").change(function()  {
	 //reset all the dropdown
		  $('#pdt').prop('selectedIndex',0) ;
	 		 
	 var mb = $('#dropdownt option:selected').text();
	  if (!$("#dropdownt option:selected").length) {
		 //alert("gosh  " + mb);
		    var ssql = "select distinct product from msr_techprd_p";
		 } else {
	    	 var ssql = "select distinct product from msr_techprd_p where tech =" + "'" + mb + "'";
			 
		 }
	     
	     //alert("gosh 2  " + ssql);
	  
	 var posting = $.post("getPreports.jsp", {pdt : ssql});
     posting.done(function( data ) { 
     // alert("kjljl" +  data);
        $("#dropdownp").empty().append(data);  
        
        $("#dropdownp").show(); 
     
     });
   
 });  
     




$("#datepicker1").datepicker({
	  changeMonth: true,
      changeYear: true,
      dateFormat: 'yy-mm-dd 00:00:00'
 });
	


$("#datepicker2").datepicker({
	  changeMonth: true,
      changeYear: true,
     dateFormat: 'yy-mm-dd 00:00:00'
});
	


$("#run").click(function() {
	var a1 = ( $( "#tech option:selected" ).text());
	var a2 = ( $( "#pdt option:selected" ).text());
	var a3 = ( $( "#Prio option:selected" ).text());
	var a4 = ( $( "#Assign option:selected" ).text());
	var a5 = ( $( "#Status option:selected" ).text());

	$("#f1").submit();
/*	$('#tableWrap').empty();
	 $.ajax({
     	cache	: false,
         url     : "preports.jsp",
         type    : "get",
         data    : $(this).serialize(),
         dataType: "html",
         success : function( response ) {
                     $('#tableWrap').html(response);
                   }
     });
     return false;
	*/
});

$("input[type='button']").click(function() {
	   //var vsql = 'default value'; // or add a default in the switch
	   
	
	 /*
	 
	   $('#pt').empty();
	   var oTable = $('#pt').dataTable();
 	   oTable.fnDestroy();
 	   
 	   */
	  
	
	   switch(this.id) {
	   
	     case 'alld':
	    	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'no update')full_list ";
	    	 sql = sql + " from msr_data_p d ";
	    	 sql = sql + "left join (SELECT ticket_no, "  ;
	    	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
	    	 sql = sql + " FROM msr_assign_p group by ticket_no) ";
	    	 sql = sql + "aa on aa.ticket_no=d.ticket_no  ";
	    	
	    	 
	    	 
	    	 
	    	 
	    	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
	    	
	    	 posting.done(function( data ) {  

  			   $("#tableWrap").empty().append(data); 
	    		
  			 if (  $('#tableWrap #pt tbody tr').length > 0) {
				 
				 alert("wwwww");
				 //$("#pt").dataTable();
				 
				 var ztable = $('#pt').DataTable({	
						"aaSorting": [[ 2, "desc" ]],
						"bJQueryUI": true,
						"sPaginationType": "full_numbers",
							"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
			            "tableTools": {
			                "sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
			                "aButtons": ["copy", "csv", "pdf"]
			            },
							
							
					
					}); 
				 
			 }
  				 
  	
	    	   
	    	  
	 			
	    	 });
	    
	    	 
	    	break;
	     case 'assigned':
	      	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
	    	 sql = sql + " from msr_data_p d ";
	    	 sql = sql + "left join (SELECT ticket_no, "  ;
	    	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
	    	 sql = sql + " FROM msr_assign_p group by ticket_no) ";
	    	 sql = sql + "aa on aa.ticket_no=d.ticket_no where not regexp_like(aa.alll, 'Completed|none|Rejected')";
	    	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
	    	 posting.done(function( data ) {   
	    	
	    			   $("#tableWrap").empty().append(data); 
	    			   if (  $('#tableWrap #pt tbody tr').length > 0) {
	    					 
	    					 alert("wwwww");
	    			// $("#pt").dataTable();
	    					 var ztable = $('#pt').DataTable({	
	    							"aaSorting": [[ 2, "desc" ]],
	    							"bJQueryUI": true,
	    							"sPaginationType": "full_numbers",
	    								"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
	    				            "tableTools": {
	    				                "sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
	    				                "aButtons": ["copy", "csv", "pdf"]
	    				            },
	    								
	    								
	    						
	    						}); 
	    				 }
	        	 
	    	 });
	    	 
	    	 
	         break;
	       
	     case 'unassigned':
	    	 var sql = "select d.priority,case when d.priority is null then t2.priority else d.priority End as priority, d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time, ";
	         sql = sql + " CASE WHEN t2.ticket_no IS NULL THEN 'Unassigned' ELSE 'Error' END AS full_list" ;
	         sql = sql + "  FROM msr_data_f d " ;
	         sql = sql + " LEFT JOIN msr_assign_f t2 ON t2.ticket_no  = d.ticket_no " ;
	         sql = sql + " where t2.ticket_no IS NULL ";

	    	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
	    	 posting.done(function( data ) {   
	    	
	    			   $("#tableWrap").empty().append(data); 
	    	
	    			   if (  $('#tableWrap #pt tbody tr').length > 0) {
	    					 
	    					 alert("wwwww");
	    					 $("#pt").dataTable();
	    					 
	    				 }
	    	    	 
	    	 });
	         break;
	case 'rejected':
	         
	    	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
	    	 sql = sql + " from msr_data_p d ";
	    	 sql = sql + "left join (SELECT ticket_no, "  ;
	    	 sql = sql + " rtrim((xmlagg(xmlelement(astatus, updated_time  || ':'  ||  astatus ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
	    	 sql = sql + " FROM msr_assign_p p group by ticket_no) ";
	    	 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Rejected')";
	    	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
	    	 posting.done(function( data ) {   
	    			   $("#tableWrap").empty().append(data); 
	        	 
	    	 });
	         break;
	         
	       
	 case 'completed':
	     
		 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
		 sql = sql + " from msr_data_p d ";
		 sql = sql + "left join (SELECT ticket_no, "  ;
		 sql = sql + " rtrim((xmlagg(xmlelement(astatus, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
		 sql = sql + " FROM msr_assign_p p group by ticket_no) ";
		 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Completed')";
		 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
		 posting.done(function( data ) {   
		
				   $("#tableWrap").empty().append(data); 
				   if (  $('#tableWrap #pt tbody tr').length > 0) {
  					 
  					 alert("wwwww");
  					 $("#pt").dataTable();
  					 
  				 }
		   	 
		 });
	     break;
	   
	 case 'Mycompleted':
		 var n = "<%=request.getAttribute("hello").toString()%>";
		 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
		 sql = sql + " from msr_data_p d ";
		 sql = sql + "left join (SELECT ticket_no, "  ;
		 sql = sql + " rtrim((xmlagg(xmlelement(astatus, updated_time  || ':'  ||  astatus ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
		 sql = sql + " FROM msr_assign_p p where Assignee =" + "'" + n + "'" + "group by ticket_no) ";
		 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Completed')";
		 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
		 posting.done(function( data ) {   
			 				   $("#tableWrap").empty().append(data); 
		 
		 });
	     break;
	    
	 case 'Myrejected':
		 var n = "<%=request.getAttribute("hello").toString()%>";
		 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
		 sql = sql + " from msr_data_p d ";
		 sql = sql + "left join (SELECT ticket_no, "  ;
		 sql = sql + " rtrim((xmlagg(xmlelement(astatus, updated_time  || ':'  ||  astatus ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
		 sql = sql + " FROM msr_assign_p p where Assignee =" + "'" + n + "'" + "group by ticket_no) ";
		 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Rejected')";
		 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
		 posting.done(function( data ) {   
				   $("#tableWrap").empty().append(data); 
	    	 
		 });
	     break;   
	            
	 case 'Myassigned':
		 var n = "<%=request.getAttribute("hello").toString()%>";
		 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
		 sql = sql + " from msr_data_p d ";
		 sql = sql + "left join (SELECT ticket_no, "  ;
		 sql = sql + " rtrim((xmlagg(xmlelement(astatus, updated_time  || ':'  ||  astatus ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
		 sql = sql + " FROM msr_assign_p p where Assignee =" + "'" + n + "'" + "group by ticket_no) ";
		 sql = sql + "aa on aa.ticket_no=d.ticket_no where not regexp_like(aa.alll, 'Completed|none|Rejected')";
		 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
		 posting.done(function( data ) {   
			
				   $("#tableWrap").empty().append(data); 
		 });
	     break;    
	     
	  
	     
	  }
	   
 
	 

	 
});



 alert("nw");

 alert("wwwww");
	 $("#pt").dataTable();



});
</script>

<script type="text/javascript">
		/* Script to initialize datatables  */
		//$().ready(function() {
		jQuery(document).ready(function(){
			
			/*  var sss =  $("#tt").dataTable({
					
					"aaSorting": [[ 4, "desc" ]],
					"bJQueryUI": true,
					"sPaginationType": "full_numbers"
									
						
				});*/
	
	});			
	</script>
</head>

<body>
<div>
<img  src='Coll_Logo.png' align=left alt='My image' />
<h1>Parametric Test Summary Page</h1>
<right><h3><i>( TD Test Request System )</h3></i></right>
</div>

<div id = r class = "one">
<ul>
<li><a href="mainPage.jsp" target=_blank> Main Menu </a></li>
</ul>
</div>
<br>
<br>
<hr>

<form id="f1" name="f1" method="post" action="preports.jsp" target=_blank>
<div style="height: auto;overflow: hidden;">

<input type=button id="completed" name="completed" value="completed" class="btype">
<input type=button id="rejected" name="rejected" value="rejected" class="btype">
<input type=button id="assigned" name="asssigned" value="assigned" class="btype">
<input type=button id="unassigned" name="unassigned" value="unassigned" class="btype">
<input type=button id="alld" name="alld" value="All" class="btype">


<br>

<input type=button id="Mycompleted" name="Mycompleted" value="My completed requests" class="btype">
<input type=button id="Myrejected" name="Myrejected" value="My rejected requests" class="btype">
<input type=button id="Myassigned" name="Myasssigned" value="My assigned requests" class="btype">

</div>



<hr>
<h3> Advanced Report filter</h3>
<hr>

<br>
<table>
<tr>
<td>
Select Technology :
</td>
<td>
<div id = dropdownt>
<select id = "tech" name = "tech" > </select>
</div>
</td>

</tr>

<tr>
<td>
Select Product :
</td>
<td>
<div id = dropdownp>
<select id = "pdt" name = "pdt" >  </select>
</div>
</td>
</tr>



<tr>
<td>Start Date :  </td>
<td>
   <input name="datepicker1" id="datepicker1" />
</td>
</tr>

<tr>
<td> End Date : </td>
<td>  
   <input name="datepicker2" id="datepicker2" />
</td>

</tr>
<tr>
<td>
Select Priority
 </td>
 <td>
<div id = dropdownPrio>
<select id = "Prio" name = "Prio" >  </select>
</div>
</td>

</tr>

<tr>
<td>
Select Assingee
 </td>
 <td>
<div id = dropdownAssignee>
<select id = "Assign" name = "Assign" >  </select>
</div>
</td>

</tr>

<tr>
<td>
Select Status
 </td>
 <td>
<div id = dropdownStatus>
<select id = "Status" name = "Status" >  </select>
</div>
</td>

</tr>

<tr>
<td>
Run Report with filter
 </td>
 <td>
<div id = runReport>
	<input id="run" name="run" type="button" class=goButton	value="Run Reportt" />
</div>
</td>

</tr>


</table>
</form>

<div id="tableWrap" name="tableWrap">
<table id = "pt" name="pt">


</table>

</div>
</body>
</html>