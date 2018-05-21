<%@ page import="org.apache.commons.mail.*"%> 
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
SimpleEmail email = new SimpleEmail(); 
email.setHostName("localhost"); 
email.addTo("TO", "Suman.Bharadwaj@globalfoundries.com"); 
email.setFrom("FROM", "Suman.Bharadwaj@globalfoundries.com"); 
email.setSubject("Test message"); 
email.setMsg("This is a simple test of commons-email"); 
email.send(); 
%> 
 
</body>
</html>