<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<!--  Suman Bharadwaj, Apr-May 2013 
	  This is for the the Test Reqeust System
	  #Jan 2014
	  ###Changes to include the priority
-->


<html>

<head>
<title>TRS</title>
<base target="main">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>

<!--  
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
-->

<script src="jquery.fittext.js"></script>
 
 <style>
 

 
body {
font: 100% Verdana, Arial, Helvetica, sans-serif;
background: #666666;
margin: 2%;  /*it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 2%;
border:none;
text-align: center;  /*this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector*/ 
color: #000000;
font-weight: bold;
}

div.color {
  border-width:3px;
  border-style:solid;
  border-color:#ff9900;
  box-shadow:#888888;
  /*background-color:lightblue;
  box-shadow: 10px 10px 5px #888888;*/
  }



.oneColLiqCtr{
width: 90%; /* this will create a container 80% of the browser width */
background: #FFFFFF;
margin: 0 auto; /* the auto margins (in conjunction with a width) center the page */
border: 1px solid #000000;
text-align: left; /* this overrides the text-align: center on the body element. */
padding:2%;
}

.oneColLiqCtr #main {
    /* overflow to handle inner floating block */
    overflow: hidden;
}

.oneColLiqCtr #formbar {
    float: left;
    width: 70%;
}

.oneColLiqCtr #helpbar {
    float: right;
    width: 30%;
    height : 100%;
    background-size:80px 60px;
    background-repeat:no-repeat;
    
}   

.oneColLiqCtr #helpbar img {
    width: 100%;
    height: 100%;
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
a:hover,a:active
{
background-color:#7A991A;
}
a
{
display:block;
width:60px;
}
td:first-child {



}


.hl {
background: #38ACEC; 
color: #000000;
font-weight: bold;
display:block
}


.focusField
{  
        border:solid 3px #73A6FF;  
        background:#EFF5FF;  
        color:#000;  
}  
.idleField
{  
        background:#EEE;  
        color: #6F6F6F;  
        border: solid 2px #DFDFDF;  
}  


tr.spaceUnder > td
{
  padding-bottom: 2em;
}


p {
  /*border-bottom:1px dotted;*/
  color: blue;
  font-weight: bold;
  
}  

 .spanClass
{
color:red;
font-size:8;
font-style:italic;
font:Arial;
}
</style>
 
<script>

$(window).load(function () {
	
	   
    var n = "<%=request.getAttribute("hello").toString()%>";
   // $("#lloginn").val(n);
	//alert("sdfds" + n );
    
   	var posting = $.post("LDAPEmail.jsp",{cname : n});
        posting.done(function( data ) {   
           //alert("d.." + data);
           // document.getElementById('stpd').innerHTML = data;
            $("#estpd").empty().append(data); 
            var getMail = $('#estpd').text()
            
            //var splitMail = getMail.trim().split("~");
            var splitMail =  getMail.replace(/^\s+/, "").replace(/\s+$/, "").split("~");
            var loginName = splitMail[1].replace(/,/g, "");
           // $("#eemail").val($('#estpd').text().trim());
           $("#eemail").val(splitMail[0]);
           //$("#lloginn").val(splitMail[1]);
           $("#lloginn").val(loginName);
           //$('#eemail').prop('readonly',true);
          // $('#lloginn').prop('readonly',true);
        });              
           
     });
   	

