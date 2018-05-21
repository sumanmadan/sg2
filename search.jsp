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

<style>
table, td, th
{
border:1px solid green;
border-collapse:collapse;
}
th
{
background-color:green;
color:white;
}



td.fixed-width {
    
   /* background-color:#b0e0e6;*/
    max-width: 100%;
   /* max-width:100%;
    min-width:100%;*/
    white-space: nowrap;
    white-space: pre;
    text-align: center;
	padding: 10px;
    
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
width:120px;
font-weight:bold;
color:#FFFFFF;
background-color:#98bf21;
text-align:center;
padding:4px;
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
width:60px;
}

.stitched {
   padding: 5px;
   margin: 10px;
   background: #ff0030;
   color: #fff;
   font-size: 21px;
   font-weight: bold;
   line-height: 1.3em;
   border: 2px dashed #fff;
   border-radius: 10px;
   box-shadow: 0 0 0 4px #ff0030, 2px 1px 6px 4px rgba(10, 10, 0, 0.5);
   text-shadow: -1px -1px #aa3030;
   font-weight: normal;
   
}

body {
  text-align: center;
 }

#page-wrap {
  text-align: left;
  width: 800px;
  margin: 0 auto;
}

button.balagade {
position : bottom;
width:150px;
padding: 10px 20px 11px !important;
font-size: 16px !important;
background-color: #ff0030;
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
	
	$("form").submit( function () {
		event.preventDefault();
		return false;
    });
	


    $("#searchb").click( function()
       {
    	var v = $('#searchtext').val();
         alert('button clicked' + v );
         var posting = $.post("searchFun.jsp", {pdt : v});
         posting.done(function( data ) { 
        	alert("gosh 3 " + data);
        	//$('#dropdownp').empty().append(data);  
        	$('#dropdownp').html(data);
           // $('#dropdownp').show();
         
         });
         
       }
    );


		  
	
});


</script>
</head>


<body>

<div class ="page-wrap">
<form id="searchbox" name= "searchbox">
    <input type="text" name = "searchtext" id = "searchtext" placeholder="enter your email address.." class="stitched" style="width:500px" />
    <br>
    <button type=button id="searchb" name="searchb" class="balagade"> Search</button>
</form>
</div>
<br><br>
<div id = dropdownp name =dropdownp>
<table id="tt" name = "tt">

</table>
</div>


</body>
</html>
