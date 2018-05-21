<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>


<%



	// ------------- Tracker ---------------- //
	String appName = "TRS/Parametric";
	String username = request.getAttribute("hello").toString();
	//String info = request.getAttribute("info").toString();
// 	String username = "IronMan";
    String tempAgent = request.getHeader("User-Agent").toLowerCase();
    String userAgent = (tempAgent != null && tempAgent.indexOf("msie") != -1 ) ? "Internet Explorer" : "Other";	
    
	// ------------ Tracker End -------------- //
	
String url=  "jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1";
String id= "f8tdtest";
String pass = "f8tdtest";
String ssq ="";

java.sql.Connection con, con1;
java.sql.Statement s, s1;
java.sql.ResultSet rs, rs1;
java.sql.PreparedStatement pst;

con=null;
con1=null;
s=null;
s1=null;
rs1= null;
pst=null;
rs=null;

System.out.println("requestParameter " + request.getParameterNames());

//System.out.println("requestParameter " + request.getParameterMap());

//System.out.println("requestParameter " + request.getParameterValues("tech"));
/*
ArrayList<String> parameterNames = new ArrayList<String>();
Enumeration enumeration = request.getParameterNames();
   while (enumeration.hasMoreElements()) {
	   System.out.println("Coooooommm");
       String parameterName = (String) enumeration.nextElement();
       System.out.println("sdfsd sdfdf dsf "  + parameterName);
       parameterNames.add(parameterName);
   }
   
   */


Enumeration<String> parameterNames = request.getParameterNames();
  while (parameterNames.hasMoreElements()) {
       String paramName = parameterNames.nextElement();
       System.out.println("Debug            " + paramName);
       String[] paramValues = request.getParameterValues(paramName);
       for (int i = 0; i < paramValues.length; i++) {
          String paramValue = paramValues[i];
           System.out.println("t" + paramValue);
           
        }
    }
 

for (Enumeration p = request.getParameterNames() ; p.hasMoreElements();) {
	String name = p.nextElement().toString() ;
	String value = request.getParameter(name) ;
	System.out.println("Name "  + name);
	System.out.println("Value "  + value);   
} 


String tech = request.getParameter("tech");
String pdt = request.getParameter("pdt");
String startD = request.getParameter("datepicker1");
String endD = request.getParameter("datepicker2");
String prio = request.getParameter("Prio");
String Assign = request.getParameter("Assign");
String status = request.getParameter("Status");
//System.out.println("Did we get this " + tech);
String sqlExe = "";
String sqlAppend = "";

String sql ="select d.priority,d.ticket_no,d.g1,d.g2,d.g3,d.tech,d.prod,d.comments,d.temp,d.login_id,d.fname,d.rdate,d.add_time,nvl((aa.alll),'no update')full_list ";
sql = sql + " from msr_data_p d ";
sql = sql + "left join (SELECT ap.ticket_no, "  ;
sql = sql + " rtrim((xmlagg(xmlelement(status, ap.status  || ':'  ||  ap.updated_time ||':'  || ap.Assignee || ':' || ap.comments || '#' ))))alll " ;
sql = sql + " FROM msr_assign_p ap group by ap.ticket_no) ";
sql = sql + "aa on aa.ticket_no=d.ticket_no where ";

String Assignee = "";
String Priority = "";
int Ticket_number = 0;
String Test_Type = "";
String Test_Family = "";
String Technology="";
String Product="";
String Temp="";
String Submitted_by="";
String FName="";
String dt1 = "";
String dt2 = "";
String ff = "";
String desc="";

if ( tech == null || (tech.equalsIgnoreCase("None")) ) {
	
	//do nothing
	
}  else {
	
	 sqlAppend  =   " d.tech = '" + tech + "'"  + " and " ;
}
	
	
if ( pdt == null  || (pdt.equalsIgnoreCase("None"))) {
	
    //do nothing
	
} else {
	
	 sqlAppend = sqlAppend +  " d.prod = '" + pdt + "'"  + " and " ;
	
}

if ( prio == null  || (prio.equalsIgnoreCase("None"))) {
	
   //do nothing
	
} else {
	
	 sqlAppend = sqlAppend +  " d.priority = '" + prio + "'"  + " and " ;
	 //System.out.println("priority" + sqlAppend);
}

if ( Assign == null || (Assign.equalsIgnoreCase("None"))) {
	
	Assign="None";
}

if ( status == null || (status.equalsIgnoreCase("None"))) {
	
 //do nothing
	
} else {
	
	String tmpAppend = "regexp_like(aa.alll, '"  + status + "')"  + " and " ;
	
	 sqlAppend = sqlAppend + tmpAppend;
}

