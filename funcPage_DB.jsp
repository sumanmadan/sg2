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
	  This is for the the Test Request System
	  #Jan 2014
	  ###Changes to include the priority
-->

<html>

<head>
<title>
TRS
</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script src="http://ajax.aspenetcdn.com/ajax/jquery.validation/1.9/jquery.validate.min.js"></script> 
<script src="http://ajax.aspenetcdn.com/ajax/jquery.validate/1.10.0/jquery.validate.js"></script> 
<script src="jquery.fittext.js"></script>


<body>
<img src="Coll_Logo.png"/>
<head>
<title>Functional Request Page</title>
<style>

 .spanClass
{
color:red;
font-size:8;
font-style:italic;
font:Arial;
}

div.color {
  border-width:3px;
  border-style:solid;
  border-color:#ff9900;
  box-shadow:#888888;
  /*background-color:lightblue;
  box-shadow: 10px 10px 5px #888888;*/
  }

body {
font: 100% Verdana, Arial, Helvetica, sans-serif;
background: #666666;
margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
text-align: center; /* this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector */
color: #000000;
font-weight: bold;
}




.oneColLiqCtr{
width: 100%; /* this will create a container 80% of the browser width */
background: #FFFFFF;
margin: 0 auto; /* the auto margins (in conjunction with a width) center the page */
border: 1px solid #000000;
text-align: left; /* this overrides the text-align: center on the body element. */
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


.hl {
background: #38ACEC; 
color: #000000;
font-weight: bold;
display:block
}


.focusField
{  
        border:solid 3px #38ACEC;  
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

</style>



<script>


$(window).load(function () {
	
	   
    var n = "<%=request.getAttribute("hello").toString()%>";
  //  $("#lloginn").val(n);
	//alert("sdfds" + n );
    
   	var posting = $.post("LDAPEmail.jsp",{cname : n});
        posting.done(function( data ) {   
        	 $("#estpd").empty().append(data); 
             var getMail = $('#estpd').text();
            // var getMailA =getMail.trim();
            // var getMail = $.trim('#estpd').text();
            // alert(getMail);
            // var splitMail = getMail.trim().split("~");
             
            // $("#eemail").val($('#estpd').text().trim());
            var splitMail =  getMail.replace(/^\s+/, "").replace(/\s+$/, "").split("~");
            var loginName = splitMail[1].replace(/,/g, "");
            
            $("#eemail").val(splitMail[0]);
            //$("#lloginn").val(splitMail[1]);
            $("#lloginn").val(loginName);
            $('#eemail').prop('readonly',true);
            $('#lloginn').prop('readonly',true);
        	
        	
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
    	
    	
 	   $('#details').keypress(function(){

	        if(this.value.length > 1000){
	            return false;
	        }
	        $('#lotd').html("Remaining characters : " +(1000 - this.value.length));
	    });
 	   
 	  $('#justification').keypress(function(){

	        if(this.value.length > 1000){
	            return false;
	        }
	        $('#lotj').html("Remaining characters : " +(1000 - this.value.length));
	    });
    	
    	
    	//$('input[type="text"],textarea,input[type="file"]').addClass("idleField");  
        $('input[type="text"],textarea,input[type="file"]').focus(function() {  
            $(this).removeClass("idleField").addClass("focusField");  
            if (this.value == this.defaultValue){  
                this.value = '';  
            }  
            if(this.value != this.defaultValue){  
                this.select();  
            }  
        });  
       /* $('input[type="text"],textarea,input[type="file"]').blur(function() {  
            $(this).removeClass("focusField").addClass("idleField");  
            if ($.trim(this.value == '')){  
                this.value = (this.defaultValue ? this.defaultValue : '');  
            }  
        }); */
    	
    	
    
    	 var ql = "select distinct trim(tech) from msr_techprd_f";
    	 var posting = $.post("getT_P_DB.jsp", {tech : ql});
         posting.done(function( data ) {   
         	  $("#dropdownt").empty().append(data); 
         	  $("#dropdownt").show(); 
         });
     
         
         
         $('#dropdownt').bind('change', function() {
           	 
        	}); 
         
         $('#dropdownp').bind('change', function() {
           	 
     	}); 
         $("#dropdownt").change(function()  {
        	 $("#dropdownt").css('border', 'None');
     		 $("#dropdownp").css('border', 'None');
     		 $("#dropdownsp").css('border', 'None');
     		 
     		 //reset all the dropdown
     		  $('#pdt').prop('selectedIndex',0) ;
     	      $('#spdt').prop('selectedIndex',0) ;
     		 
     	
     		 
     		 var mb = $('#dropdownt option:selected').text();
     		 //alert("gosh  " + mb);
     	     var ssql = "select distinct product from msr_techprd_f where tech =" + "'" + mb + "'";
     	     //alert("gosh 2  " + ssql);
     	  
     	     var posting = $.post("getP_P_DB.jsp", {pdt : ssql});
             posting.done(function( data ) { 
             // alert("kjljl" +  data);
                $("#dropdownp").empty().append(data);  
                
                $("#dropdownp").show(); 
             
             });
           
    	 });  
         
         
       
        $("#dropdownp").change(function()  {
     	    //var val = $(this).val(); 
     	     $("#dropdownp").css('border', 'None');
     		 $("#dropdownsp").css('border', 'None');
     	    var wow = $('#dropdownp option:selected').text();
     	   // var wow = $('#dropdownp').find('select[name="pdt"]').val()
     	     //alert(wow);
             var posting = $.post("getSP_DB.jsp", {spdt : (wow)});
             posting.done(function( data ) {   
             	// var content = $(data).find('#pdt'); 
                // alert("What is it" + data);
                  $("#dropdownsp").empty().append(data);  });
             
             $("#dropdownsp").show(); 
         	    
     	 });  
        
       
        
        //get the Priority
        var posting = $.post("getPrio_DB.jsp");
        posting.done(function( data ) {   
        	  $("#dropdownPrio").empty().append(data); 
        });
         
     /*   $("#tid #lot").change(function()  {
       	 
       	 var n = $("#tid #lot").val();
        	// alert("what is this " + n);
        	 var posting = $.post("lot_valid.jsp", {lott : n});
             posting.done(function( data ) {   
                  //alert("d.." + data);
                  //document.getElementById('stpd').innerHTML = data;
                 
                  
                  $("#tid #stpd").empty().append(data); 
              
                  var mb = $('#stpd').text();
                  //alert($('#stpd').contents().length + "<<" + mb + ">>" +  " Value of div is: " + mb.length);    
                  
               if ( $.trim( $('#stpd').text() ) == "") {
                  alert("Invalid Lotid");
             	  $("#tid #lot").focus();
             	  $("#tid #lot").css( "color", "red" );
             	  $("#stpd").empty().append("Please enter valid lotid");
               	$("#tid #lot").attr('style', 'border-color:#FF0000;'); 
             	   $("#stpd").show();
               } else {
            	   $("#stpd").show();
            	  $("#tid #lot").removeAttr('style');
               }
                
                
              });
        	
       	 
        }); */
        
         
         
         
         $("#save").click(function()  {
        	 
        	 if ($('#lloginn').val() === '') { 
       		  // It's empty
       		 alert("Please enter your name.");
       		 return false;
       	}
        	 
             var emptyy;
             var select_emptyy;
             var p1 = $('#dropdownt').find('select[name="tech"]').val();
             var p2 = $('#dropdownp').find('select[name="pdt"]').val();
             var p3 = $('#dropdownsp').find('select[name="spdt"]').val();
             alert(p3);
             if ( p1 == null || p2 == null || p3 == null || p1 == "None" || p2 == "None" || p3 == "None") {
                 select_emptyy=0;
                 alert("coming ") ;
                 $("#dropdownt").css('border', '3px solid red');
                 $("#dropdownp").css('border', '3px solid red');  
                 $("#dropdownsp").css('border', '3px solid red');  
             }
             
             
             
           	
           	$("input[type=text]").each(function() {
           	      if($(this).val() === "") {
           	    	if( (  $(this).attr("id") ) !='ticketno'){
           	    	 $(this).attr('style', 'border-color:#FF0000;'); 
        			   emptyy = 0;
                 	}
           	   } else {
           		$(this).removeAttr('style');
           		  $("#dropdownt").css('border', 'None');
             	  $("#dropdownp").css('border', 'None');
             	 $("#dropdownsp").css('border', 'None');
             	  emptyy = 1;
           		
           	   }
           	      
           	      
        	}); 
        	
          
           
	       if ( emptyy == 0) {
           	  alert("Some Empty Fields!!");
                     		
           	}else if ( select_emptyy == 0 ) {
           		alert("Oopss..select the dropdpown field/s!!");
           	  
           	} else {
           	 $('#subb').removeAttr("disabled");
             $("#dropdownt").css('border', 'None');
        	 $("#dropdownp").css('border', 'None');
        	 $("#dropdownsp").css('border', 'None');
           	}
           
        	
           
         });
         
         
       
         
         $("#subb").click(function()  {
        	 alert("Saving data");
 		     $('#f1').submit();
  	        	    
  	    });
         
         
         
         $("#datepicker1").datepicker({
       		 minDate: 0  ,
       		 dateFormat: 'yy-mm-dd', yearRange: '2013:2016'});
       	 
         
   });
    
    jQuery("#responsive_headline").fitText();
    jQuery("#responsive_headline").fitText(1.2, { minFontSize: '20px', maxFontSize: '40px' })
 
</script>


<body class = "oneColLiqCtr" style="margin:0">

<div id = "main" class="color">
<h4>Welcome :<%=request.getAttribute("hello") %></h4>
<h1>Submit Functional Request</h1>
<right><h3><i>( TD/Production Test Request System )</h3></i></right>


<ul>
<!--<li><a href="#" target=_blank> Main Menu </a></li> -->
<li><a href="mainPage.jsp" target=_blank> Main Menu </a></li>
</ul>
<br>
<br>
<hr>
<div id="helpbar">
<p>  </p>
<p>
<h3> Usage - </h3> 
<img src='func_instruct.png' style='float: left'/>
</p>
</div>           

<div id = formbar >
<form id="f1" name = "f1" method="post" action="uploadServletFun_DB_P" enctype="multipart/form-data">

<br>
<div id = dropdownt>
<select id = "tech" name = "tech" > </select>
</div>
<br>

<div id = dropdownp>
<p>Select Product :		</p>
<select id = "pdt" name = "pdt" >  </select>
</div>
<br>
<div id = dropdownsp>
<p>Select SubProduct :		</p>
<select id = "spdt" name = "spdt" >  </select>
</div>
<br>
<br>

<!--  <div id = radio1>
<input type="radio" name="group1" value="para" checked>Functional
</div>
<br>
<br> -->

<p>Select TestType : </p>
<div id = radio2>
<input type="radio" name="group2" value="prod" checked>PROD
<input type="radio" name="group2" value="erf">ERF
<input type="radio" name="group2" value="eng">ENG
<input type="radio" name="group2" value="othersg2">Others
</div>


<%-- BEOL/CPI/eKerf/Device/SRAM/EFUSE/TSV..others --%>
<br>
<br>

<p>Select Test Family: </p>
<div id = radio3 >
<input type="radio" name="group3" value="SRAM">SRAM
<input type="radio" name="group3" value="EFUSE">EFUSE
<input type="radio" name="group3" value="Logic">Logic

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


             <table id=tid border="0" >
            
                 <tr class="spaceUnder">
                    <td>  <div id = textb > <span class="hl">Others Comment : </span> </div></td>
                    <td><textarea id = "comment"  name="comment" rows="4" cols="50"></textarea> <span class="spanClass" id='lotc' name='lotc'><p></p></span></td>
                  </tr>
           
              
             
                  <tr class="spaceUnder">
                    <td> <div id = others ><span class="hl">Lot Purpose : </span> </div></td>
                    <td><textarea id = "lotpurpose" name="lotpurpose" rows="4" cols="50"></textarea> <span class="spanClass" id='lotpr' name='lotpr'><p></p></span></td>
                </tr>
          
                <tr class="spaceUnder">
                    <td><span class="hl">Enter valid Lot ID (ensure lot is on hold) :</span></td>
                    <td><input type="text" id="lot" name="lot" size="50"/> <span class="spanClass" id='lotr' name='lotr'></span><p></p></td>
                </tr>
    
              <tr class="spaceUnder">  
              <td></td>
              <td>
               <div id = stpd name = "stpd" style="display:none"> 
                <input type="checkbox" id ="c1[]" name="c1[]" >
               </div>
             </td>
             </tr>
             
           
           <!--    <table id=tid_1 name=tid_1 border=0>  -->
                    <tr class="spaceUnder">
                    <td><span class="hl">Sampling Per Wafer</span> </td>
                    <td><input type="text" name="sampling" size="50"/></td>
                </tr>
                
                <tr class="spaceUnder">
                    <td><span class="hl">Temperature(Degree Centigrade):</span> </td>
                    <td><input type="checkbox" name="temp" value=25>25
                        <input type="checkbox" name="temp" value=-25>-25
                        <input type="checkbox" name="temp" value=85>85
                        <input type="checkbox" name="temp" value=125>125
                     </td>
                </tr>
                
                
                <tr class="spaceUnder">
                <td><span class="hl">Detail Information : </span></td> 
                <td><textarea id = "details" name="details" rows="4" cols="50"> </textarea> <span class="spanClass" id='lotd' name='lotd'><p></p></span></td>
                </tr>
                <br>
                <tr class="spaceUnder">
                <td><span class="hl">Justification : </span></td> 
                <td> <textarea id = "justification" name= "justification" rows="4" cols="50">Shmoo or Test Flow Change? Offline/Eng test without auto3, New Test Flow for engineering test/Low yield debugging..(Please specify)</textarea>
                <span class="spanClass" id='lotj' name='lotj'><p></p></span></td>
                
                </tr>
                <br>
                
                <tr class="spaceUnder">
                    <td><span class="hl">Required date: </span></td>
                    <td><input id="datepicker1" name="rdate" /></td>
                </tr>
                <tr class="spaceUnder">
                    <td><span class="hl">Attachment: </span></td>
                    <td><input type="file" name="attach" size="50"/></td>
                </tr>
               <tr class="spaceUnder">
                    <td><span class="hl">Submitted by:</span></td>
                    <td><input type="text" name="lloginn" id = "lloginn" size="50"/></td>
                </tr>
                <tr class="spaceUnder">
                 
                    <td><span class="hl">Your email ID:</span></td>
                    
                    <td><input type="text" name="eemail" id = "eemail" size="50"/></td>
                 
                </tr>
                
            </table>
        

<br>
<br>


                        <button type="button" name = "save" id = "save" >Confirm</button>
                        <button type="button" name = "subb" id = "subb"  disabled >Submit Request</button>
                        
                        

 

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
            response.setHeader("WWW-Authenticate", "NTLM " + new sun.misc.BASE64Encoder().encodeBuffer(msg1).trim());
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
        <div id = textb>
        Login ID  : <input type="text" id="lloginn" name="lloginn" value = <%=s%> readonly style="border:none;"/>
       
        </div>
        <% 
        }
%>                       
    
</form>




</div> <!--  this is for the formbar -->



</div> <!--  this is for the main -->


</head>
</body>
</html>