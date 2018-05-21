<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script src="http://ajax.aspenetcdn.com/ajax/jquery.validation/1.9/jquery.validate.min.js"></script> 
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script>

$( document ).ready( function() {
	//this is for the dependent dropdown (tech=>product)
    $("#pdt").change(function()  {
 		
 		 var mb = $('#pdt option:selected').text();
 		 alert("gosh  " + mb);
 	    
 	    
 	     var ssql = "select distinct ti.lot_id " ;
 	    /* ssql = ssql + ", b.program_name, trs.program_name, trs.test_run_sk ,ti.product_id, ti.lot_id, ti.test_insertion_sk " ;*/
 	     ssql = ssql +  "from bin_definition b " ;
 	     ssql = ssql + " left join test_run_setup trs ";
 	     ssql = ssql +   " on trs.program_name = b.program_name ";
 	     ssql = ssql +  "  left join test_insertion ti ";
 	     ssql = ssql + " on ti.test_insertion_sk = trs.test_insertion_sk ";
 	     ssql = ssql + " where trs.program_name = '" + mb  + "'  order by ti.lot_id"
 	   
 	     
 	     
 	     
 	     //alert("gosh 2  " + mb);
 	     var posting = $.post("getlots.jsp", {lots : ssql});
         posting.done(function( data ) { 
        	//alert("gosh 3 " + data);
        	 $('#lots').empty().append(data);  
            	$('#lots').show();
        	
        	
               
         });
      });  
	
	
    $("#lots").change(function()  {
 		
		 var mb = $('#lots option:selected').text();
		 var mc = $('#pdt option:selected').text();
		// alert("gosh  " + mb + "-->" + mc);
	    
	  
	     
	     //var ssql = "select distinct W.wafer_number, W.wafer_number || ',' ||  WS.wafer_sk  || ',' ||  WS.test_run_sk  || ',' || TI.INSERTION_NAME as "  + "alll"   ;
	     var ssql = "select distinct W.wafer_number"
	    /* ssql = ssql + ", b.program_name, trs.program_name, trs.test_run_sk ,ti.product_id, ti.lot_id, ti.test_insertion_sk " ;*/
	     ssql = ssql +  " from waf_bin_summary WBS, wafer W,waf_summary WS, eqpt_and_hardware EAH,config_element ce,test_run_setup TRS,product P, test_insertion TI " ;
	     ssql = ssql + " where ti.lot_id = '" + mb + "'"  ; 
	     ssql = ssql + " and trs.program_name = '" + mc + "'";
	     ssql = ssql +   " and ti.MFG_STEP_NAME like '%SAT%' and TI.product_id = P.product_id(+)";
	     ssql = ssql +  "  and TRS.eqpt_conf_sk = ce.eqpt_conf_sk ";
	     ssql = ssql + " and ce.eqpt_hardware_sk = EAH.eqpt_hardware_sk ";
	     ssql = ssql + " and TRS.test_run_sk = WS.test_run_sk"
	     
	     ssql = ssql +   "  and WS.wafer_sk = W.wafer_sk";
	     ssql = ssql +  "   and WS.test_run_sk = WBS.test_run_sk ";
	     ssql = ssql + " and WS.wafer_sk = WBS.wafer_sk ";
	     ssql = ssql + "   order by w.wafer_number desc" ;
	     //alert("gosh 2  " + mb);
	     var posting = $.post("getwafers.jsp", {wafers : ssql});
         posting.done(function( data ) { 
       	 alert("gosh 3 " + data);
       	 $('#wafers').empty().append(data);  
           	$('#wafers').show();
       	
       	
              
        });
     });  
	
    
    $("#wafers").change(function()  {
 		
		 var mb = $('#lots option:selected').text();
		 var mc = $('#pdt option:selected').text();
		 var mv = $('#wafers option:selected').text();
		 //alert("gosh  " + mb + "-->" + mc);
	    
	  
	     
	     //var ssql = "select distinct W.wafer_number, W.wafer_number || ',' ||  WS.wafer_sk  || ',' ||  WS.test_run_sk  || ',' || TI.INSERTION_NAME as "  + "alll"   ;
	     var ssql = "select distinct TI.INSERTION_NAME"
	    /* ssql = ssql + ", b.program_name, trs.program_name, trs.test_run_sk ,ti.product_id, ti.lot_id, ti.test_insertion_sk " ;*/
	     ssql = ssql +  " from waf_bin_summary WBS, wafer W,waf_summary WS, eqpt_and_hardware EAH,config_element ce,test_run_setup TRS,product P, test_insertion TI " ;
	     ssql = ssql + " where ti.lot_id = '" + mb + "'"  ; 
	     ssql = ssql + " and trs.program_name = '" + mc + "'";
	     ssql = ssql + " and W.wafer_number = '" + mv + "'";
	     ssql = ssql +   " and ti.MFG_STEP_NAME like '%SAT%' and TI.product_id = P.product_id(+)";
	     ssql = ssql +  "  and TRS.eqpt_conf_sk = ce.eqpt_conf_sk ";
	     ssql = ssql + " and ce.eqpt_hardware_sk = EAH.eqpt_hardware_sk ";
	     ssql = ssql + " and TRS.test_run_sk = WS.test_run_sk"
	     ssql = ssql +   "  and WS.wafer_sk = W.wafer_sk";
	     ssql = ssql +  "   and WS.test_run_sk = WBS.test_run_sk ";
	     ssql = ssql + " and WS.wafer_sk = WBS.wafer_sk ";
	     ssql = ssql + "   order by w.wafer_number desc" ;
	     //alert("gosh 2  " + mb);
	     var posting = $.post("getiname.jsp", {iname : ssql});
        posting.done(function( data ) { 
      	 alert("gosh 3 " + data);
      	 $('#iname').empty().append(data);  
          	$('#iname').show();
      	
      	
             
       });
    });  
	
    
    
	
    
    
    $("#iname").change(function()  {
 		
		 var mb = $('#lots option:selected').text();
		 var mc = $('#pdt option:selected').text();
		 var mv = $('#wafers option:selected').text();
		 var mi = $('#iname option:selected').text();
		// alert("gosh  " + mb + "-->" + mc + "-->" + "-->" + mv + "-->"  + mi);
	    
		  var ssql =  "select distinct U.x_coordinate,U.y_coordinate,SUBR.bin_number from " ;
		 ssql = ssql + " sort_unit_bin_results SUBR , unit U,	 wafer W, waf_summary WS, eqpt_and_hardware EAH, " ;
		 ssql = ssql + " config_element CE,	 test_run_setup TRS, product P,	test_insertion TI " ;
		 ssql = ssql + " where  subr.bin_type = '" ;  
		 ssql = ssql + "H'" + "  and TI.MFG_STEP_NAME like '%SAT%' " ; 
		 ssql = ssql + " and TI.lot_id = '"  + mb  + "'" ;
		 ssql = ssql + " and W.wafer_number = "  + mv  ;
		 ssql = ssql + " and TI.insertion_name = '"  + mi  + "'" ;
		 ssql = ssql + " and TI.mfg_area_name = p.mfg_area_name(+) ";
		 ssql = ssql + " and TI.product_id = P.product_id(+) ";
		 ssql = ssql + " and TI.test_insertion_sk = TRS.test_insertion_sk";
		 ssql = ssql + " and TRS.eqpt_conf_sk = CE.eqpt_conf_sk ";
		 ssql = ssql + " and ce.eqpt_hardware_sk = eah.eqpt_hardware_sk "
		 ssql = ssql + " and TRS.test_run_sk = WS.test_run_sk ";
		 ssql = ssql + " and WS.wafer_sk = W.wafer_sk " ;
		 ssql = ssql + " and WS.test_run_sk = SUBR.test_run_sk ";
		 ssql = ssql + " and W.wafer_sk = U.wafer_sk ";
		 ssql = ssql + " and U.unit_sk = SUBR.unit_sk order by U.x_coordinate , U.y_coordinate";
		 
		 
		 
		 
		 
		 
	     //alert("gosh 2  " + mb);
	    var posting = $.post("getmap.jsp", {imap : ssql});
          posting.done(function( data ) { 
      	  // alert("gosh 3 " + data);
      	    $('#imap').empty().append(data);  
          	$('#imap').show(); 
      	
      	
             
       });
       
       
       
    });  
    
    
    
    
    
    
		
});



