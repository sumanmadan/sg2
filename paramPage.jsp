<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.*" %>

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
<title>TRS</title>
<base target="main">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

  
<script>
$( document ).ready( function() {
	
	$("form").submit( function () {
		event.preventDefault();
		return false;
    });
	
  $('#dropdownt').bind('change', function() {
       	 
 	}); 
  
  
	
	//this is to get the tech from msr_techprd
	var ql = "select distinct trim(tech) from msr_techprd";
    var posting = $.post("getP_var1.jsp", {tech : ql});
    posting.done(function( data ) {   
    	  $("#dropdownt").empty().append(data); 
    });
    
    //this is for the dependent dropdown (tech=>product)
    $("#dropdownt").change(function()  {
 		// $("#dropdownp").show();
 		 $("#dropdownt").css('border', 'None');
 		 $("#dropdownp").css('border', 'None');
 		 var mb = $('#dropdownt option:selected').text();
 		 //alert("gosh  " + mb);
 	     //var ssql = "select product from msr_techprd where tech like " +"'" +mb+ "%'";
 	     //var ssql = "select product from msr_techprd where tech like" + "'" + mb +"%'";
 	     //alert("gosh 2  " + mb);
 	     var posting = $.post("getPP.jsp", {pdt : mb});
         posting.done(function( data ) { 
        	// alert("gosh 3 " + data);
              $('#dropdownp').empty().append(data);  
              //$('#dropdownp').html(data);
        	 //$('#dropdownp').append(data);
          	$('#dropdownp').show();
         });
      });  

    
    //this is for the display of metal layer.
   // $("#dropdownp").change(function() { dropDown($('#dropdownp').val()) }  );
    $('#dropdownp').bind('change', function() {
    	 
	}); 
    
	var posting = $.post("getMetal.jsp");
    posting.done(function( data ) {   
    	  $("#dropdownl").empty().append(data); 
    });

    //this is for the datepicker dates
    $("#datepicker1").datepicker({
  		 minDate: 0  ,
  		 dateFormat: 'yy-mm-dd', yearRange: '2013:2013'
  		
  		 
  	 });

    //What happens when you click the save button - some validataions
    
    $("#ss").click(function()   {
    	
  // if (isNaN($("#temp").val())) {
  //             alert("You must enter a number for temperature.");
  //             return false;
  //      } 
      	 
      	 if ($('input[type=checkbox]').is(':checked')){
      	  //nothing
      	 } else {
      	   alert("Atleast check one checkbox for wafer selection") ;
      	 }
        var p1 = $('#dropdownt').find('select[name="tech"]').val().length;
        var p2 = $('#dropdownp').find('select[name="pdt"]').val();
        var p3 = $('#dropdownl').find('select[name="metal"]').val().length;
       if ( p2 === null) {
          	 empty_o=0;
          	 alert("Chose a technology and product since product is " + p2);
          	 $("#dropdownp").css('border', '3px solid red');  
           }

        if (p1 === 1) {
          	 empty_o=0;
          	 $("#dropdownt").css('border', '3px solid red');
             $("#dropdownp").css('border', '3px solid red');  
        } else {
          	 empty_o=1;
        }
         
          
     /*  No Validation required --  $("input[type=text]").each(function() {
          
       	   if($(this).val() === "") {
       	    	if( (  $(this).attr("id") ) =='ticketno'){
       	    	//nothing
             	} else 	if( (  $(this).attr("id") ) =='lot'){
       	    	//nothing
             	} else {
             	 $(this).attr('style', 'border-color:#FF0000;'); 
             	 empty_t=0;
             	}
       	   }else {
       		  $(this).removeAttr('style');
       		  empty_t=1;
       	   }
       	    	
       	    	
        }); */
    
         
     // if ( empty_o===1  && empty_t===1) {
    if ( empty_o===1 ) {
        $('#gogo').removeAttr("disabled");
      }
           
  
});
    
    
    $("#gogo").click(function()   {
    	
    	alert("Saving data");
    	 $("#f1").submit();
    	
    });

    $("#tid #checkall").click(function(){
       
    	if(this.checked) {
            // Iterate each checkbox
            $(':checkbox').each(function() {
                this.checked = true;                        
            });
        }
    	
    	
    	if(!this.checked) {
            // Iterate each checkbox
            $(':checkbox').each(function() {
                this.checked = false;                        
            });
        }
       
    });
    
});




