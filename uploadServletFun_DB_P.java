



import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class uploadServlet
 */
import java.io.*;
import javax.servlet.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.lang.*;
import java.text.*;
import java.io.PrintWriter;
import java.util.Enumeration;


@WebServlet("/uploadServletFun_DB_P")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB

/*  Suman Bharadwaj, Apr-May 2013 
This is for the the Test Request System
#Jan 2014
###Changes to include the priority
*/

public class uploadServletFun_DB_P extends HttpServlet {
	
    // database connection settings
	private static String dbURL = "jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1";
	private static String dbUser = "f8tdtest";
	private static String dbPass = "f8tdtest";
	private static Connection conn; 

    
    public  uploadServletFun_DB_P() {
    	
    }
    public static Connection loadDriver() throws SQLException {

        try {

        	 DriverManager.registerDriver(new com.mysql.jdbc.Driver());

        } catch (Exception ex) {

          System.out.println(ex.getMessage());

        }

        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        return conn;

    }
   
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

    	
    	 response.setContentType("text/plain");
         PrintWriter pout = response.getWriter();
    	 Enumeration parameters = request.getParameterNames();
         Map<String, String[]> map = request.getParameterMap();
         Set set = map.entrySet();
         Iterator it = set.iterator();
            String param=null;
            
             while (parameters.hasMoreElements())
             {
                  param=(String)parameters.nextElement();                  
                  System.out.println(param + ":" + request.getParameter(param) + "<br>" );                  
            }	
    	
     String ttt="";
     String getTicketStr="";	
     String wfr="";
     String[] funcWaferOptions = request.getParameterValues("c1[]");	
     String g1 = "Functional";
   	 String g2 = request.getParameter("group2");
   	 String g3 = request.getParameter("group3");
   	 String ct = request.getParameter("comment");
   	 String lp=request.getParameter("lotpurpose");
   	 String lot = request.getParameter("lot");
   	
   	 String samp=request.getParameter("sampling");
   	 String tempr =request.getParameter("temp");
     //System.out.println("BBBB  " + lp);
     //System.out.println("CCCC  " + ct);
   	// String login_id = System.getenv("USERNAME");
   	// String login_id  =System.getProperty("user.name");
   	 
    // String login_id_f= System.getProperty("user.home");
   	// String login_id = login_id_f.substring(login_id_f.lastIndexOf('\\') + 1);
   	 String login_id = request.getParameter("lloginn");
   	 String rdate = request.getParameter("rdate");
   	 String prod = request.getParameter("pdt");
   	 String tech = request.getParameter("tech");
   	 String spdt = request.getParameter("spdt");
   	 String justification = request.getParameter("justification");
   	 String details = request.getParameter("details");
 	 String eemail = request.getParameter("eemail");
   	 String ffname="";
     String root=""; String last="";
     String fout = "No attachment";
     String sdate = "02052013";
     DateFormat df = new SimpleDateFormat("ddMMyyyy");
     Date date = new Date();
    
     String status = "Unassigned";
     String assignee = "None";
     
     String reqdate="";
     
     String message = "";
     String message_long = "";
     
     String printt="";
     String priority = request.getParameter("Prio");
     
     try {
    	/* sdate = df.format(date);
       
         if ( rdate.length() == 0) {
        	 rdate = sdate;
        	 reqdate = rdate;
         } else {
         String[] tokens = rdate.split("-");
         String day = tokens[0];
         String month = tokens[1];
         String year = tokens[2];
         
          reqdate = day + month + year;
         } */
       
         System.out.println("PDT"  + prod);
         System.out.println("TTecch"  + tech); 
    	 
    	 
    	 
    	 
    	 
    	 
     for( int jj=0; jj<funcWaferOptions.length; jj++) {
    	 wfr = wfr + "," + funcWaferOptions[jj].toString();
	     System.out.println("bah bahvvvv:" + wfr);
     }
     } catch (Exception xxxx) { xxxx.getMessage();}
     
     
     wfr = wfr.startsWith(",") ? wfr.substring(1) : wfr;
    // System.out.println("bah   "  + wfr)   ;
	//String printt ="Functional Request " + "\n" + login_id  + "\n"  + g1 + "\n" + g2 + "\n"  + g3 + "\n" + ct + "\n" + lp + "\n" + lot + "\n" + wfr + "\n" + samp + "\n" + tempr + "\n" + "filename " + ffname;
   	 