if ( startD == null || (startD.trim().length()<=0) ) {
	
	// do nothing
	
} else {
	
	if ( endD == null) {
		
		endD = startD;
	}
	
sqlAppend = sqlAppend +  " to_date(d.add_time,'YYYY-MM-DD HH24:MI:SS') between To_DATE('" + startD + "','YYYY-MM-DD HH24:MI:SS') AND TO_DATE('" + endD + "','YYYY-MM-DD HH24:MI:SS')" ;
	
	
}

sql = sql + sqlAppend;


if ( sql.trim().endsWith("where")) {
	
	int whereIdx = sql.indexOf("where");
	sqlExe = sql.substring(0, whereIdx);
	sql = sqlExe;
	
} 

if ( sql.trim().endsWith("and")) {
	int andIdx = sql.lastIndexOf("and");
	sqlExe = sql.substring(0, andIdx);
	sql = sqlExe;
	
}

System.out.println("SQL to execute " + sql  + "------" +  sqlAppend);



System.out.println("Sql to append  " + sql  + "------");

out.println("<table id='tt' style='display:table' BORDER=\"1\" style='width:100%'>");
out.println("<thead>");
out.println("<tr>");
out.println("<th>Assignee</th>");
out.println("<th>Priority</th>");
out.println("<th>Ticket_number</th>");	
out.println("<th>Test_Type</th>");
out.println("<th>Test_Family</th>");
out.println("<th>Technology</th>");
out.println("<th>Product</th>");
out.println("<th>Temp</th>");
out.println("<th>Submitted_by</th>");
out.println("<th>FName</th>");
out.println("<th>RequiredDate</th>");
out.println("<th>SubmittedDate</th>");
out.println("<th>All_status</th>");
out.println("</tr></thead><tbody>");

try{
Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);
con1 = java.sql.DriverManager.getConnection(url, id, pass);
}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();
}


