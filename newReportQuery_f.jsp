
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
<link href="mobile_2.css" type="text/css" media="screen and (max-device-width: 480px) and (resolution: 240dpi)" rel="stylesheet"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
table, td {
   border: 1px solid black;
}

</style>
<body>

<%
String sql = request.getParameter("sql");
System.out.println("ssss  " + sql);
%> 


<%java.sql.Connection con;
java.sql.Statement s;
java.sql.ResultSet rs;
java.sql.PreparedStatement pst;
con=null;
s=null;
rs=null;

String url=  "jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1";
String id= "f8tdtest";
String pass = "f8tdtest";
String ssq ="";

%>



<div id="tableWrap">
<table id="tt" style="position: absolute; color:blue;border:2px solid ;rules:rows;height: auto;width: auto; font-family: verdana, arial, helvetica, sans-serif;font-size:10px; cellspacing:0;">
<thead> 
<TR>
<th> Priority</th>
<th> Ticket number</th>
<th> Test Type</th>
<th> Test Family</th>
<th> Technology</th>
<th> Product</th>
<th> Sampling</th>
<th> Temp</th>
<th> Submitted By</th>
<th> Fname</th>
<th> Required date</th>
<th> Submitted date</th>
<th> All Status</th>
</tr>
</thead> 
<tbody> 
<% 

try{
Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);
}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();
}



//System.out.println("blllll->" + sql);
try{
s = con.createStatement();
rs = s.executeQuery(sql);
%>

<%
int i=0;
while( rs.next() ){
	i++;
%>

<tr>
<td><%= rs.getString("priority") %></td>
<% String idd ="select * from msr_data_f where ticket_no=" + rs.getString("ticket_no"); %>
<td><div class="one"><a href="<%=request.getContextPath()%>/QueryStringD_F?id=<%=idd%>" target="_Blank"><%=  rs.getString("ticket_no")%></a></div></td>

<td style="text-transform:uppercase"><%= rs.getString("g2") %></td>
<td style="text-transform:uppercase"><%= rs.getString("g3") %></td>
<td style="text-transform:uppercase"><%=rs.getString("tech") %></td>
<td style="text-transform:uppercase"><%=rs.getString("prod").trim() %></td>
<td><%= rs.getString("sampling") %></td>
<td><%= rs.getString("temp") %></td>
<td><%= rs.getString("login_id") %></td>
<% 
  if ( rs.getString("fname").equalsIgnoreCase("No attachment")) {
	   
	   String ff  = "No attachment" ;
	   %>
	  <!--  <td><a href="<%=request.getContextPath()%>/QueryString?id=ff%"><%=ff%></a></td>-->
	  <td class="fixed-width"><%=ff%></td>
   <% } else {
	 
      String ff =  rs.getString("fname");
     
      %>
    <td><div class="one"><a href="<%=request.getContextPath()%>/QueryString?id=<%=ff%>">Click to open file</a></td></div>
     <% 
   }
%>




<td><%= rs.getString("rdate") %></td>
<td><%= rs.getString("add_time") %></td>
<% String desc = rs.getString("full_list"); %>

<% if (desc.indexOf("Assigned") >0 && desc.indexOf("Completed") < 0 && desc.indexOf("Rejected") < 0) {
	%>
	<td bgcolor="Orange"><%= desc.replaceAll("#", "\n")%></td>
	<% }else if (desc.indexOf("Completed") > 0) { %>
	<td bgcolor="LightPink"><%= desc.replaceAll("#", "\n")%></td>
	<% }else if ( (desc.indexOf("Rejected") > 0) || ( desc.indexOf("Assigned") >0 && desc.indexOf("Rejected") > 0)) { %>
	<td bgcolor="lightblue"><%= desc.replaceAll("#", "\n")%></td>	
	
	<% }else { %>
	<td bgcolor="lightgreen"><%= desc.replaceAll("#", "\n")%></td>	
	<% } %>




</tr>

 <%
 
}
%>

<%

}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
}

%>
</tbody> 
</table>
</div>
</body>
</html>