</script>



</head>
<body>
<img src="Coll_Logo.png"/>
<h3> <a href="mainPage.jsp"> Back to Main Page </a> </h3>
    <center>
        <h1>Test Request System - New request(Parametric)</h1> </center>
<form id="f1" name = "f1" method=post action=uploadServlet_dev enctype="multipart/form-data"  target=_blank >

<br>
<div id = dropdownt  >
Select Technology <select id = tech name="tech" >
</select>
</div>
<br>
<div id = "dropdownp" >
Select Technology <select id = pdt name="pdt" >
</select>
</div>
 <br>
 <div id = "dropdownl">
<select id = metal name = "metal" >
 </select>
 </div>
  <br>
 
<div id = radio1>

<input type="radio" name="group1" value="para" checked>Parametric
</div>
<br>
<br>

<div id = radio2>
<input type="radio" name="group2" value="prod" checked>PROD
<input type="radio" name="group2" value="erf">ERF
<input type="radio" name="group2" value="othersg2">Others
</div>


<%-- BEOL/CPI/eKerf/Device/SRAM/EFUSE/TSV..others --%>
<br>
<br>
<div id = radio3 >
<input type="radio" name="group3" value="BEOL" checked>BEOL
<input type="radio" name="group3" value="CPI">CPI
<input type="radio" name="group3" value="EKERF">EKERF
<input type="radio" name="group3" value="Device">Device
<input type="radio" name="group3" value="SRAM">SRAM
<input type="radio" name="group3" value="EFUSE">EFUSE
<input type="radio" name="group3" value="TSV">TSV
<input type="radio" name="group3" value="PDF">PDF
<input type="radio" name="group3" value="OTHERSg3">Others
<br>
<br>

</div>




             <table id=tid name=tid border="0">
                  <tr>
                    <td> Others Comment : </td>
                    <td><textarea  name="comment" id = "comment" required rows="4" cols="50"></textarea></td>
                  </tr>
                
                  <tr>
                    <td>Lot Purpose : </td>
                    <td><textarea name = "lotpurpose" id = "lotpurpose" required rows="4" cols="50"></textarea></td>
                </tr>
             
             
                <tr>
                    <td>Lot:(can be blank for parametric testing) </td>
                    <td><input type="text" name="lot" id = "lot" size="50"/></td>
                </tr>
                <tr>
                    <td>Wafer's: </td>
                    <td>
                    <input type="checkbox" id="checkall" name="checkall" value="All">All
                    <c:forEach begin="1" end="25" varStatus="loop">
                    <input type="checkbox" class="c1[]" name="c1[]"  id = "c1[]" value= ${loop.index} > ${loop.index}
                    </c:forEach> 
                   </td>
                </tr>
                
              <!--  <tr>
                    <td>Sampling Per Wafer </td>
                    <td><input type="text" name="sampling" size="50"/></td>
                </tr>
                <tr>
                    <td>Temperature ( in &deg C ): </td>
                    <td><input type="text" name="temp" id = "temp" size="50" class="numberinput"/></td>
                </tr> -->
                
                <tr>
                    <td>Required date: </td>
                    <td><input id="datepicker1" name="rdate" /></td>
                </tr>
                <tr>
                    <td>Attachment: </td>
                    <td><input type="file" name="attach" size="50"/></td>
                </tr>
            </table>
        
</div>


<br>
<!--  
<div id = textb>
Ticket#<input type="text" id="ticketno" name="ticketno" readonly style="display:none;border:none;"/>
</div> -->
<br>
<div id = messageBox> </div>

<button type="button" name = "ss" id = "ss" >Confirm</button>
<button type="button" name = "gogo" id = "gogo"  disabled >GoGo</button>
                        
                

</form>
</center>
</body>
</html>