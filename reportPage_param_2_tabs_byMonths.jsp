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
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
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
background-color:orange;
text-align:center;
text-decoration:none;
text-transform:uppercase;
}
.one a:hover,a:active
{
background-color:orange;
}
.one a
{
display:block;
background:silver;
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

<style>
.ui-datepicker-calendar {
    display: none;
    }
    
    
    
 #tabs ul li.selected {
    background: white;
    
}


#tabs li {
    display: block;
    background:#e6e6e6
}

#tabs a:hover {
   
    background: white;
  
}
#tabs a:active {
    background: white;
   
}






</style>
<script>




	





$( document ).ready( function() {
	$('#tabs').tabs({
		   
	 });
	
	 $('#tabs ul li a').click(function (ev) {
	        $('#tabs ul li').removeClass('selected');
	        $(ev.currentTarget).parent('li').addClass('selected');
	    });
	
	/* $('.date-picker').datepicker({
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        dateFormat: 'MM yy'
	       
	    }).focus(function() {
	        var thisCalendar = $(this);
	        $('.ui-datepicker-calendar').detach();
	        $('.ui-datepicker-close').click(function() {
	        	var val = $("#myDate").val();
	        	alert($('#myDate').val().length + "am I set " + val );
	        	// var thisCalendar = $(this);
	            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
	            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
	            var stpd = month + year;
	            alert("focus click"  +  stpd);
	            if ( $('#myDate').val().length  > 2) {
	            	
					alert("update");	  
					thisCalendar.datepicker('setDate', null);
					thisCalendar.datepicker('setDate', new Date(year, month, 1));
	            } else {
	            	
	            	alert("not updating, setting new value");	         
	            	thisCalendar.datepicker('setDate', new Date(year, month, 1));
	            }
	           
	           
	            
	        });
	    });*/

	
	   /* $('.date-picker').datepicker( {
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        dateFormat: 'MM yy',
	        onClose: function(dateText, inst) { 
	            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
	            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
	            $(this).datepicker('setDate', null);

	            $(this).datepicker('setDate', new Date(year, month, 1));
	        }
	    });*/
	
	 //   $(".date-picker").datepicker({
		 $(".date-picker").datepicker({
	        changeMonth: true,
	        changeYear: true,
	        dateFormat: "MM yy",
	        showButtonPanel: true,
	        currentText: "This Month",
	        onChangeMonthYear: function (year, month, inst) {
	        	
	        	 var month = $(".ui-datepicker-month :selected").val();
		            var year = $(".ui-datepicker-year :selected").val();
	            $(this).val($.datepicker.formatDate('yy-mm', new Date(year, month - 1, 1)));
	        },
	        onClose: function(dateText, inst) {
	            var month = $(".ui-datepicker-month :selected").val();
	            var year = $(".ui-datepicker-year :selected").val();
	            $(this).val($.datepicker.formatDate('yy-mm', new Date(year, month, 1)));
	        }
	    }).focus(function () {
	        $(".ui-datepicker-calendar").hide();
	    }).after(
	        $("<a class=one href='javascript: void(0);'>CLEAR</a>").click(function() {
	            $(this).prev().val('');
	        })
	    );
	    
	    
	    
	    
	    
	    
	    
	    
	//$("#tabs").tabs();
	 $("#main").removeAttr('disabled');
     $('#main').show();
	//$("#tt").tablesorter();
	/*var password = "admin";
	msg = ""
    var x = prompt("Enter in the password");
	
	if (!(x)){
		window.location='mainPage.jsp';
	} else if (x.toLowerCase() == password) {
      // alert("Come right in \n \n You've entered in the right password");
       $("#main").removeAttr('disabled');
       $('#main').show()
   
   }
else {
	 alert(" You've entered in the wrong password");
	 window.location='mainPage.jsp';
}*/
	
//$( "#tabs" ).tabs();
$('#tabs').tabs({
   
 });

/*$("#somemenu li").on("click", function() {
	 alert(this.id);
	 
	});*/

//$("input[type='button']").click(function() {
$("#somemenu li").on("click", function() {
//	$("#somemenu li a").click(function() {
   //var vsql = 'default value'; // or add a default in the switch
  
   var myDate =  $("#myDate").val().toUpperCase() ;
   myDate = myDate.replace(/ /g, '');
   alert(myDate);
   switch(this.id) {
     case 'alld':
    	 $(this).css("color", "white");  
    	 $('#spinner').show();
    	 var sql ="select nvl(priority,'none') priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,nvl(d.fname,'none') fname,nvl(d.rdate,'none') rdate,d.add_time,nvl((aa.alll),'no update')full_list ";
    	 sql = sql + " ,trim(to_char(to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM'))  MonthYear "  ;
    	 sql = sql + " from msr_data_p d ";
    	 sql = sql + "left join (SELECT ticket_no, "  ;
    	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
    	 sql = sql + " FROM msr_assign_p group by ticket_no) ";
    	 sql = sql + "aa on aa.ticket_no=d.ticket_no  ";
    	// sql = sql + " and trim(to_char(to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'MONTHYYYY')) like 'SEPTEMBER%2013'"
    	sql = sql + " where REPLACE(trim(to_char(to_date(d.add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') ),chr(32), '') = '" + myDate  + "'";
    	
    	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
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
    	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,nvl(d.rdate,'none') rdate,d.add_time,nvl((aa.alll),'none')full_list ";
    	 sql = sql + " ,trim(to_char(to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM'))  MonthYear "  ;
    	 sql = sql + " from msr_data_p d ";
    	 sql = sql + "left join (SELECT ticket_no, "  ;
    	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
    	 sql = sql + " FROM msr_assign_p group by ticket_no) ";
    	 sql = sql + "aa on aa.ticket_no=d.ticket_no where not regexp_like(aa.alll, 'Completed|none|Rejected')";
    	 sql = sql + " and REPLACE(trim(to_char(to_date(d.add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') ),chr(32), '') = '" + myDate  + "'";
    	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
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
	 	 
    	 var sql = "select d.priority,case when d.priority is null then t2.priority else d.priority End as priority, d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,nvl(d.rdate,'none') rdate,d.add_time, ";
         sql = sql + " CASE WHEN t2.ticket_no IS NULL THEN 'Unassigned' ELSE 'Error' END AS full_list" ;
         sql = sql + "  FROM msr_data_f d " ;
         sql = sql + " LEFT JOIN msr_assign_f t2 ON t2.ticket_no  = d.ticket_no " ;
         sql = sql + " where t2.ticket_no IS NULL ";

    	 
         $('#spinner').show();
    	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
    	 posting.done(function( data ) {   
    		 
    			  // alert("retrieving data");
    			   $("#tableWrap").empty().append(data); 
    			 //  $('#tableWrap').toggle('slow', function() {
    			 
    		    //	});
    			 
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
         
         
         
 case 'rejected':
	  $('#spinner').show();
    	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,nvl(d.rdate,'none') rdate,d.add_time,nvl((aa.alll),'none')full_list ";
    	 sql = sql + " ,trim(to_char(to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM'))  MonthYear "  ;
    	 sql = sql + " from msr_data_p d ";
    	 sql = sql + "left join (SELECT ticket_no, "  ;
    	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
    	 sql = sql + " FROM msr_assign_p p group by ticket_no) ";
    	 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Rejected')";
    	 sql = sql + " and REPLACE(trim(to_char(to_date(d.add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') ),chr(32), '') ='" + myDate  + "'";
    	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
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
	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,nvl(d.rdate,'none') rdate,d.add_time,nvl((aa.alll),'none')full_list ";
	 sql = sql + " ,trim(to_char(to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM'))  MonthYear "  ;
	 sql = sql + " from msr_data_p d ";
	 sql = sql + "left join (SELECT ticket_no, "  ;
	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
	 sql = sql + " FROM msr_assign_p p group by ticket_no) ";
	 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Completed')";
	sql = sql + " and REPLACE(trim(to_char(to_date(d.add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') ),chr(32), '') = '" + myDate  + "'";
	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
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
     
     
 case 'Mycompleted':
	  $('#spinner').show();
	 var n = "<%=request.getAttribute("hello").toString()%>";
	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,nvl(d.rdate,'none') rdate,d.add_time,nvl((aa.alll),'none')full_list ";
	 sql = sql + " ,trim(to_char(to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM'))  MonthYear "  ;
	 sql = sql + " from msr_data_p d ";
	 sql = sql + "left join (SELECT ticket_no, "  ;
	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
	 sql = sql + " FROM msr_assign_p p where Assignee =" + "'" + n + "'" + "group by ticket_no) ";
	 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Completed')";
	 sql = sql + " and REPLACE(trim(to_char(to_date(d.add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') ),chr(32), '') =  '" + myDate  + "'";
	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
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
            
     
 case 'Myrejected':
	 var n = "<%=request.getAttribute("hello").toString()%>";
	  $('#spinner').show();
	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,nvl(d.rdate,'none') rdate,d.add_time,nvl((aa.alll),'none')full_list ";
	 sql = sql + " from msr_data_p d ";
	 sql = sql + "left join (SELECT ticket_no, "  ;
	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
	 sql = sql + " FROM msr_assign_p p where Assignee =" + "'" + n + "'" + "group by ticket_no) ";
	 sql = sql + "aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Rejected')";
	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
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
            
 case 'Myassigned':
	 var n = "<%=request.getAttribute("hello").toString()%>";
	  $('#spinner').show();
	 var sql ="select priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,nvl(d.rdate,'none') rdate,d.add_time,nvl((aa.alll),'none')full_list ";
	 sql = sql + " ,trim(to_char(to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM'))  MonthYear "  ;
	 sql = sql + " from msr_data_p d ";
	 sql = sql + "left join (SELECT ticket_no, "  ;
	 sql = sql + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
	 sql = sql + " FROM msr_assign_p p where Assignee =" + "'" + n + "'" + "group by ticket_no) ";
	 sql = sql + "aa on aa.ticket_no=d.ticket_no where not regexp_like(aa.alll, 'Completed|none|Rejected')";
	 sql = sql + " and REPLACE(trim(to_char(to_date(d.add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') ),chr(32), '') = '" + myDate  + "'";
	 var posting = $.post("newReportQuery2_p.jsp", {sql : sql});
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
         
   } // switch
   
   
 


 });


    
$( ".date-picker" ).datepicker();




});




</script>
<script>
$(function() {
	

   
});

</script>
</head>
<body >

<div id = main style="display:none">
<img  src='Coll_Logo.png' align=left alt='My image' />
<h1>Parametric Test Summary Page</h1>
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
<!--   <div style="height: auto;overflow: hidden;">
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

</div>-->
  <label for="myDate">Date :</label>
  <input name="myDate" id="myDate" class="date-picker" />
  <!--  <label for="assignee">Assignee :</label>
  <input name="assignee" id="assignee" /> -->
  
<div id="tabs">
    <ul id="somemenu">
        <li id="completed"><a href="#fragment-1">completed</a></li>
        <li id="rejected"><a href="#fragment-2">rejected</a></li>
        <li id="assigned"><a href="#fragment-3">assigned</a></li>
        <li id="alld"><a href="#fragment-4">All Status</a></li>
        <li id="Mycompleted"><a href="#fragment-5">Icompleted</a></li>
        <li id="Myrejected"><a href="#fragment-6">Irejected</a></li>
        <li id="Myasssigned"><a href="#fragment-7">Iassigned</a></li>
    </ul>
</div>   

</form>
</div>
<div id="spinner" class="spinner" style="display:none;">
    <img id="img-spinner" src="ajax-loader.gif" alt="Loading"/>
</div>
<div id="tableWrap" align=center >

</div>


</body>
</html>
