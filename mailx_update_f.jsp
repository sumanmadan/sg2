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
          // String file = "c:\\yp\\aFile.txt" ;
            System.out.println(file);
            
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String[] to = null;
            String line;
            List<String> lines = new ArrayList<String>();
            while((line = reader.readLine())!= null){
              lines.add(line + ",");
            }
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
  String fout ="No attachment";
  if ( fout.equalsIgnoreCase("No attachment")) {
   content = (content != null) ? content : "Functional Test Request Update. \n\n" + ( new Date() ).toString();
   System.out.println("dsfsdfsdf COnt " + content);
   //message.setText(content);
   message.setHeader("X-Mailer", "Testing");
   message.addHeader("Content-Type", "text/plain; charset=UTF-8");
   message.addHeader("charset", "UTF-8");
   message.setContent( content, "text/plain");
   message.setSubject("Test Request System-Functional Request is Updated");
   message.saveChanges();
  Transport.send(message);
  } else {
	  content = (content != null) ? content : "Functional Test Request. \n\n" + ( new Date() ).toString();
	   System.out.println("dsfsdfsdf COnt " + content);
	   //message.setText(content);
	   message.setHeader("X-Mailer", "Testing");
	   message.addHeader("Content-Type", "text/plain; charset=UTF-8");
	   message.addHeader("charset", "UTF-8");
	 // message.setContent( content, "text/plain");
	  //Create the message part
	  BodyPart messageBodyPart = new MimeBodyPart();
	  //Fill the message
	  messageBodyPart.setContent(content, "text/plain");
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
	  message.setSubject("Test Request System-Functional Request is Updated");
	  message.saveChanges();
	  Transport.send(message);
  }  
	  
	 
  
  
}catch(Exception xx) {xx.printStackTrace();}
%>
<html>
<p align="center">A Message has been sent on the Request to the Functional Group<br></p>
<h2>Status:<%=request.getAttribute("message_long")%></h2>
<!--  <p align="center"><a href="mailjavax.jsp">Click here to send another!</a></p>-->
</h1><a href="mainPage.jsp">Main Menu</a></h1>
</html>