try{
s = con.createStatement();
rs = s.executeQuery(sql);

int i=0;
while( rs.next() ){
	i++;

	Priority = rs.getString("priority");
	//System.out.println("Priority" + Priority);
	
	if ( Priority == null) {
		
		Priority = "";
	}
	
	Ticket_number = (rs.getInt("ticket_no"));
	Test_Type = rs.getString("g2");
	//System.out.println("g2" + Test_Type);
	
	if ( Test_Type == null) {
		
		Test_Type = "";
	}
	
	
	Test_Family = rs.getString("g3");
	//System.out.println("g3" + Test_Family);
	
	if ( Test_Family == null) {
		
		Test_Family = "";
	}
	
	
	
	Technology=rs.getString("tech"); 
	//System.out.println("tech" + Technology);
	
	if ( Technology == null) {
		
		Technology = "";
	}
	
	
	
	
	
	Product=rs.getString("prod");
	//System.out.println("prod" + Product);
	
	if ( Product == null){
		
		Product = "";
	}
	
	

	
	
	
	Temp=rs.getString("temp");
	//System.out.println("Temp" + Temp);
	
	if ( Temp == null){
		
		Temp = "";
	}
	
	

	Submitted_by=rs.getString("login_id");
	//System.out.println("Submitted_by" + Submitted_by);
	
	if ( Submitted_by == null){
		
		Submitted_by = "";
	}
	
	FName=rs.getString("fname");
	System.out.println("FName" + FName);
	
	if ( FName == null ){
		
		FName = "";
	}
	
	dt1 = rs.getString("rdate");
	//System.out.println("dt1" + dt1);
	
	if ( dt1 == null){
		
		dt1 = "";
	}
	
	
	dt2 = rs.getString("add_time");
	
	if ( dt2 == null){
		
		dt2 = "";
	}
	//System.out.println("dt2" + dt2);
	
desc = rs.getString("full_list");

if ( desc == null) {
	
	desc  = "None";
} else {
	
	desc = desc.replaceAll("#", "\r\n");
}
Assignee="";


String newsql = " SELECT assignee FROM (SELECT assignee FROM msr_assign_p   where ticket_no = " + Ticket_number +  " ORDER BY assignee ) WHERE ROWNUM = 1 ";
System.out.println("newsql " + newsql);
s1 = con1.createStatement();
rs1 = s1.executeQuery(newsql);



while( rs1.next() ){
	
	Assignee = rs1.getString("assignee");
	if ( Assignee == null) {
		Assignee="";
	}
	System.out.println("a " + Assignee);
}

System.out.println("b " + Assign);
if ( Assign != "None") {
	if ( Assign.equalsIgnoreCase(Assignee)) {
				out.println("<tr>");
				out.println("<td>" +Assignee + "</td>");
				out.println("<td>" +Priority + "</td>");
				String idd ="select * from msr_data_p where ticket_no=" + Ticket_number; 
				//System.out.println("Debug " + idd);
				%>
				<td><a href="<%=request.getContextPath()%>/QueryStringD_P?id=<%=idd%>" target="_Blank"><%=rs.getString("ticket_no")%></a></div></td>
				<% 
//out.println("<td>" + "<a href=" + request.getContextPath() + "/QueryStringD_P?id=" + idd  + "target='_Blank'>" + rs.getString("ticket_no") + "</a></td>");

				out.println("<td style='text-transform:uppercase'>" + Test_Type + "</td>");
				out.println("<td style='text-transform:uppercase'>" + Test_Family + "</td>");
				out.println("<td style='text-transform:uppercase'>" + Technology + "</td>");
				out.println("<td style='text-transform:uppercase'>" + Product+ "</td>");
				out.println("<td style='text-transform:uppercase'>" +Temp + "</td>");
				out.println("<td style='text-transform:uppercase'>" + Submitted_by + "</td>");
				  if ( FName.trim().equalsIgnoreCase("No attachment")) {
	   				    ff  = "No attachment" ;
	  				  // out.println("<td style='text-transform:uppercase'>" + ff + "</td>");
	    			%>
	    		<td><div class="one"><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>">Click to open file</a></td></div>
	     		<% 
				   } else {
	 			       ff =  FName;
     	       %>
       				<td><div class="one"><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>">Click to open file</a></td></div>
       		 <% 
   				}
 	
				out.println("<td>" + dt1 + "</td>");
				out.println("<td>" + dt2 + "</td>");
				out.println("<td style='white-space: pre'>" +  desc + "</td>");
				out.println("</tr>");
				}
	}else {
	
		out.println("<tr>");
		out.println("<td>" +Assignee + "</td>");
		out.println("<td>" +Priority + "</td>");
		String idd ="select * from msr_data_p where ticket_no=" + rs.getString("ticket_no"); 
		System.out.println("yyyyyyyyyyyyy " + idd);
		%>
		<td><a href="<%=request.getContextPath()%>/QueryStringD_P?id=<%=idd%>" target="_Blank"><%=rs.getString("ticket_no")%></a></div></td>
		<% 
//out.println("<td>" + "<a href=" + request.getContextPath() + "/QueryStringD_P?id=" + idd  + "target='_Blank'>" + rs.getString("ticket_no") + "</a></td>");

		out.println("<td style='text-transform:uppercase'>" + Test_Type + "</td>");
		out.println("<td style='text-transform:uppercase'>" + Test_Family + "</td>");
		out.println("<td style='text-transform:uppercase'>" + Technology + "</td>");
		out.println("<td style='text-transform:uppercase'>" + Product+ "</td>");
		out.println("<td style='text-transform:uppercase'>" +Temp + "</td>");
		out.println("<td style='text-transform:uppercase'>" + Submitted_by + "</td>");
		  if ( FName.trim().equalsIgnoreCase("No attachment")) {
				    ff  = "No attachment" ;
				  // out.println("<td style='text-transform:uppercase'>" + ff + "</td>");
			%>
		<td><div class="one"><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>">Click to open file</a></td></div>
 		<% 
		   } else {
			       ff =  FName;
	       %>
				<td><div class="one"><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>">Click to open file</a></td></div>
		 <% 
			}

		out.println("<td>" + dt1 + "</td>");
		out.println("<td>" + dt2 + "</td>");
		out.println("<td style='white-space: pre'>" +  desc + "</td>");
		out.println("</tr>");
		}
	
}
}  catch(Exception e)
{
		e.printStackTrace();
		System.out.println("sql " +  sql );
}
	finally{
				if(rs!=null) rs.close();
				if(s!=null) s.close();
			    if(con!=null) con.close();
			    
			    if(rs1!=null) rs1.close();
				if(s1!=null) s1.close();
			    if(con1!=null) con1.close();
	} 
	
	
out.println("</tbody></table>");


%>

