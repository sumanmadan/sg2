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

<style>

body {
font: 100% Verdana, Arial, Helvetica, sans-serif;
background: white;
margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
text-align: center; /* this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector */


}

.oneColLiqCtr #container {
width: 100%; /* this will create a container 80% of the browser width */
background: #FFFFFF;
margin: 0 auto; /* the auto margins (in conjunction with a width) center the page */
border: 1px solid;
text-align: left; /* this overrides the text-align: center on the body element. */
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
            
.oneColLiqCtr #main {
padding: 0 20px; /* remember that padding is the space inside the div box and margin is the space outside the div box */
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

.spinner {
    position: fixed;
    top: 50%;
    left: 50%;
    margin-left: -50px; /* half width of the spinner gif */
    margin-top: -50px; /* half height of the spinner gif */
    text-align:center;
    z-index:1234;
    overflow: auto;
    width: 100px; /* width of the spinner gif */
    height: 102px; /*hight of the spinner gif +2px to fix IE8 issue */
}



</style>
</head>

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
       $('#main').show();
    
   }
else {
	 alert(" You've entered in the wrong password");
	 window.location='mainPage.jsp';
}
	

 $("input[type='button']").click(function() {
   //var vsql = 'default value'; // or add a default in the switch
   switch(this.id) {
     case 'alld':
    	 $('#spinner').show();
    	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'no update')full_list ";
    	 sql = sql + " from msr_data_f d ";
    	 sql = sql + "left join (SELECT ticket_no, "  ;
    	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
    	 sql = sql + " FROM msr_assign_f group by ticket_no) ";
    	 sql = sql + "aa on aa.ticket_no=d.ticket_no  ";
    	 var posting = $.post("newReportQuery2_f.jsp", {sql : sql});
    	
    		 
    		 posting.done(function( data ) {   
    			 
  			   //alert("retrieving data");
  			   $("#tableWrap").empty().append(data); 
  			   table = $('#pt').DataTable({
  					  
  					"aaSorting": [[ 2, "desc" ]],
  					"bJQueryUI": true,
  					"sPaginationType": "full_numbers",
  					"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
  	             "tableTools": {
  	                 "sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
  	                 "aButtons": ["copy", "csv", "pdf"]
  	             },
  	    });	  
  		    
  			 $('#spinner').hide();	 
  	 });
    break;
 	case 'assigned':
 		 $('#spinner').show();
      	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
    	 sql = sql + " from msr_data_f d ";
    	 sql = sql + "left join (SELECT ticket_no, "  ;
    	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
    	 sql = sql + " FROM msr_assign_f group by ticket_no) ";
    	 sql = sql + "aa on aa.ticket_no=d.ticket_no where not regexp_like(aa.alll, 'Completed|none|Rejected')";
    	 var posting = $.post("newReportQuery2_f.jsp", {sql : sql});
    	 posting.done(function( data ) {   
    		 
			   //alert("retrieving data");
			   $("#tableWrap").empty().append(data); 
			   table = $('#pt').DataTable({
					  
					"aaSorting": [[ 2, "desc" ]],
					"bJQueryUI": true,
					"sPaginationType": "full_numbers",
					"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
	             "tableTools": {
	                 "sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
	                 "aButtons": ["copy", "csv", "pdf"]
	             },
	    });	  
			   $('#spinner').hide();    
	    	 
	 });
     
         break;
         
     case 'unassigned':
 	 	 
    	 var sql = "select d.priority, case when d.priority is null then t2.priority else d.priority End as priority, d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time, ";
         sql = sql + " CASE WHEN t2.ticket_no IS NULL THEN 'Unassigned' ELSE 'Error' END AS full_list" ;
         sql = sql + "  FROM msr_data_f d " ;
         sql = sql + " LEFT JOIN msr_assign_f t2 ON t2.ticket_no  = d.ticket_no " ;
         sql = sql + " where t2.ticket_no IS NULL ";
		
         $('#spinner').show();
    	 //System.out.println("Blahhhh" + sql);
    	 
    	 var posting = $.post("newReportQuery2_f.jsp", {sql : sql});
    	 posting.done(function( data ) {   
    		 
			   //alert("retrieving data");
			    $('#spinner').hide();
			   $("#tableWrap").empty().append(data); 
			   table = $('#pt').DataTable({
					  
					"aaSorting": [[ 2, "desc" ]],
					"bJQueryUI": true,
					"sPaginationType": "full_numbers",
					"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
	             "tableTools": {
	                 "sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
	                 "aButtons": ["copy", "csv", "pdf"]
	             },
	    });	  
		    
	    	 
	 });
    break;
         
         
         
 case 'rejected':
	     $('#spinner').show();
    	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
    	 sql = sql + " from msr_data_f d ";
    	 sql = sql + "left join (SELECT ticket_no, "  ;
    	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
    	 sql = sql + " FROM msr_assign_f p group by ticket_no) ";
    	 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Rejected')";
    	 var posting = $.post("newReportQuery2_f.jsp", {sql : sql});
    	 posting.done(function( data ) {   
    		 
			  // alert("retrieving data");
			   $("#tableWrap").empty().append(data); 
			   table = $('#pt').DataTable({
					  
					"aaSorting": [[ 2, "desc" ]],
					"bJQueryUI": true,
					"sPaginationType": "full_numbers",
					"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
	             "tableTools": {
	                 "sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
	                 "aButtons": ["copy", "csv", "pdf"]
	             },
	    });	  
		    
			   $('#spinner').hide(); 
	 });
    
		
         break;
         
         
 case 'completed':
	 $('#spinner').show();
	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
	 sql = sql + " from msr_data_f d ";
	 sql = sql + "left join (SELECT ticket_no, "  ;
	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
	 sql = sql + " FROM msr_assign_f p group by ticket_no) ";
	 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Completed')";
	 var posting = $.post("newReportQuery2_f.jsp", {sql : sql});
	 posting.done(function( data ) {   
		 
		 //  alert("retrieving data");
		   $("#tableWrap").empty().append(data); 
		   table = $('#pt').DataTable({
				  
				"aaSorting": [[ 2, "desc" ]],
				"bJQueryUI": true,
				"sPaginationType": "full_numbers",
				"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
           "tableTools": {
               "sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
               "aButtons": ["copy", "csv", "pdf"]
           },
  });	  
	    
		   $('#spinner').hide();	 
});
	 
	
     break;
     
     
 case 'Mycompleted':
	 var n = "<%=request.getAttribute("hello").toString()%>";
	 $('#spinner').show();
	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
	 sql = sql + " from msr_data_f d ";
	 sql = sql + "left join (SELECT ticket_no, "  ;
	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
	 sql = sql + " FROM msr_assign_f p where Assignee =" + "'" + n + "'" + "group by ticket_no) ";
	 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Completed')";
	 var posting = $.post("newReportQuery2_f.jsp", {sql : sql});
	 posting.done(function( data ) {   
		 
		  // alert("retrieving data");
		   $("#tableWrap").empty().append(data); 
		   table = $('#pt').DataTable({
				  
				"aaSorting": [[ 2, "desc" ]],
				"bJQueryUI": true,
				"sPaginationType": "full_numbers",
				"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
           "tableTools": {
               "sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
               "aButtons": ["copy", "csv", "pdf"]
           },
  });	  
	    
		   $('#spinner').hide();
});
	 
	 
	 
	 
	 
	 
     break;
            
     
 case 'Myrejected':
	 var n = "<%=request.getAttribute("hello").toString()%>";
	 $('#spinner').show();
	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
	 sql = sql + " from msr_data_f d ";
	 sql = sql + "left join (SELECT ticket_no, "  ;
	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
	 sql = sql + " FROM msr_assign_f p where Assignee =" + "'" + n + "'" + "group by ticket_no) ";
	 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Rejected')";
	 var posting = $.post("newReportQuery2_f.jsp", {sql : sql});
	 posting.done(function( data ) {   
		 
		   //alert("retrieving data");
		   $("#tableWrap").empty().append(data); 
		   table = $('#pt').DataTable({
				  
				"aaSorting": [[ 2, "desc" ]],
				"bJQueryUI": true,
				"sPaginationType": "full_numbers",
				"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
           "tableTools": {
               "sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
               "aButtons": ["copy", "csv", "pdf"]
           },
  });	  
	    
		   $('#spinner').hide();
});
	 
   break;   
            
 case 'Myassigned':
	 var n = "<%=request.getAttribute("hello").toString()%>";
	 $('#spinner').show();
	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'none')full_list ";
	 sql = sql + " from msr_data_f d ";
	 sql = sql + "left join (SELECT ticket_no, "  ;
	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
	 sql = sql + " FROM msr_assign_f p where Assignee =" + "'" + n + "'" + "group by ticket_no) ";
	 sql = sql + "aa on aa.ticket_no=d.ticket_no where not regexp_like(aa.alll, 'Completed|none|Rejected')";
	 var posting = $.post("newReportQuery2_f.jsp", {sql : sql});
	 posting.done(function( data ) {   
		 
		   //alert("retrieving data");
		   $("#tableWrap").empty().append(data); 
		   table = $('#pt').DataTable({
				  
				"aaSorting": [[ 2, "desc" ]],
				"bJQueryUI": true,
				"sPaginationType": "full_numbers",
				"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
           "tableTools": {
               "sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
               "aButtons": ["copy", "csv", "pdf"]
           },
  });	  
	    
		   $('#spinner').hide();
});

     break;      
         
   } // switch
  
 
   
 });
 
 
 
	
 
});




</script>


</head>
<body class="oneColLiqCtr">
<div id=mainContent>
<div id = main style="display:none">
<img  src='Coll_Logo.png' align=left alt='My image' />
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
<div style="height: auto;overflow: hidden;">
<p> All Requests </p>
<input type=button id="completed" name="completed" value="completed" class="btype">
<input type=button id="rejected" name="rejected" value="rejected" class="btype">
<input type=button id="assigned" name="asssigned" value="assigned" class="btype">
<input type=button id="unassigned" name="unassigned" value="unassigned" class="btype">
<input type=button id="alld" name="alld" value="All" class="btype">

<p>
My Requests </p>
<input type=button id="Mycompleted" name="Mycompleted" value="My completed requests" class="btype">
<input type=button id="Myrejected" name="Myrejected" value="My rejected requests" class="btype">
<input type=button id="Myassigned" name="Myasssigned" value="My assigned requests" class="btype">

</div>

</form>
</div>
<div id="spinner" class="spinner" style="display:none;">
    <img id="img-spinner" src="ajax-loader.gif" alt="Loading"/>
</div>
<div id="tableWrap" align=center >

</div>

</div>
</body>
</html>