
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import java.util.List;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class uploadServlet
 */
import java.io.*;
import java.sql.*;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/updateServlet_assign_p_db_P")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class updateServlet_assign_p_db_P extends HttpServlet {
     
    // database connection settings
  

String dbURL=  "jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1";
String dbUser= "f8tdtest";
String dbPass = "f8tdtest";
String message = "";
    
    Connection conn = null; // connection to the database
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
    	String status="";
        String assignee=""; 
        String ticket_no="";
        String comm="";
        String message_long="";
        String eemail = "";
        String prio = "";
        	
    	response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
    	out.println("<html><head>");
        out.println("<title>Updating at server</title>");
        out.println("</head>");
        out.println("<body>");
        Enumeration<?> parameters = request.getParameterNames();
        Map<String, String[]> map = request.getParameterMap();
        Set<Entry<String, String[]>> set = map.entrySet();
        Iterator<Entry<String, String[]>> it = set.iterator();
           String param=null;
           while (parameters.hasMoreElements())
              {
                    param=(String)parameters.nextElement();                  
                    //out.println(param + ":" + request.getParameter(param) + "<br>" );                  
               }
           
    	  Connection con = null;
    	  PreparedStatement stmt = null;
    	
    	  List<String> t = new ArrayList<String>();
          List<String> a = new ArrayList<String>();
    	  List<String> b = new ArrayList<String>();
    	  List<String> c = new ArrayList<String>();
    	  List<String> mm = new ArrayList<String>();
    	  List<String> pp = new ArrayList<String>();
    	    try {
    	    	 DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    	         con= DriverManager.getConnection(dbURL, dbUser, dbPass);

    	      // Turn on transactions
    	      con.setAutoCommit(false);
    	      set = map.entrySet();
              it = set.iterator();
    	      while (it.hasNext()) {
                    	 Map.Entry<String, String[]> entry =  (Entry<String, String[]>) it.next();
                         String paramName = entry.getKey();
                         String[] paramValues;
                         //out.print("bbbbb " + paramName);
                        
                         if ( paramName.matches("category")) {
                        	  paramValues = entry.getValue();
                        	  //out.println("sdf" + "\n");
                         for (int i = 0; i < paramValues.length; i++) {
                        	      // out.print("ccccc  --" + paramValues[i]);
                               	   a.add(paramValues[i].toString().trim());
                            	 
                               } 
                         } 
                         
                         
                           if (paramName.matches("ticckk" )) {
                        	   paramValues = entry.getValue();
                        	  // out.println("hhsdf");
                        	   for (int i = 0; i < paramValues.length; i++) {
                            	   ticket_no = paramValues[i];
                            	   t.add(paramValues[i].toString().trim());
                        	   }
                            }
                               
                             if (paramName.matches( "sstatus" )) {
                            	   paramValues = entry.getValue();
                            	   //out.println("iisdf");
                            	   for (int i = 0; i < paramValues.length; i++) {
                            		// out.print("status  --" + paramValues[i]);
                            		 status = paramValues[i];
                            	     b.add(paramValues[i].toString().trim());
                            	   }
                               }
                             
                             
                             if (paramName.matches( "ccomment" )) {
                          	   paramValues = entry.getValue();
                          	   //out.println("iisdf");
                          	   for (int i = 0; i < paramValues.length; i++) {
                          		 System.out.println("comment  --" + paramValues[i]);
                          		 comm = paramValues[i];
                          		 if ( comm.trim().isEmpty()) { comm = "none";}
                          	     c.add(paramValues[i].toString().trim());
                          	   }
                             }
                             
                             if (paramName.matches( "eemail" )) {
                          	   paramValues = entry.getValue();
                          	   //out.println("iisdf");
                          	   for (int i = 0; i < paramValues.length; i++) {
                          		 System.out.println("eemail  --" + paramValues[i]);
                          		 //comm = paramValues[i];
                          		 eemail = paramValues[i];
                          		 if ( eemail.trim().isEmpty()) { eemail = "none";}
                          	     mm.add(paramValues[i].toString().trim());
                          	   }
                             }
                             
                             if (paramName.matches( "prio" )) {
                            	   paramValues = entry.getValue();
                            	   //out.println("iisdf");
                            	   for (int i = 0; i < paramValues.length; i++) {
                            		 System.out.println("Priorityy  --" + paramValues[i]);
                            		 //comm = paramValues[i];
                            		 prio = paramValues[i];
                            		 if ( prio.trim().isEmpty()) { prio = "none";}
                            	     pp.add(paramValues[i].toString().trim());
                            	   }
                               }
                             
    	            }
               
    	     // System.out.println("For " + t.size() + "  bbbbb -- "  +  b.size() + " aaa---- " + a.size() + "\n"  ); 
    	      try{
    	           for ( int j = 0; j < b.size();j++)
    	           {
    	        	     int n =0;
    	        	     assignee = a.get(j).toString();
    	        	     status = b.get(j).toString();
    	        	     ticket_no = t.get(j).toString();
    	        	     comm = c.get(j).toString();
    	        	     eemail = mm.get(j).toString();
    	        	     prio = pp.get(j).toString();
    	        	     System.out.println("For " + assignee + status + "\n"  );
    	        	    // String notlikeStat ="%" +  status + "%";
    	        	    // String notlikeAss = "%" + assignee + "%";
    	        	     
    	        	     int tt = Integer.parseInt(ticket_no);
    	                 System.out.println("For " + assignee + ticket_no + status + "\n"  );
                         String st= "";
                         //st = "UPDATE msr_data SET assignee=concat(assignee , ?)"  +  "where ticket_no=?"   + " and assignee not like ?";
                         if ( assignee.equalsIgnoreCase("None") || status.equalsIgnoreCase("None")) {
                        	 
                        	 //dont do anything!!
                        	 
                         } else {
                        	 
                         java.util.Date today = new java.util.Date();
                         java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
                         System.out.println(getCurrentJavaSqlTime() + "...what is it ..." + timestamp  + "....." + prio);
                           
                         String str =  "" +  getCurrentJavaSqlDate() +  " " + getCurrentJavaSqlTime();
                        	 
            	         st = "Insert into msr_assign_p(ticket_no,assignee,status,comments,updated_time,priority) values (?,?,?,?,?,?)";
            	         stmt =con.prepareStatement(st);
            	         stmt.setInt(1,tt);
                         stmt.setString(2,assignee);
                         stmt.setString(3,status);
                         stmt.setString(4,comm);
                         stmt.setString(5,str);
                         stmt.setString(6,prio);
                         //System.out.println("gggggg" + stmt);
                         message_long = "Ticket_no :" + ticket_no + "\n" + "Assignee :" + assignee + "\n" + "Status :" + status + "\n" + "Comments : " + comm + "\n" + "Updated time :" +  str + "\n" + "Coming with Priority : " + prio ;    
                         n = stmt.executeUpdate();
                        
                         try {
                             //To send email now - 
                             Properties props = new Properties();
                             props.put("mail.smtp.host", "localhost");
                             Session s = Session.getInstance(props);
                             s.setDebug(true) ;
                             MimeMessage message = new MimeMessage(s);
                             InternetAddress from = new InternetAddress("fc8tdtsr@globalfoundries.com");
                             message.setFrom(from);
                             
                             String file = "/users/service/fc8tdtsr/msgId_p.txt" ;
                             // String file = "c:\\yp\\aFile.txt" ;
                               System.out.println(file);
                               
                               BufferedReader reader = new BufferedReader(new FileReader(file));
                               String[] to = null;
                               String line;
                               List<String> mlines = new ArrayList<String>();
                               while((line = reader.readLine())!= null){
                                 mlines.add(line + ",");
                               }
                               mlines.add(eemail);
                               to = mlines.toArray(new String[]{});
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
                     
                     
                     String content=message_long;
                     
                     String link = "Link to Webpage 							: http://fc8tdyt03.gfoundries.com:8080/MSR/mainPage.jsp";
                     String link1= "Click to check your Ticket/Updates	: http://fc8tdyt03.gfoundries.com:8080/MSR/ticketLinkP?id=" + ticket_no  ;
                     String note = "PLEASE DO NOT REPLY TO : fc8tdtsr@globalfoundries.com " ;
                     content = content + "link" + "\n" + link1 + "\n" + note ;
                     
                     content = content.replace("\n", "<br />");
                     
                     String fout ="No attachment";
                     if ( fout.equalsIgnoreCase("No attachment")) {
                      content = (content != null) ? content : "Parametric Test Request Update. \n\n" + str;
                      System.out.println("dsfsdfsdf COnt " + content);
                      //message.setText(content);
                      message.setHeader("X-Mailer", "Testing");
                      message.addHeader("Content-Type", "text/plain; charset=UTF-8");
                      message.addHeader("charset", "UTF-8");
                      message.setContent( content, "text/html");
                      message.setSubject("Test Request System-Parametric Request is Updated-Ticket#" +ticket_no);
                      message.saveChanges();
                     Transport.send(message);
                     } else {
                   	  content = (content != null) ? content : "Parametric Test Request. \n\n" + str;
                   	   System.out.println("dsfsdfsdf Cont " + content);
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
                   	  message.setSubject("Test Request System-Parametric Request is-Ticket#" +ticket_no);
                   	  message.saveChanges();
                   	  Transport.send(message);
                     }  
                   	  } catch (Exception xx) {}
                         
                     } 
                        
                         
                    }
              
             
            	
              
              
                
    	           con.commit();
    	           message ="Records Updated" ;
    	      } catch(Exception xx){ xx.printStackTrace();}
    	     
    	     
    	      
    	    }
    	    catch (Exception e) {
    	    	e.printStackTrace();
    	      // Any error is grounds for rollback
    	     try {
    	        con.rollback();
    	      }
    	      catch (SQLException ignored) { }
    	    	e.printStackTrace();
    	    	message="Some Error, Please contact Technical Support";
    	        //out.println("Some Error. Please contact technical support" + e.getLocalizedMessage());
    	    }
    	    finally {
    	      // Clean up.
    	      try {
    	    	 
    	    	if ( stmt != null){
    	    		stmt.close();
    	    	}
    	        if (con != null) 
    	        	con.setAutoCommit(true);
    	        	con.close();
    	        
    	      }
    	      catch (SQLException ignored) { }
    	    }
    	   // getServletContext().getRequestDispatcher("/reportPageAssign_disp.jsp").forward(request, response);
    	    request.setAttribute("message_long", message_long);
    	    getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
    	    
    	   // getServletContext().getRequestDispatcher("/mailx_update_p.jsp").forward(request, response);
     
    }
    public static java.sql.Date getCurrentJavaSqlDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
      }
    public static java.sql.Time getCurrentJavaSqlTime() {
        java.util.Date date = new java.util.Date();
        return new java.sql.Time(date.getTime());
      }
    
    private static java.sql.Timestamp getCurrentTimeStamp() {
    	 
    	java.util.Date today = new java.util.Date();
    	return new java.sql.Timestamp(today.getTime());
     
    }
    
   
    
}