$( document ).ready( function() {
	
	
	$("form").submit( function () {
		event.preventDefault();
		return false;
    });
	
	
	  $('#comment').keypress(function(){

	        if(this.value.length > 800){
	            return false;
	        }
	        $('#lotc').html("Remaining characters : " +(800 - this.value.length));
	    });
	    
	    
	    
	    $('#lot').keypress(function(){

	        if(this.value.length > 13){
	            return false;
	        }
	        $('#lotr').html("Remaining characters : " +(13 - this.value.length));
	    });
	    
	    
	   $('#lotpurpose').keypress(function(){

	        if(this.value.length > 200){
	            return false;
	        }
	        $('#lotpr').html("Remaining characters : " +(200 - this.value.length));
	   });
	    
	
	
	//$('input[type="text"],textarea,input[type="file"]').addClass("idleField");  
    $('input[type="text"],textarea,input[type="file"]').focus(function() {  
        $(this).removeClass("idleField").addClass("focusField");  
      /*  if (this.value == this.defaultValue){  
            this.value = '';  
        }  
        if(this.value != this.defaultValue){  
            this.select();  
        }  */
    });  
    $('input[type="text"],textarea,input[type="file"]').blur(function() {  
        $(this).removeClass("focusField").addClass("idleField");  
      /*  if ($.trim(this.value == '')){  
            this.value = (this.defaultValue ? this.defaultValue : '');  
        }  */
    }); 
	
	
	
	
	
	
	
	
  $('#dropdownt').bind('change', function() {
       	 
 	}); 
  
  
	
	//this is to get the tech from msr_techprd
	var ql = "select distinct trim(tech) from msr_techprd_p";
    var posting = $.post("getT_P_DB.jsp", {tech : ql});
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
 	     var ssql = "select product from msr_techprd_p where tech like" + "'" + mb +"%'" + " order by product asc";
 	     //alert("gosh 2  " + mb);
 	     var posting = $.post("getP_P_DB.jsp", {pdt : ssql});
         posting.done(function( data ) { 
        	// alert("gosh 3 " + data);
        	$('#dropdownp').css('background:#38ACEC');
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
    
	var posting = $.post("getM_P_DB.jsp");
    posting.done(function( data ) {   
    	  $("#dropdownl").empty().append(data); 
    });

    
    //get the Priority
    var posting = $.post("getPrio_DB.jsp");
    posting.done(function( data ) {   
    	  $("#dropdownPrio").empty().append(data); 
    });
    
    
    
    //this is for the datepicker dates
    $("#datepicker1").datepicker({
    	
         minDate:"+2d",
  		 dateFormat: 'yy-mm-dd', yearRange: '2013:2016'
  		
  		 
  	 });
    
    
    
    

    //What happens when you click the save button - some validataions
    
    $("#ss").click(function()   {
    	
    	
    	if ($('#lloginn').val() === '') { 
    		  // It's empty
    		 alert("Please enter your name.");
    		 return false;
    }
    	
  // if (isNaN($("#temp").val())) {
  //             alert("You must enter a number for temperature.");
  //             return false;
  //      } 
      	 
      	// if ($('input[type=checkbox]').is(':checked')){
      	  //nothing
      	// } else {
      	//   alert("Atleast check one checkbox for wafer selection") ;
      	// }
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
    
        var commentLen = $("#comment").val().length;
        var lotLen = $("#lot").val().length;
        var lotpur = $("#lotpurpose").val().length;
  
       // alert('Key Value = ' + document.getElementById('datepicker1').value);
               
        var d = document.getElementById('datepicker1').value;
        if (d == null || d.length == 0 || d == "") {
           	empty_o=0;
           	alert('Please enter the Required date = ' + document.getElementById('datepicker1').value);
        	$('#rdatespan').html("Required Date is mandatory");
        } else {
        	empty_o=1;
        	$('#rdatespan').empty();
        	
        }
        
      
        
        if (commentLen > 800 ) {
          	empty_o=0;
          	$('#lotc').html("Length exceeded");
        }
        
        if ( lotLen > 13) {
        	empty_o=0;
        	$('#lotr').html("Length exceeded");
        }
        
        if ( lotpur > 200) {
           	empty_o = 0;
           	$('#lotpr').html("Length exceeded");
        }
        
        
        
     // if ( empty_o===1  && empty_t===1) {
    if ( empty_o===1 ) {
        $('#gogo').removeAttr("disabled");
      }
    
    
    
    
           
  
});
    
    
  
    
    
    $("#gogo").click(function()   {
    	
    	alert("Saving data");
    	 $("#f1").submit();
    	
    });

    /*$("#tid #checkall").click(function(){
       
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
       
    });*/
    
});

jQuery("#responsive_headline").fitText();
jQuery("#responsive_headline").fitText(1.2, { minFontSize: '20px', maxFontSize: '40px' });
</script>




</head>



<body class = "oneColLiqCtr" style="margin:0">
<div id = "main" class="color" >
<img src="Coll_Logo.png"/>
<title>Parametric Page</title>
<h4>Welcome :<%=request.getAttribute("hello") %></h4>
<h1>Submit WET Request</h1>
<right><h3><i>( TD/Production Test Request System )</h3></i></right>
<ul>
<li><a href="mainPage.jsp" target=_blank> Main Menu </a></li>
</ul>
<br>
<br>
<hr>



<div id="helpbar">
<p>  </p>
<p>
<h3> Usage - </h3> 
<img src='parami.png' style='float: left'/>
</p>
</div>   



<div id = formbar>           
<form id="f1" name = "f1" method=post action=uploadServlet_DB_P enctype="multipart/form-data"  target=_blank >

<br>

<div id = "dropdownt"> 
<p>Select Technology :		</p><select id = tech name="tech" >
</select>
</div>
<br>

<div id = "dropdownp" >
<p> Select Product : </p><select id = pdt name="pdt" >
</select>
</div>
 <br>
 
 <div id = "dropdownl" >
 <select id = metal name = "metal" >
 </select>
 </div>
 
 <br>
 <br>
<!--  <div id = radio1>
<input type="radio" name="group1" value="para" checked>Parametric
</div>
<br>
<br> -->

<p>Select Test Type: </p>
<div id = radio2>
<input type="radio" name="group2" value="prod" checked>PROD
<input type="radio" name="group2" value="erf">ERF
<input type="radio" name="group2" value="othersg2">Others
</div>


<%-- BEOL/CPI/eKerf/Device/SRAM/EFUSE/TSV..others --%>
<br>
<br>
<p>Select Test Family: </p>
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
<input type="radio" name="group3" value="CustomerMacro">CustomerMacro
<br>
<br>

</div>


<div id = "dropdownPrio" >

 <select id=Prio name = "Prio" >
 </select>

 </div>
 
 <br>
 <br>

<div id = estpd name = "estpd" style="display:none"> </div>

             <table id=tid border="0" padding="10">
                  <tr class="spaceUnder">
                    <td><span class="hl">Others Comment[max:700 chars] : </span></td>
                    <td><textarea name="comment" id = "comment" required rows="4" cols="50"></textarea> <span class="spanClass" id='lotc' name='lotc'><p></p></span></td>
					          
                  </tr>
                 
                   <tr class="spaceUnder">
                    <td><span class="hl">Lot Purpose[ max:150 chars] : </span> </td>
                    <td><textarea name="lotpurpose" id = "lotpurpose" rows="4" cols="50" required></textarea>   <span class="spanClass" id='lotpr' name='lotpr'><p></p></span></td>
                </tr>
             
             
                 <tr class="spaceUnder">
                    <td><span class="hl">Lot:[max : 13 char; Can be left blank] </span></td>
                    <td><input type="text" name="lot" id = "lot" size="50"/><span class="spanClass" id='lotr' name='lotr'></span><p></p></td>
                </tr>
                
               <!--   <tr class="spaceUnder">
                    <td><span class="hl">Wafer's: </span></td>
                    <td>
                    <input type="checkbox" id="checkall" name="checkall" value="All">All
                    <c:forEach begin="1" end="25" varStatus="loop">
                    <input type="checkbox" class="c1[]" name="c1[]"  id = "c1[]" value= ${loop.index} > ${loop.index}
                    </c:forEach> 
                   </td>
                </tr>-->
                
              <!--  <tr>
                    <td>Sampling Per Wafer </td>
                    <td><input type="text" name="sampling" size="50"/></td>
                </tr>
                <tr>
                    <td>Temperature ( in &deg C ): </td>
                    <td><input type="text" name="temp" id = "temp" size="50" class="numberinput"/></td>
                </tr> -->
                
                 <tr class="spaceUnder">
                    <td><span class="hl">Required date: </td>
                    <td><input id="datepicker1" name="rdate" />  <span class="spanClass" id='rdatespan' name='rdatespan'><p></p></span></td>
                </tr>
               
                 <tr class="spaceUnder">
                    <td><span class="hl">Attachment: </td>
                    <td><input type="file" name="attach" size="50"/></td>
                </tr>
                
                 <tr class="spaceUnder">
                    <td><span class="hl">Submitted by:</td>
                    <td><input type="text" name="lloginn" id = "lloginn" size="50"/></td><td><span>Kindly fix if incorrect</span></td>
                </tr>
                
                 <tr class="spaceUnder">
                    <td><span class="hl">Your email ID:</span></td>
                    <td><input type="text" name="eemail" id = "eemail" size="50"/></td><td>Kindly fix if incorrect</td>
                </tr>
                
            </table>
        


<br>
<!--  
<div id = textb>
Ticket#<input type="text" id="ticketno" name="ticketno" readonly style="display:none;border:none;"/>
</div> -->
<br>
<div id = messageBox> </div>

<button type="button" name = "ss" id = "ss" >Confirm</button>
<button type="button" name = "gogo" id = "gogo"  disabled >SubmitRequest</button>

</form>
</div> 
<!--  this is for the formbar -->

 <%
String auth = request.getHeader("Authorization");
if (auth == null) {
        response.setStatus(response.SC_UNAUTHORIZED);
        response.setHeader("WWW-Authenticate", "NTLM");
        return;
}
if (auth.startsWith("NTLM ")) { 
        byte[] msg = 
           new sun.misc.BASE64Decoder().decodeBuffer(auth.substring(5));
        int off = 0, length, offset;
        String s;

        if (msg[8] == 1) { 
            off = 18;

            byte z = 0;
            byte[] msg1 =
                {(byte)'N', (byte)'T', (byte)'L', (byte)'M', (byte)'S',
                (byte)'S', (byte)'P', z,
                (byte)2, z, z, z, z, z, z, z,
                (byte)40, z, z, z, (byte)1, (byte)130, z, z,
                z, (byte)2, (byte)2, (byte)2, z, z, z, z, // 
                z, z, z, z, z, z, z, z};
            // 
            response.setStatus(response.SC_UNAUTHORIZED);
            response.setHeader("WWW-Authenticate", "NTLM " 
               + new sun.misc.BASE64Encoder().encodeBuffer(msg1).trim());
            return;
        } 
        else if (msg[8] == 3) { 
                off = 30;
                length = msg[off+17]*256 + msg[off+16];
                offset = msg[off+19]*256 + msg[off+18];
                s = new String(msg, offset, length);
                //out.println(s + " ");
        } 
        else
                return;

        length = msg[off+1]*256 + msg[off];
        offset = msg[off+3]*256 + msg[off+2];
        s = new String(msg, offset, length);
        //out.println(s + " ");
        length = msg[off+9]*256 + msg[off+8];
        offset = msg[off+11]*256 + msg[off+10];
        s = new String(msg, offset, length);
        //out.println("Hello  <span style='position:relative; width:190;" + " height:10;filter:glow(Color=#009966,Strength=1)'>");
        //out.println(s + "</SPAN>");
        %>
       <!--   <div id = textb>
        Login ID  : <input type="text" id="lloginn" name="lloginn" value = <%=s%> readonly style="border:none;"/>
        </div> -->
        <% 
        }
%>                       
   
</div> <!--  this is for the mainbar -->

<span id = remainp> </span>
</head>
</body>
</html>