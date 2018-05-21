<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1; Content-Disposition; attachment; filename="blah.xls"  >
<meta http-equiv="Content-type" content="application/x-www-form-urlencoded; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=9" />


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

<head>
<style type="text/css">

body {
font: 100% Verdana, Arial, Helvetica, sans-serif;
background: #666666;
margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
text-align: center; /* this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector */
color: #000000;
}


p { font-size:150%; }

.oneColLiqCtr #container {
width: 100%; /* this will create a container 80% of the browser width */
background: #FFFFFF;
margin: 0 auto; /* the auto margins (in conjunction with a width) center the page */
border: 1px solid #000000;
text-align: left; /* this overrides the text-align: center on the body element. */
}
.oneColLiqCtr #mainContent {
padding: 0 20px; /* remember that padding is the space inside the div box and margin is the space outside the div box */
}


.stitched {
   padding: 5px;
   margin: 10px;
   background: #ff0030;
   color: #fff;
   font-size: 12px;
   font-weight: bold;
   line-height: 1.3em;
   border: 2px dashed #fff;
   border-radius: 5px;
   box-shadow: 0 0 0 4px #ff0030, 2px 1px 6px 4px rgba(10, 10, 0, 0.5);
   text-shadow: -1px -1px #aa3030;
   font-weight: normal;
   
}


.balagade {
position : bottom;
width:15%;
padding: 10px 20px 11px !important;
font-size: 100% !important;
background-color: #ff0030;
font-weight: bold;
text-shadow: 1px 1px #F36C8C;
color: black;
border-radius: 20%;
-moz-border-radius: 30%;
-webkit-border-radius: 30%;
border: 1px solid #F36C8C;
cursor: pointer;
box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;
-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;
-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5) inset;
border: 1px solid #f0eed9




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

width:10%;
font-weight:bold;
text-align:center;
padding:4px;
text-decoration:none;
text-transform:uppercase;
}
a:hover,a:active
{
background-color:lightYellow;
}
a
{
width:10%;
}





</style>







<script>



$( document ).ready( function() {
	
	$("form").submit( function () {
		event.preventDefault();
		return false;
    });
	


    $("#searchb").click( function()
       {
    	var v = $('#searchtext').val();
        // alert('button clicked' + v );
         var posting = $.post("searchPar.jsp", {pdt : v});
         posting.done(function( data ) { 
        	//alert("gosh 3 " + data);
        	//$('#dropdownp').empty().append(data);  
        	$('#mainContent').html(data);
           // $('#dropdownp').show();
         
         });
         
       }
    );

    $("#searchbb").click( function()
    	       {
    	    	var v = $('#searchtextt').val();
    	        // alert('button clicked' + v );
    	         var posting = $.post("searchParTicket.jsp", {pdt : v});
    	         posting.done(function( data ) { 
    	        	//alert("gosh 3 " + data);
    	        	//$('#dropdownp').empty().append(data);  
    	        	$('#mainContent').html(data);
    	           // $('#dropdownp').show();
    	         
    	         });
    	         
    	       }
    	    );
		  
	
});


</script>

</head>


<body class="oneColLiqCtr">

<div id="container">
<h4>Welcome :<%=request.getAttribute("hello") %></h4>
<h2> Parametric Test Request System </h2>
<p><i> View Requests by </i></p>
<br>
<hr>
<form id="searchbox" name= "searchbox">
    <p>1) Enter Email Address </p>
    <input type="text" name = "searchtext" id = "searchtext" placeholder="enter your email address.." class="stitched" style="width:500px" />
    <button type=button id="searchb" name="searchb" class="balagade"> Search</button>
    <br>
    <p> OR </p>
    <p>2) Enter Ticket# </p>
     <input type="text" name = "searchtextt" id = "searchtextt" placeholder="enter your Ticket#" class="stitched" style="width:200px" />
    <button type=button id="searchbb" name="searchbb" class="balagade"> Go</button>
</form>
</div>
<br><br>
<div id="mainContent">
 
<table id="tt" name = "tt">

</table>


</div>
<li><a href="mainPage.jsp" target=_blank> Back to Main Menu </a></li>
</div>
</body>
</html>