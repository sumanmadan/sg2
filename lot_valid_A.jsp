<%@ page language ="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%

String pdt = request.getParameter("lott");
//out.println("product..." + pdt + "<br>");

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
int desc=0;
String s1="", s2="";
// Remember to change the next line with your own environment 
//select str_to_date(sday,'%Y%m%d'), stime, tech product, lotid , waferid, testt, no, ttype, tool, mode, eday etime from TblTdDataLog where str_to_date(sday,'%Y%m%d') between '2013-03-17' and '2013-04-17';
 String Driver = "oracle.jdbc.driver.OracleDriver";
 String ConnectionString = "jdbc:oracle:thin:@fc8whp1:1521/saphp1.gfoundries.com";
 //String user = "N1004008";
 //String pwd = "Ridge2014a";
 String user = "YAS_SAPH";
 String pwd = "YAS_2013";
 
 
try{
Class.forName(Driver);
con = DriverManager.getConnection(ConnectionString, user, pwd);
//out.println("Connection established");
}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}
String sql = "select distinct count(lot_id) from lot  where lot_id ='" + pdt + "'"  ;
String sql1 = "select alias_wafer_name,wafer_id from wafer_identification where lot_id ='" + pdt + "'"  ;
//out.println("to sql..." + sql + "<br>");
try{
s = con.createStatement();
rs = s.executeQuery(sql);
while( rs.next() ){
       desc = rs.getInt(1);
     %><div id="sptd"> <p><%=desc%></p></div>
     <%     

}
%>
<div id="abc">
<form>

<% 
rs = s.executeQuery(sql1);

while( rs.next() ){
    s1 = rs.getString(1);
    s2= rs.getString(2);
    
  %> 
  
 
<input type="checkbox" name="c1[]"  value=<%=s1 %> ><%=s1 %> <%=s2%>

  


<%     

}


}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
}

%>
</div> 
</form>
</body>
</html>
