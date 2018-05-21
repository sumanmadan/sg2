<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<!--  Suman Bharadwaj, Dec 2014
      This is for the web analysis stuff
-->

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge;IE=9">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" 	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script type="text/javascript"	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script type="text/javascript"	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript"	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<link rel="stylesheet" 	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" href="css/smoothness/jquery-ui-1.10.3.custom.css" />
<style type="text/css" title="currentStyle">
@import "css/demo_page.css";

@import "css/demo_table_jui.css";

@import "css/jquery-ui-1.8.4.custom.css";
</style>

<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/highcharts-more.js"></script>
<script type="text/javascript" src="js/exporting.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/view.js"></script>


<title>Web Analysis Tool</title>

<style>



body {
font: 100% Verdana, Arial, Helvetica, sans-serif;
background: white;
margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
text-align: center; /* this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector */


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
      changeYear: true
 });
	


$("#datepicker2").datepicker({
	  changeMonth: true,
      changeYear: true
});
	


$("#run").click(function() {
	alert( $( "#tech option:selected" ).text());
	$("#f1").submit();

	
});


});



</script>


</head>

<body>

<form id="f1" name="f1" method="post" action="preports.jsp" target=_blank>

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

</form>

<div id="tableWrap" align=center >

</div>





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
<input id="run" type="button" value="Run Report" />
</div>
</td>

</tr>


</table>



</form>
</div>
<input type=text id=uname name =uname style="display:none" value=<%=request.getAttribute("hello").toString() %> />
<!--  <input type=text id=user_agent name=user_agent style="display:none" value= request.getHeader("User-Agent").toString() /> -->


</body>
</html>
