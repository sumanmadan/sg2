<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="javax.mail.Session" %>
<%@page import="javax.mail.Message" %>
<%@page import="javax.mail.Transport" %>
<%@page import="javax.mail.internet.InternetAddress" %>
<%@page import="javax.mail.internet.MimeMessage" %>
<%@page import="java.util.Date" %>
<%@page import="javax.swing.*" %>
<%@page import="javax.activation.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
try {
	

  Properties props = new Properties();
  props.put("mail.smtp.host", "localhost");
  Session s = Session.getInstance(props);
  s.setDebug(true) ;
  MimeMessage message = new MimeMessage(s);
  InternetAddress from = new InternetAddress("fc8tdtsr@globalfoundries.com");
  message.setFrom(from);
  
  String status =request.getAttribute("message_long").toString();
 // InternetAddress to = new InternetAddress("suman.bharadwaj@globalfoundries.com");
 // message.addRecipient(Message.RecipientType.TO, to);
 
           String file = "/users/service/fc8tdtsr/msgId_f.txt" ;
           //String file = "/users/service/fc8tdtsr/msgId_test.txt" ;
          // String file = "c:\\yp\\aFile.txt" ;
           // System.out.println(file);
            
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String[] to = null;
            String line;
            List<String> lines = new ArrayList<String>();
            while((line = reader.readLine())!= null){
              lines.add(line + ",");
            }
            
  //Adding the requestor's email id -           
  String tb = request.getAttribute("eemail").toString();
  //System.out.println("tb....." + tb);
  String tticketno =  request.getAttribute("tt").toString();
  lines.add(tb);                    
          
  to = lines.toArray(new String[]{});
  System.out.println("to" +to);
 
 //String[] to =  {"suman.bharadwaj@globalfoundries.com","suman.bharadwaj@globalfoundries.com","suman.bharadwaj@globalfoundries.com","suman.bharadwaj@globalfoundries.com"};
 //InternetAddress[] addressTo = new InternetAddress[to.length];
 InternetAddress[] addressTo = new InternetAddress[to.length];
          //  for (int i = 0; i < to.length; i++)
        	   for (int i = 0; i < to.length; i++)
            {
                addressTo[i] = new InternetAddress(to[i]);
            }
          
          
          
  message.setRecipients(Message.RecipientType.TO, addressTo); 
  
  
  String content =request.getAttribute("message_long").toString();
  
  String link = "Link to Webpage 							: http://fc8tdyt03.gfoundries.com:8080/MSR/mainPage.jsp";
  String link1= "Click to check your Ticket/Updates	: http://fc8tdyt03.gfoundries.com:8080/MSR/ticketLinkF?id=" + tticketno  ;
  String note = "PLEASE DO NOT REPLY TO : fc8tdtsr@globalfoundries.com " ;
  content =  "Ticket No# : " + tticketno + "\n" +  content + "\n" + "\n"  +   link + "\n"  + link1  + "\n" + "\n" + note;
    
  String subjectH = "Test Request System-New Functional Request " + " Ticket No#" + tticketno;
  
  content = content.replace("\n", "<br />");
  String fout = request.getAttribute("fout").toString();
  if ( fout.equalsIgnoreCase("No attachment")) {
   content = (content != null) ? content : "Functional Test Request. \n\n" + ( new Date() ).toString();
   System.out.println("dsfsdfsdf COnt " + content);
   //message.setText(content);
   message.setHeader("X-Mailer", "Testing");
   message.addHeader("Content-Type", "text/html; charset=UTF-8");
   message.addHeader("charset", "UTF-8");
   message.setContent( content, "text/html");
  // message.setSubject("Test Request System - New Functional Request,Check the Web Link");
  message.setSubject(subjectH);
   message.saveChanges();
  Transport.send(message);
  } else {
	   content = (content != null) ? content : "Functional Test Request. \n\n" + ( new Date() ).toString();
	   System.out.println("dsfsdfsdf COnt " + content);
	   //message.setText(content);
	   message.setHeader("X-Mailer", "Testing");
	   message.addHeader("Content-Type", "text/html; charset=UTF-8");
	   message.addHeader("charset", "UTF-8");
	 // message.setContent( content, "text/plain");
	  //Create the message part
	  BodyPart messageBodyPart = new MimeBodyPart();
	  //Fill the message
	  messageBodyPart.setContent(content, "text/html");
	  Multipart multipart = new MimeMultipart();
	  multipart.addBodyPart(messageBodyPart);
	  //Part two is attachment
	  messageBodyPart = new MimeBodyPart();
	  String filename = fout;
	  DataSource source = new FileDataSource(filename);
	  messageBodyPart.setDataHandler(new DataHandler(source));
	  messageBodyPart.setFileName(filename);
	  multipart.addBodyPart(messageBodyPart);
	  //Put parts in message
	  message.setContent(multipart);
	 // message.setSubject("Test Request System - New Functional Request, Check the Web Link");
	  message.setSubject(subjectH);
	  message.saveChanges();
	  Transport.send(message);
  }  
	  
	 
  reader.close();
  
}catch(Exception xx) {xx.printStackTrace();}
%>
<html>
<p align="center">A Message has been sent on the Request to the Functional Group<br></p>
<h2>Status:<%=request.getAttribute("message_long")%></h2>
<p align="center"><a href="funcPage_DB.jsp">Click here to send another!</a></p>
<!-- </h1><a href="#">Main Menu</a></h1>  -->
</html>

