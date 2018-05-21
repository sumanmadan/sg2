<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.*" %>
<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script src="http://ajax.aspenetcdn.com/ajax/jquery.validation/1.9/jquery.validate.min.js"></script> 
<script src="http://ajax.aspenetcdn.com/ajax/jquery.validate/1.10.0/jquery.validate.js"></script> 
<script src="bootstrap.min.js"></script>


<script>
	$(window).load(function () {
		
   
    var n = "<%=request.getAttribute("hello").toString()%>";
	alert("sdfds" + n );

   	var posting = $.post("LDAPEmailTest.jsp",{cname : n});
        posting.done(function( data ) {   
            alert("d.." + data);
          // document.getElementById('stpd').innerHTML = data;
            $("#estpd").empty().append(data); 
         
                       
           
         });
   	

   }); 
	
	$( document ).ready( function() {
		
           $("#add").click(function()  {
        	   
        	   var wow = $('#recep').val();
        	   alert("wow" + wow);
        	   var posting = $.post("LDAPEmail.jsp",{cname : wow});
               posting.done(function( data ) {   
                  alert("d.." + data);
                 // document.getElementById('stpd').innerHTML = data;
                   $("#estpd").append(data); 
                
                              
                  
                });
        	   
        	   
        	
       	});
		
		
	});
   
</script>
</head>

<body>
<img src="Coll_Logo.png"/>
<h1>Mail To</h1>

<div id = r>
<ul>
<li><a href="mainPage.jsp" target=_blank> Main Menu </a></li>
</ul>
</div>
<br>
<br>
<hr>

<form id="f1" name = "f1">
<h4>Welcome :<%=request.getAttribute("hello") %></h4>

Add Recepient: <input type="text" name="recep" id = "recep" size="50"/>
<button type="button" name = "add" id = "add" >Add email</button>

</form>

<div id = estpd>

</div>


</body>
</html>