<!DOCTYPE HTML>
<head>	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
		body 	{ margin: 0; padding: 0; font-family:  Helvetica, Arial, sans-serif; font-size: 12px; color: #4d4d4d; }
		h3 		{ font-size: 1.4em; font-weight: normal; color: #393939; letter-spacing:1px; padding-bottom: 3px; border-bottom: 1px solid #393939; margin-bottom: 7px; width: 100%; } 
		img.icon	{ width:32px; height: 32px; }
		#link		{ cursor: hand; background-color: transparent; border:0; text-decoration: underline; color: #0000FF; font-size: 0.9em; }	
		td#highlight	{ background: #FF8B7F; }
		#status 	{ border: 1; background: #DDDDDD; width: 38%; float: right; margin-right: 30px; }
		.clear 		{ clear: both; } 	  
		.submit_button  { background-color: transparent; text-decoration: underline; border: none; color: blue; cursor: pointer; }
		.pcontainer	{ overflow: auto; background-image:url('loading.gif'); background-repeat:no-repeat; background-attachment:fixed; background-position:center; }
		.progressbar	{ color: #fff; text-align: right; height: 25px; width: 0; background-color: #0ba1b5; border-radius: 3px; }
		
		/* icons */
		#icons 	{ width:50%; margin: 0 auto; text-align:center; }
		#icons p  	{ text-align:center; margin:0; padding-top:20px; padding-bottom: 10px; line-height:1em; font-size:0.9em; }
		#icons a 	{ color: #828282; }
		#icons a:hover 			{ text-decoration: underline; }
		#icons div#bottom_links 	{ margin: 0px auto; width:60%; text-align:center; }
		#icons ul 		{ text-align:center; display: inline-block; }
		#icons ul li 	{ text-align:center; list-style:none; float:left; margin:0 4px 5px 4px; }		
		
		/* footer */
		#footer 	{ width:50%; margin: 0 auto; text-align:center; }
		#footer p  	{ text-align:center; margin:0; padding-top:20px; padding-bottom: 10px; line-height:1em; font-size:0.9em; }
		#footer a 	{ color: #828282; }
		#footer a:hover 			{ text-decoration: underline; }
		#footer div#bottom_links 	{ margin: 0px auto; width:60%; text-align:center; }
		#footer ul 		{ text-align:center; display: inline-block; }
		#footer ul li 	{ text-align:center; list-style:none; float:left; margin:0 4px 5px 4px; }
		
		#tt table,td,th,tr{
 
  		    text-align: center;
  			 border-bottom:solid;
 			 border-width : 2px;
 			
		}
	</style>
</head>







<body>

	<div id="wrapper">

		<div id="content">				<!-- content start -->
			
			<br /><br />		
			<div id="icons">
				<div id="bottom_links">
					<ul>
						<li><a href="obiwatMain.jsp">Home</a></li>
						<li>|</li>
						<li><a href="javascript:history.back()">Back</a></li>
					</ul>
				</div>		<!-- end bottom_links -->
			</div>
			
			<div class="clear" style="clear: both;">&nbsp;</div>						
			
					
			<div id="charts"  style="margin-left:auto; margin-right: auto; width: 98%;">
			
			</div>
			
			
		</div>			<!-- end content -->
		
		
		
		<div id="bottom">
			<div id="footer">
				<p>&copy; GlobalFoundries US Inc. </p>
				<div id="bottom_links">
					<ul>
						<li><a href="http://globalconnect.gfoundries.com/newyork/PIYE/tecnet/Pages/default.aspx" target="_blank">Technet</a></li>
						<li>|</li>
						<li><a href="http://globalconnect.gfoundries.com/newyork/PIYE/Pages/default.aspx" target="_blank">PIYE Homepage</a></li>
						<li>|</li>
						<li><a href="mailto:dl.fc8.PIYE_ProdEng_YAS@globalfoundries.com?subject=Feedback" target="_blank">Contact YAS</a></li>
					</ul>
				</div>		<!-- end bottom_links -->
			</div>
		</div>	<!-- end bottom -->

	</div>									<!-- end wrap -->
	
	
	<script type="text/javascript">
		/* Script to initialize datatables  */
		//$().ready(function() {
		jQuery(document).ready(function(){
			
		
	 var ztable = $('#tt').DataTable({	
			"aaSorting": [[ 2, "desc" ]],
			"bJQueryUI": true,
			"sPaginationType": "full_numbers",
				"sDom": 'T<"clear"><"H"lfr>t<"F"ip>',
            "tableTools": {
                "sSwfPath": "./js/TableTools-2.2.1/swf/copy_csv_xls_pdf.swf",
                "aButtons": ["copy", "csv", "pdf"]
            },
				
				
		
		}); 
	});			
	</script>


	
</body>
</html>

