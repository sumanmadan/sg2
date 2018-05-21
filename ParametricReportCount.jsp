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


<script>


$( document ).ready( function() {
var globalChk="Yes";
$("input[type='button']").click(function() {
	   
	   switch(this.id) {
	   
	     case 'alld':
	    	 $("#tableWrap").empty();
	    	 $("#container").empty();
	    	  $('#spinner').show();
	    	 globalChk="yes";
	    	 var sql =" select to_char( " +
	    			 " to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') as mmyy, " +
	    			 " count(*) as mmyycount from msr_data_p " +
	    			 " group by to_char( " +
	    			 " to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') "  +
	    			 " order by to_char( " +
	    			 " to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') "  ;
	    	 
	    	 var posting = $.post("newReportQuery2_p_count.jsp", {sql : sql});
	    	
	    	 posting.done(function( data ) {  

  			  $("#tableWrap").empty().append(data); 
  			
  			 if (  $('#tableWrap #pt tbody tr').length > 0) {
				   $('#spinner').hide();
  			 
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
  				 
  	
	    	   
  		   x();
	 			
	    });
	    
	    	 
	    break;
	     case 'assigned':
	    	 $("#tableWrap").empty();
	    	 $("#container").empty();
	    	 $('#spinner').show();
	    	 globalChk="Yes";
	    		var sql = " select to_char( " + 
				   " to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') as mmyy, count(*) as mmyycount from msr_data_p d " + 
				    " left join " + 
					" (SELECT ticket_no, " +   
					" rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " +     
					" FROM msr_assign_p group by ticket_no) " + 
				    " aa on aa.ticket_no=d.ticket_no where not regexp_like(aa.alll, 'Completed|none|Rejected') " + 
					" group by to_char( " +  
					" to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') " +  
		     	    " order by to_char( "  + 
		     	   " to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') "; 
	    		
		 var posting = $.post("newReportQuery2_p_count.jsp", {sql : sql});
		 posting.done(function( data ) {  

 			  $("#tableWrap").empty().append(data); 
	    		
 			 if (  $('#tableWrap #pt tbody tr').length > 0) {
				 
 				   $('#spinner').hide();
			    
				 
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
 				 
 	
	    	   
	    	 x(); 
	 			
	    	 });
	    
	    	 
	    	break;
	       
	     case 'unassigned':
	    	 $("#tableWrap").empty();
	    	 $("#container").empty();
	    	 $('#spinner').show();
	    	 globalChk="Yes";
	    		var sql = " select to_char( " + 
				   " to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') as mmyy, count(*) as mmyycount  " + 
				
	    		   " from msr_data_p d " + 
				    " left join msr_assign_p t2 ON t2.ticket_no  = d.ticket_no  " + 
				    " where t2.ticket_no IS NULL " +
					" group by to_char( " +  
					" to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') " +  
		     	    " order by to_char( "  + 
		     	   " to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') "; 
		 var posting = $.post("newReportQuery2_p_count.jsp", {sql : sql});
		 posting.done(function( data ) {  

 			  $("#tableWrap").empty().append(data); 
	    		
 			 if (  $('#tableWrap #pt tbody tr').length > 0) {
					 
 		    	 $('#spinner').hide();
 		    	
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
 				 
 	
	    	   
	    	  x();
	 			
	    	 });
	    
	    	 
	    	break;
	case 'rejected':
		 $("#tableWrap").empty();
		 $("#container").empty();
		 $('#spinner').show();
		 globalChk="Yes";
		var sql = " select to_char( " + 
		   " to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') as mmyy, count(*) as mmyycount from msr_data_p d " + 
		    " left join " + 
			" (SELECT ticket_no, " +   
			" rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " +     
			" FROM msr_assign_p group by ticket_no) " + 
		    " aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Rejected') " + 
			" group by to_char( " +  
			" to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') " +  
  	    " order by to_char( "  + 
  	   " to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') "; 
var posting = $.post("newReportQuery2_p_count.jsp", {sql : sql});
posting.done(function( data ) {  

	  $("#tableWrap").empty().append(data); 
		
	 if (  $('#tableWrap #pt tbody tr').length > 0) {
		 
		
    	 $('#spinner').hide();
		 
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
		 

	   
	 x();
		
	 });

	 
	break;
	         
	       
	 case 'completed':
		$("#tableWrap").empty();
		$("#container").empty();
		$('#spinner').show();
		globalChk="Yes";
		var sql = " select to_char( " + 
				   " to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') as mmyy, count(*) as mmyycount from msr_data_p d " + 
				    " left join " + 
					" (SELECT ticket_no, " +   
					" rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " +     
					" FROM msr_assign_p group by ticket_no) " + 
				    " aa on aa.ticket_no=d.ticket_no where regexp_like(aa.alll, 'Completed') " + 
					" group by to_char( " +  
					" to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') " +  
		     	    " order by to_char( "  + 
		     	   " to_date(add_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') "; 
		 var posting = $.post("newReportQuery2_p_count.jsp", {sql : sql});
		 posting.done(function( data ) {  

 			 $("#tableWrap").empty().append(data); 
 			
 			 if (  $('#tableWrap #pt tbody tr').length > 0) {
				 				
 		    	 $('#spinner').hide();
 		    				 
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
 				 
 	
	    	   
	    	  x();
	 			
	    	 });
	    
	    	 
	    	break;
	   
	 case 'PerMonth':
		 var n = "<%=request.getAttribute("hello").toString()%>";
		 $("#tableWrap").empty();
	     $("#container").empty();
    	 $('#spinner').show();
		 globalChk = "Yes";
		 var sql = "select xx.mmyy ,max(decode(xx.AA,xx.AA, xx.AA)) Assigned ,max(decode(xx.BB,xx.BB, xx.BB)) Rejected " ;
		 sql = sql + " ,max(decode(xx.CC,xx.CC, xx.CC)) Closed " ;
		 sql = sql + " ,max(decode(xx.DD,xx.DD, xx.DD)) Total " ;
		 sql = sql + " from  ( select  "  ;
		 sql = sql + "count(case when status = 'Assigned' then 1 end) as AA,";
		 sql = sql + " count(case when status = 'Rejected' then 1  end) as BB,";
		 sql = sql + " count(case when status = 'Completed' then 1 end) as CC, " ;
		 sql = sql + "count(distinct ticket_no) as DD,  " ;
		 sql = sql + "to_char(  to_date(updated_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM') as mmyy " ;
		 sql = sql + " from msr_assign_p mm ";
		 sql = sql + "group by to_char(  to_date(updated_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM'),status  "
         sql = sql + " ) xx  group by xx.mmyy order by xx.mmyy ";
		 
		 
		 var posting = $.post("newReportQuery2_p_countPivot.jsp", {sql : sql});
		 posting.done(function( data ) {   
			 				   $("#tableWrap").empty().append(data); 
			 				   
			 				  if (  $('#tableWrap #pt tbody tr').length > 0) {
			 					 
			 				
			 			    	
			 			    	 $('#spinner').hide();
			 			    	 
			 					 
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
			 				   
			 x();				   
		 
		 });
		 
		 
	
		 
	    break;
	    
	 case 'PerMonthPerWeek':
		 $("#tableWrap").empty();
		 $("#container").empty();
		 
		 $("#container").empty();
    
    	 $('#spinner').show();
		 
		 globalChk="Yes";
		 var n = "<%=request.getAttribute("hello").toString()%>";
		 var sql = "select xx.mmyy ,max(decode(xx.AA,xx.AA, xx.AA)) Assigned ,max(decode(xx.BB,xx.BB, xx.BB)) Rejected " ;
		 sql = sql + " ,max(decode(xx.CC,xx.CC, xx.CC)) Closed " ;
		 sql = sql + " ,max(decode(xx.DD,xx.DD, xx.DD)) Total " ;
		 sql = sql + " from  ( select  "  ;
		 sql = sql + "count(case when status = 'Assigned' then 1 end) as AA,";
		 sql = sql + " count(case when status = 'Rejected' then 1  end) as BB,";
		 sql = sql + " count(case when status = 'Completed' then 1 end) as CC, " ;
		 sql = sql + "count(distinct ticket_no) as DD,  " ;
		 sql = sql + "to_char(  to_date(updated_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM WW') as mmyy " ;
		 sql = sql + " from msr_assign_p mm ";
		 sql = sql + "group by to_char(  to_date(updated_time,'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM WW'),status  "
         sql = sql + " ) xx  group by xx.mmyy order by xx.mmyy desc";
		 
		 
		 var posting = $.post("newReportQuery2_p_countPivot.jsp", {sql : sql});
		 posting.done(function( data ) {   
			 				   $("#tableWrap").empty().append(data); 
			 				   
			 				  if (  $('#tableWrap #pt tbody tr').length > 0) {
			 					 
			 					
			 			    	 $('#spinner').hide();
			 			    	
			 					 
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
			 				   
			 	x();			   
		 
		 });
	     break;
	            
	 case 'TimeTaken':
		 globalChk = "No";
		 $("#tableWrap").empty();
		 $("#container").empty();
		 $('#spinner').show();
		 var sql = " Select ticket_no,start_date, end_date " + 
		  " ,TRUNC(to_date(end_date)-to_date(start_date)) as dd " + 
		  " ,TRUNC(MOD(to_date(end_date) - to_date(start_date),1)*24) as hh " + 
		  " ,TRUNC(MOD(MOD(to_date(end_date) - to_date(start_date),1)*24,1)*60) as  mm " + 
		 " ,TRUNC(MOD(MOD(MOD(to_date(end_date)-to_date(start_date),1)*24,1)*60,1)*60) as ss " + 
		// sql = " ,(to_date(end_date) - to_date(start_date))*1440 " + 
		 " from  ( " + 
		 " Select  " + 
		" ticket_no, " + 
		" max(to_char(  to_date(updated_time,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'))end_date " + 
		 ", min(to_char(  to_date(updated_time,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'))  start_date " +
        " from msr_assign_p group by ticket_no 	) ";
		 
		 
		 var posting = $.post("newReportQuery2_p_time.jsp", {sql : sql});
		 posting.done(function( data ) {   
			 				  $("#tableWrap").empty().append(data); 
			 				 
			 				  if (  $('#tableWrap #pt tbody tr').length > 0) {
			 					
			 				
			 			    	 $('#spinner').hide();
			 			       	
			 					 
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
	     
	 case 'drawC':
		 
		// $('#tableWrap').html($('#pt').clone().attr('id', 'datatable'));
	    if ( globalChk == "No") {
	    	 alert ( " No chart for Time Series");
	    } else {
		 Highcharts.visualize = function (table, options) {
			    // the categories
				var sliceNames = [];
				$('tbody th', table).each(function (i) 
				{
			    	sliceNames.push(this.innerHTML);
				});

			
		        // the categories
		        options.xAxis.categories = [];
		        $('tbody th', table).each( function(i) {
		            options.xAxis.categories.push(this.innerHTML);
		        });
				
			    // the data series
			  options.series = [];
			    $('tr', table).each(function (i) {
			        var tr = this;
			        $('th, td', tr).each(function (j) {
			            if (j > 0) { // skip first column
			                if (i == 0) { // get the name and init the series
			                    options.series[j - 1] = {
			                        name: this.innerHTML,
			                        data: []
			                    };
			                } else { // add values
			                   // options.series[j - 1].data.push({name: sliceNames[i - 1], y: parseFloat(this.innerHTML)});
			                	 options.series[j - 1].data.push(parseFloat(this.innerHTML));
			                }
			            }
			            if ( j == 0 && i > 0)    	 options.xAxis.categories.push(this.innerHTML);
			            
			        });
			    });
			    
			    
			
  
			    
			    

			    var chart = new Highcharts.Chart(options);
			}

			var table = document.getElementById('pt'),
			    options = {
			        chart: {
			            renderTo: 'container',
			            type: 'column',
			            zoomType: 'x'
			        },
			        title: {
			            text: 'Data extracted from a HTML table in the page'
			        },
			        xAxis: {
			        	
			        	
			        },
			        yAxis: {
			            title: {
			                text: 'Units'
			            }
			        },
			        tooltip: {
			            formatter: function () {
			                return '<b>' + this.series.name + '</b><br/>' + this.y + ' ' + this.point.name;
			            }
			        },
			        plotOptions: {
			            pie: {
			                allowPointSelect: true,
			                cursor: 'pointer',
			                dataLabels: {
			                    enabled: true,
			                    color: '#000000',
			                    connectorColor: '#000000',
			                    formatter: function () {
			                        return '<b>' + this.point.name + '</b>: ' + this.percentage + ' %';
			                    }
			                }
			            }
			        }
			    };

			Highcharts.visualize(table, options);
	    }
			
	 break;
  
	     
	}
	   
	  // alert("now...");
	  // x();
	
	  
});
    


});

</script>

<script>
function x(){

	 Highcharts.visualize = function (table, options) {
		    // the categories
			var sliceNames = [];
			$('tbody th', table).each(function (i) 
			{
		    	sliceNames.push(this.innerHTML);
			});

		
	        // the categories
	        options.xAxis.categories = [];
	        $('tbody th', table).each( function(i) {
	            options.xAxis.categories.push(this.innerHTML);
	        });
			
		    // the data series
		  options.series = [];
		    $('tr', table).each(function (i) {
		        var tr = this;
		        $('th, td', tr).each(function (j) {
		            if (j > 0) { // skip first column
		                if (i == 0) { // get the name and init the series
		                    options.series[j - 1] = {
		                        name: this.innerHTML,
		                        data: []
		                    };
		                } else { // add values
		                   // options.series[j - 1].data.push({name: sliceNames[i - 1], y: parseFloat(this.innerHTML)});
		                	 options.series[j - 1].data.push(parseFloat(this.innerHTML));
		                }
		            }
		            if ( j == 0 && i > 0)    	 options.xAxis.categories.push(this.innerHTML);
		            
		        });
		    });
		    
		    
		

		    
		    

		    var chart = new Highcharts.Chart(options);
		}

		var table = document.getElementById('pt'),
		    options = {
		        chart: {
		            renderTo: 'container',
		            type: 'column'
		        },
		        title: {
		            text: 'Data extracted from a HTML table in the page'
		        },
		        xAxis: {
		        	
		        	
		        },
		        yAxis: {
		            title: {
		                text: 'Units'
		            }
		        },
		       /* tooltip: {
		            formatter: function () {
		                return '<b>' + this.series.name + '</b><br/>' + this.y + ' ' + this.point.name;
		            }
		        },
		     plotOptions: {
		            pie: {
		            	stacking: 'normal',
		                allowPointSelect: true,
		                cursor: 'pointer',
		                dataLabels: {
		                    enabled: true,
		                    color: '#000000',
		                    connectorColor: '#000000',
		                    formatter: function () {
		                        return '<b>' + this.point.name + '</b>: ' + this.percentage + ' %';
		                    }
		                }
		            }
		        }*/
		        
		        
		        tooltip: {
		            formatter: function () {
		                return '<b>' + this.x + '</b><br/>' +
		                    this.series.name + ': ' + this.y + '<br/>' +
		                    'Total: ' + this.point.stackTotal;
		            }
		        },
		        plotOptions: {
		            column: {
		                stacking: 'normal',
		                dataLabels: {
		                    enabled: true,
		                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
		                    style: {
		                        textShadow: '0 0 3px black, 0 0 3px black'
		                    }
		                }
		            }
		        }
		        
		    };

		Highcharts.visualize(table, options);

	
	
	
}


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

<form id="f1" >
<div style="height: auto;overflow: hidden;">

<input type=button id="completed" name="completed" value="closed" class="btype">
<input type=button id="rejected" name="rejected" value="rejected" class="btype">
<input type=button id="assigned" name="asssigned" value="assigned" class="btype">
<input type=button id="unassigned" name="unassigned" value="unassigned" class="btype">
<input type=button id="alld" name="alld" value="All" class="btype">


<br>

<input type=button id="PerMonth" name="PerMonth" value="PerMonth" class="btype">
<input type=button id="PerMonthPerWeek" name="PerMonthPerWeek" value="PerMonthPerWeek" class="btype">
<input type=button id="TimeTaken" name="TimeTaken" value="TimeTaken" class="btype">

</div>
<input type=button id="drawC" name="drawC" value="Refresh Chart" class="btype">
<!--  <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>-->
<div id="spinner" class="spinner" style="display:none;">
    <img id="img-spinner" src="ajax-loader.gif" alt="Loading"/>
</div>
<div id="container">


</div>
<div id="tableWrap" name="tableWrap">
<table id = "pt" name="pt">


</table>
</div>


</body>
</html>