    //String printt ="New Request : " + "\n" + "Submitted by :" + login_id  + "\n"  +"** :" + g1 + "\n" +"** :"+  g2 + "\n"  +"** :"+  g3 + "\n" +"Comments : "+  ct + "\n" + "Lot purpose :" + lp + "\n" + "Lot :" + lot + "\n" + "Wafer :" + wfr + "\n" + "Sampling " + samp + "\n" +  "Temperature : " + tempr + "\n" + "Attached file Name:" + "filename " + ffname;   System.out.println("sdfsdf"  + printt)   ;
     InputStream inputStream = null; // input stream of the upload file
     OutputStream out = null;
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("attach");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println("Name :" + filePart.getName());
            System.out.println("Size :" + filePart.getSize());
            System.out.println("type :" + filePart.getContentType());
            ffname = getFileName(filePart);
            System.out.println("ffname :" +  getFileName(filePart));
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        try{ 
        // connection to the database
         message = null;  // message will be sent back to client
           
            if (ffname.trim().length() > 0) {
              // fetches input stream of the upload file for the blob column
              //  statement.setBlob(3, inputStream);
            //root = "c:\\file_uploads\\";
            	String ttime = getCurrentJavaSqlTime().toString().replaceAll(":", "-");
            	String tstr =  "_" +  getCurrentJavaSqlDate() +  "_" + ttime+ "_";
            	//String tstr =  "_" +  getCurrentJavaSqlDate() +  "_" + getCurrentJavaSqlTime();
            	root = "/users/service/fc8tdtsr/msr_files/";
            	last = ffname.substring(ffname.lastIndexOf('\\') + 1);
                fout = root + login_id + "_" + "func"  + tstr +  last;
                fout = fout.replaceAll("\\s+", "_");
               
                
            }
            System.out.println("ffname :" +  fout);
            // constructs SQL statement
          // String sql = " update msr_ticket set fname = ? where ticket_no= ? ";
//String sqldata = "INSERT INTO msr_data (ticket_no,prod,tech,g1,g2,g3,comment,lotpurpose,lot,wafers,sampling,temp,login_id,fname,sdate,rdate,status,assignee) values (null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//String sqldata = "INSERT INTO msr_data(add_status,prod,spdt,tech,g1,g2,g3,comment,lotpurpose,lot,wafers,sampling,metal_layer,temp,login_id,fname,sdate,rdate,status,assignee) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";          
//String sqldata=" update msr_data set add_status = ?,prod = ?,tech =?, g1=?, g2=?, g3=?, comment=?, lotpurpose=?, lot=?, wafers=?, sampling=?, temp=?, login_id=?, fname=?, sdate=?, rdate=?, status=?, assignee=? where ticket_no=? ";
// message_long ="New Request : " + "\n" + "Submitted by :" + login_id  + "\n"  + "Technology :" + tech + "\n" + "Product : " + prod + "\n"  + "Sub Prodcut :"  + spdt + "\n" +  "** :" + g1 + "\n" +"** :"+  g2 + "\n"  +"** :"+  g3 + "\n" +"Comments : "+  ct + "\n" + "Lot purpose :" + lp + "\n" + "Lot :" + lot + "\n" + "Wafer :" + wfr + "\n" + "Sampling " + samp + "\n" +  "Temperature : " + tempr + "\n" + "Justification :" + justification + "\n" + "Details :" + details + "\n" + "Attached file Name:" + "filename " + fout;   
// printt ="New Request : " + "\n" + "Submitted by :" + login_id  + "\n"  + "Technology :" + tech + "\n" + "Product : " + prod + "\n"  + "Sub Prodcut :"  + spdt + "\n" +  "** :" + g1 + "\n" +"** :"+  g2 + "\n"  +"** :"+  g3 + "\n" +"Comments : "+  ct + "\n" + "Lot purpose :" + lp + "\n" + "Lot :" + lot + "\n" + "Wafer :" + wfr + "\n" + "Sampling " + samp + "\n" +  "Temperature : " + tempr + "\n" + "Justification :" + justification + "\n" + "Details :" + details + "\n" + "Attached file Name:" + "filename " + fout;
message_long ="New Request : " + "\n" + "\r" + "Submitted by :" + "\r" + login_id  + "\n"  + "Technology :" + tech + "\n" + "Product : " + prod + "\n"  + "Sub Prodcut :"  + spdt + "\n" +  "** :" + g1 + "\n" +"** :"+  g2 + "\n"  +"** :"+  g3 + "\n" +"Comments : "+  ct + "\n" + "Lot purpose :" + lp + "\n" + "Lot :" + lot + "\n" + "Wafer :" + wfr + "\n" + "Sampling " + samp + "\n" +  "Temperature : " + tempr + "\n" + "Justification :" + justification + "\n" + "Details :" + details + "\n" + "Attached file Name:" + "filename " + fout + "\n" + "Priority" + priority;;   
printt ="New Request : " + "\n" + "\r" + "Submitted by :" + login_id  +   "\r" + "\n"  + "Technology :" + tech + "\n" + "Product : " + prod + "\n"  + "Sub Prodcut :"  + spdt + "\n" +  "** :" + g1 + "\n" +"** :"+  g2 + "\n"  +"** :"+  g3 + "\n" +"Comments : "+  ct + "\n" + "Lot purpose :" + lp + "\n" + "Lot :" + lot + "\n" + "Wafer :" + wfr + "\n" + "Sampling " + samp + "\n" +  "Temperature : " + tempr + "\n" + "Justification :" + justification + "\n" + "Details :" + details + "\n" + "Attached file Name:" + "filename " + fout + "\n" + "Priority" + priority;;            
System.out.println("sdfsdf"  + printt)   ;     
String sqldata = "INSERT INTO msr_data_f(ticket_no,add_status,prod,spdt,tech,g1,g2,g3,comments,lotpurpose,lot,wafers,sampling,metal_layer,temp,login_id,fname,sdate,rdate,status,assignee,add_time,justification,details,eemail,priority) values (seq_ticket_no_f.nextVal,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";        //  PreparedStatement statement = conn.prepareStatement(sql);
         //  statement.setString(1, fout);
         //  statement.setInt(2,stp);
        conn = loadDriver();
       
         int r=0;
         try { 
           
         PreparedStatement statement_data = conn.prepareStatement(sqldata);
         String subDate = "" +  getCurrentJavaSqlDate();
          // statement_data.setString(1,ticketno);
         statement_data.setString(1,"added");
         statement_data.setString(2,prod);
         statement_data.setString(3,spdt);
         statement_data.setString(4,tech);
         statement_data.setString(5,g1);
         statement_data.setString(6,g2);
         statement_data.setString(7,g3);
         statement_data.setString(8,ct);
         statement_data.setString(9,lp);
         statement_data.setString(10,lot);
         statement_data.setString(11,wfr);
         statement_data.setString(12,samp);
         statement_data.setString(13,"metal_none");
         statement_data.setString(14,tempr);
         statement_data.setString(15,login_id);
         statement_data.setString(16,fout);
         statement_data.setString(17,subDate);
         statement_data.setString(18,rdate);
         statement_data.setString(19,status);
         statement_data.setString(20,assignee);
        
           // sends the statement to the database server
           // int row = statement.executeUpdate();
  
         
         
         java.util.Date today = new java.util.Date();
         java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
         System.out.println(getCurrentJavaSqlTime() + "...what is it ..." + timestamp  );
       
         String str =  "" +  getCurrentJavaSqlDate() +  " " + getCurrentJavaSqlTime() ;
     
         System.out.println( "---- what is it----" + str  );
        // to_timestamp('2003/12/13 10:13:18', 'YYYY/MM/DD HH:MI:SS')
   
        
    //   statement_data.setObject(20,getCurrentTimeStamp());
         
       statement_data.setString(21,str);
       statement_data.setString(22,justification);
       statement_data.setString(23,details);
       statement_data.setString(24,eemail);
       statement_data.setString(25,priority);
       System.out.println("After binding " + statement_data);
         
           r= statement_data.executeUpdate();
            
           } catch(Exception xx) { xx.printStackTrace();
           xx.getMessage();
           }
      
           if (ffname.trim().length() > 0) {
      
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
              //  statement.setBlob(3, inputStream);
            	
                System.out.println("Saved as :" + fout);
                File file = new File(fout);
            	
               	try {
            		// read this file into InputStream
            		
             
            		// write the inputStream to a FileOutputStream
               	
            		
                	out = new FileOutputStream(file);
            		int read = 0;
            		byte[] bytes = new byte[1024];
             
            		while ((read = inputStream.read(bytes)) != -1) {
            			out.write(bytes, 0, read);
            		}
             
            		System.out.println("Done!");
             
            	} catch (IOException e) {
            		e.printStackTrace();
            	} finally {
            		if (inputStream != null) {
            			try {
            				inputStream.close();
            			} catch (IOException e) {
            				e.printStackTrace();
            			}
            		}
            		
            		if (out != null) {
            			try {
            				// outputStream.flush();
            				out.close();
            			} catch (IOException e) {
            				e.printStackTrace();
            			}
             
            		}
            	}

    
            } //if input stream not null
           } //if filename not null
 