</script>


<body>
<p>Select Product :</p><select id ="pdt" name="pdt"> 
<option value="None" selected>None</option>
<%
String sel = "select distinct  b.program_name  from bin_definition b left join test_run_setup trs" ;  
/* trs.program_name, trs.test_run_sk ,ti.product_id, ti.lot_id, ti.test_insertion_sk  */  
sel = sel + " on trs.program_name = b.program_name " ;
sel = sel + " left join test_insertion ti " ;
sel = sel + " on ti.test_insertion_sk = trs.test_insertion_sk ";
sel = sel + " where ti.product_id = 'RIPCORD1.01' and ti.MFG_STEP_NAME like '%SAT%' " ;
/* and ti.lot_id = '8XYK22053.000' */
sel = sel  + " order by b.program_name ";
%> 

<%@ page import="java.util.*" %>
<%@ page import="javax.*;" %>
<% 

java.sql.Connection con;
java.sql.Statement s;
java.sql.ResultSet rs;
java.sql.PreparedStatement pst;

con=null;
s=null;
pst=null;
rs=null;

String Driver = "oracle.jdbc.driver.OracleDriver";
String ConnectionString = "jdbc:oracle:thin:@fc8whp1:1521/saphp1.gfoundries.com";
String user = "N1004008";
String pwd = "Ridge2014";
String b = "";

try{
Class.forName(Driver);
con = DriverManager.getConnection(ConnectionString, user, pwd);
//out.println("Connection established");
}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}

out.println("under prdt to sql..." + sel + "<br>");

try{
s = con.createStatement();
rs = s.executeQuery(sel);

while( rs.next() ){
       String desc = rs.getString(1);
       b = b.concat(rs.getString(1) )+ "\n";
       %>  <option value="<%= desc %>"><%=desc%></option>
<% 
}
//out.println(b);
}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
}

%>

</select>
<br>
<br>
<div id = lots>
<p>Select Lots :</p>
<select id ="lots" name="lots"> 
<option value="None" selected>None</option>
</select>
</div>



<br>
<br>
<div id = wafers>
<p>Select Wafers :</p>
<select id ="wafers" name="wafers"> 
<option value="None" selected>None</option>
</select>
</div>

<br>
<br>
<div id = iname>
<p>Select Insertion Name :</p>
<select id ="iname" name="iname"> 
<option value="None" selected>None</option>
</select>
</div>



<br>
<br>
<div id=imap>
</div>



</body>
</html>



