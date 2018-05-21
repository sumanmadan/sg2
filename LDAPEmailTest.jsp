

<%@ page import= "java.util.Hashtable"%>
<%@ page import= "java.util.LinkedList"%>
<%@ page import= "javax.naming.Context"%>
<%@ page import= "javax.naming.NamingEnumeration"%>
<%@ page import= "javax.naming.NamingException"%>
<%@ page import= "javax.naming.directory.Attribute"%>
<%@ page import= "javax.naming.directory.Attributes"%>
<%@ page import= "javax.naming.directory.DirContext"%>
<%@ page import= "javax.naming.directory.InitialDirContext"%>
<%@ page import= "javax.naming.directory.SearchControls"%>
<%@ page import= "javax.naming.directory.SearchResult"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=ISO-8859-1">

</head>
<body>
<div id = estpd>
<% 
//String cname = request.getAttribute("hello").toString();

String cname = request.getParameter("cname");

Hashtable env = new Hashtable();
env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
env.put(Context.PROVIDER_URL,"ldap://lfcldapv.gfoundries.com:389/ou=LFC,dc=gfoundries,dc=com");
//env.put("com.sun.jndi.ldap.connect.timeout", "5000");  
//OU=LFC, DC=gfoundries, DC=com
String newFilter="";
DirContext ctx;
try {
   ctx = new InitialDirContext(env);
} catch (NamingException e) {
   throw new RuntimeException(e);
} 

LinkedList list = new LinkedList();
NamingEnumeration results = null;
NamingEnumeration MgrResults = null;
try {
   SearchControls controls =
   new SearchControls();
   controls.setSearchScope(SearchControls.SUBTREE_SCOPE);
  
   //String filter = "(CN=*bharadw*)";
   String filter = "(CN=*" + cname + "*)" ;
   
   results = ctx.search("", filter,controls);
 
   while (results.hasMore()) {
      SearchResult searchResult =
         (SearchResult) results.next();
      Attributes attributes =
      searchResult.getAttributes();

      Attribute attr = attributes.get("cn");
      Attribute managerAttribute = attributes.get("manager"); // this is just getting the manager's CN value. Not the email ID.
      String cn="abc";
      try {
      cn = (String) attr.get();
      Attribute mm = attributes.get("mail");
      String m="";
      String manager ="";
      manager = (String) managerAttribute.get();
      m = (String) mm.get();
      %>
       
     
      
      <% 
      String[] onlyName = cn.split("-") ;   
      //manager CN=Sun\, Da Peng - e9748,OU=StandardAccounts,OU=Users,OU=LFC,DC=gfoundries,DC=com
      System.out.println(m + " bah..." + cn + " manager " + manager + "Only Name" + onlyName[0].trim());
      %>
      <p><%=m%></p>
      <p><%=onlyName[0].trim()%></p>
      <% 
      String[] temp = manager.split(",");
      String t1 = temp[1].trim();
      newFilter = "(CN=*" + t1 + "*)";
      
      MgrResults = ctx.search("", newFilter,controls);
     
      // now lookup the manger
      
      while (MgrResults.hasMore()) {
     	  System.out.println ( "stup1");
     	  SearchResult sr =  (SearchResult) MgrResults.next();
           attributes =   sr.getAttributes();
           attr = attributes.get("cn");
           mm = attributes.get("mail");
     	  String mgrEmail = (String) mm.get();
     	  cn = (String) attr.get();
     	  System.out.println("Manager's Email " + mgrEmail );
     	 
      }
      
      
      } catch (Exception xx) {}
      }
      //list.add(cn);
   
   
   
  
   
   
} catch (Exception ex) {
   // The base context was not found.
   // Just clean up and exit.
//} catch (NamingException e) {
 //  throw new RuntimeException(e);
	  ex.printStackTrace();
} finally {
   if (results != null) {
      try {
         results.close();
      } catch (Exception e) {
         // Never mind this.
      }
   }
   if (ctx != null) {
      try {
         ctx.close();
      } catch (Exception e) {
         // Never mind this.
      }
   }
} 





%>

</div>
</body>
</html>