           getTicketStr ="";
           message_long = printt;
           try {
              getTicketStr =  doGetTicket();
           
           } catch (Exception x){}
          // ttt = "Ticket No# " + getTicketStr;
           ttt = getTicketStr.trim();
           System.out.println("what is the ticket no " + getTicketStr + ttt);
          
            if (  r> 0) {
                message = "Success  :" + "\n" + fout;
                
            } else {
            	message = "Failed ?" +  "\n" ;
            	doRoll("added");
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                	
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            

            
            // sets the message in request scope
            request.setAttribute("Message", message);
            request.setAttribute("message_long", message_long);
            //request.setAttribute("ticketno", ticketno);
            request.setAttribute("fout", fout);
            //to send the email to the user
            request.setAttribute("eemail", eemail);
            request.setAttribute("tt", ttt);
 
         // getServletContext().getRequestDispatcher("/messageF.jsp").forward(request, response);
         getServletContext().getRequestDispatcher("/mailjavax_f.jsp").forward(request, response);
        }
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
    
    private void doRoll(String s)
    {
    	
    	 //String sqlStr ="Delete FROM msr_data Where add_status != '" + s + "'";
    	String sqlStr ="Delete FROM msr_data_f Where add_status is NULL";

    	    try {
    	    
    	    	PreparedStatement statem = conn.prepareStatement(sqlStr);
    	    	statem.executeUpdate(sqlStr);
    	        System.out.println("deleting");

    	    } catch (SQLException e) {
    	        System.out.println("deleting - SQLException");
    	        e.printStackTrace();
    	    }
    	    
    	
    	
    }
    
    public String doGetTicket()
    {
    	  System.out.println("Coming into doGetTicket");
    	 //String sqlStr ="Delete FROM msr_data Where add_status != '" + s + "'";
    	   String sqlString ="select ticket_no from msr_data_f where ticket_no=(select max(ticket_no) from msr_data_f)";
    	   String id  = "Error";
           int getTick = 0;
    	    try {
    	    	Statement stmt =conn.createStatement();;
    	    	ResultSet rs = stmt.executeQuery(sqlString);
    	    	rs.next();
    	    	System.out.println("Coming into doGetTicket B..");
    	    	getTick = rs.getInt(1);
    	    	 //while(rs.next()){
    	    		// id  = String.valueOf(rs.getInt("ticket_no")).toString();
    	    		// getTick = rs.getInt("ticket_no");
    	             System.out.println("getting" + getTick);
    	        
    	    	 //}
    	    	 rs.close();
                 id = String.valueOf(getTick).toString();
    	    } catch (SQLException e) {
    	        System.out.println("getting - SQLException");
    	        e.printStackTrace();
    	        id = "Error";
    	    }
    	 
    	    return id;
    	
    	
    }
    
    
    
    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
       
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
    
}



