

import java.util.Properties;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class uploadServlet_DB
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

import javax.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import oracle.sql.TIMESTAMP;

import java.lang.*;
import java.text.*;


@WebServlet("/uploadServlet_DB_P")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB

/*  Suman Bharadwaj, Apr-May 2013 
This is for the the Test Reqeust System
#Jan 2014
###Changes to include the priority
*/

public class uploadServlet_DB_P extends HttpServlet {
     
	 // database connection settings
    private static String dbURL = "jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1";
    private static String dbUser = "f8tdtest";
    private static String dbPass = "f8tdtest";
    private static Connection conn; 
    private static Connection conn2; 
 public  uploadServlet_DB_P() {
    	
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
    
    
    
    public static Connection loadDriverSecond() throws SQLException {

        try {

        	 DriverManager.registerDriver(new com.mysql.jdbc.Driver());

        } catch (Exception ex) {

          System.out.println(ex.getMessage());

        }

        conn2 = DriverManager.getConnection(dbURL, dbUser, dbPass);

        return conn2;

    }
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
    String message = "";
    String message_long = "";
    String ttt="";
    String getTicketStr="";
    String g1 = "Parametric";
 
   	 String g2 = request.getParameter("group2");
   	 String g3 = request.getParameter("group3");
   	 String ct = request.getParameter("comment");
   	 String lotpurpose=request.getParameter("lotpurpose");
   	 String lot = request.getParameter("lot");
   	 
   	 String metal = request.getParameter("metal");
  
   	 String samp="none";
   	 String tempr = "none";
   	 String eemail = request.getParameter("eemail");
   	
  	 String ticketno = "tick";
   	
  	 String login_id = request.getParameter("lloginn");
   	
   	 String rdate = request.getParameter("rdate");
   	 String prod = request.getParameter("pdt");
   	 String tech = request.getParameter("tech");
   	 String spdt = "none";
     String[] funcWaferOptions = request.getParameterValues("c1[]");
     String printt="";
     String wfr = "";
     String priority = request.getParameter("Prio");
     try{
     for( int jj=0; jj<funcWaferOptions.length; jj++) {
    	 wfr = wfr + "," + funcWaferOptions[jj];
	     System.out.println("bah bahvvvv:" + wfr);
         }
     } catch (Exception cc) { cc.getMessage();}
      wfr = wfr.startsWith(",") ? wfr.substring(1) : wfr;
      System.out.println("bah   "  + wfr)   ;
      		 
    		 
     
   	 String ffname="";
     String root=""; String last="";
     String fout = "No attachment";
    
     String status = "Unassigned";
     String assignee = "None";
     System.out.println("PDT"  + prod);
     System.out.println("Tech"  + tech);
   	
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
         
          message = null;  // message will be sent back to client
         
        try {
            // connects to the database
        	
        	conn = loadDriver();
        	
        	
            if (ffname.trim().length() > 0) {
              // fetches input stream of the upload file for the blob column
              //  statement.setBlob(3, inputStream);
            	//root = "c:\\file_uploads\\";
            	String ttime = getCurrentJavaSqlTime().toString().replaceAll(":", "-");
            	String tstr =  "_" +  getCurrentJavaSqlDate() +  "_" + ttime+ "_";
            	root = "/users/service/fc8tdtsr/msr_files/";
            	last = ffname.substring(ffname.lastIndexOf('\\') + 1);
            	fout = root + login_id + "_" + "param"  + tstr + last;
            	fout = fout.replaceAll("\\s+", "_");
            	
                
            }
            System.out.println(" ffname :" +  fout);
           
            
         
 printt ="New Request : " + "\n" + "Submitted by :" + login_id  + "\n" + "Technology :" + tech + "\n" + "Product : " + prod + "\n"  + "Sub Product :"  + g1.toUpperCase() + "\n" +"Test Type :"+  g2.toUpperCase() + "\n"  +"Test Family :"  +  g3.toUpperCase() + "\n" +"Comments : "+  ct + "\n" + "Lot purpose :" + lotpurpose + "\n" + "Lot :" + lot + "\n" + "Wafer :" + wfr + "\n" + "Sampling " + samp + "\n" + "Metal " + metal + "\n"+ "Temperature : " + tempr + "\n" + "Attached file Name:" + "filename " + fout + "\n" + "Priority" + priority;
 String sqldata = "INSERT INTO msr_data_p(ticket_no,add_status,prod,tech,g1,g2,g3,comments,lotpurpose,lot,wafers,sampling,metal_layer,temp,login_id,fname,sdate,rdate,status,assignee,add_time,eemail,priority) values (seq_ticket_no_p.nextVal,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

           
         int r=0;
         try { 
        	  
           PreparedStatement statement_data = conn.prepareStatement(sqldata);
          // statement_data.setInt(1,1);
           String subDate = "" +  getCurrentJavaSqlDate();
           statement_data.setString(1,"added");
           statement_data.setString(2,prod);
           statement_data.setString(3,tech);
           statement_data.setString(4,g1);
           statement_data.setString(5,g2);
           statement_data.setString(6,g3);
           statement_data.setString(7,ct);
           statement_data.setString(8,lotpurpose);
           statement_data.setString(9,lot);
           statement_data.setString(10,wfr);
           statement_data.setString(11,samp);
           statement_data.setString(12,metal);
           statement_data.setString(13,tempr);
           statement_data.setString(14,login_id);
           statement_data.setString(15,fout);
           statement_data.setString(16,subDate);
           statement_data.setString(17,rdate);
           statement_data.setString(18,status);
           statement_data.setString(19,assignee);
           
           java.util.Date today = new java.util.Date();
           java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
           System.out.println(getCurrentJavaSqlTime() + "...what is it ..." + timestamp  );
           
           String str =  "" +  getCurrentJavaSqlDate() +  " " + getCurrentJavaSqlTime();
       
           System.out.println( "---- what is it----" + str);
          // to_timestamp('2003/12/13 10:13:18', 'YYYY/MM/DD HH:MI:SS')
     
          
      //   statement_data.setObject(20,getCurrentTimeStamp());
           
         statement_data.setString(20,str);
         statement_data.setString(21,eemail);
         statement_data.setString(22,priority);
         System.out.println("After binding " + statement_data);
           
          // statement_data.setInt(20,stp);
           // sends the statement to the database server
           // int row = statement.executeUpdate();
          // System.out.println("what is it ..." + statement_data);
          
         /////////////Suman for Alpha Testing . uncomment soon      
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
           ttt =  getTicketStr.trim();
           System.out.println("what is the ticket no " + getTicketStr + ttt);
          
            if (  r> 0) {
                message = "Success  :" + "\n" + fout;
            } else {
            	message = "Failed ?" +  "\n" ;
            	
            }
            
            System.out.println("This is the new Alpha Ticket Reference Begin");
            String alphaTick = generateAlpha(ttt);
            
            message_long += " \n" + " New Reference to Ticket Number = " + alphaTick + "\n";
            
           // doUpdateAlphaTicket(alphaTick, ttt);
            
            int ticketInt = Integer.valueOf(ttt).intValue();
            
            String sqldata_alphaticket = "INSERT INTO msr_alpha_ticket(alphaticket, ticketno) values (?,?)";

            
            int rr=0;
            try { 
           	  
              PreparedStatement statement_data_alphaticket = conn.prepareStatement(sqldata_alphaticket);
         
              statement_data_alphaticket.setString(1,alphaTick);
              statement_data_alphaticket.setInt(2, ticketInt);
              rr= statement_data_alphaticket.executeUpdate();
              
             } catch(Exception xx) { xx.printStackTrace();
             xx.getMessage();
             }
            
            
            System.out.println("Alpha Ticket Reference End " + alphaTick + " for "  + ttt );
            
        } catch (Exception ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally { 
            if (conn != null) {
                // closes the database connection
                try {
                	doRoll("added");
                   
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                
                
                try {
                	conn.close();
                   
                } catch (SQLException SQLex) {
                	SQLex.printStackTrace();
                }
                
            }
            
           
            // sets the message in request scope
            request.setAttribute("Message", message);
            request.setAttribute("message_long", message_long);
            //request.setAttribute("ticketno", ticketno);
            request.setAttribute("fout", fout);
            request.setAttribute("eemail", eemail);
            request.setAttribute("tt", ttt);
           // getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
            getServletContext().getRequestDispatcher("/mailjavax.jsp").forward(request, response);
           
        }
    }
  
    
    
    private static void doUpdateAlphaTicket (String ticketAlpha, String generateTick) {
		// TODO Auto-generated method stub
    	
    	
    	 String sqldata = "INSERT INTO msr_alpha_ticket(alphaticket, ticketno) values (?,?)";

         
         int rr=0;
         try { 
        	  
           PreparedStatement statement_data_alphaticket = conn.prepareStatement(sqldata);
      
           statement_data_alphaticket.setString(1,ticketAlpha);
           statement_data_alphaticket.setInt(1, Integer.valueOf(generateTick).intValue());
           rr= statement_data_alphaticket.executeUpdate();
           
          } catch(Exception xx) { xx.printStackTrace();
          xx.getMessage();
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
    
    public String doGetTicket()
    {
    	  System.out.println("Coming into doGetTicket");
    	 //String sqlStr ="Delete FROM msr_data Where add_status != '" + s + "'";
    	   String sqlString ="select ticket_no from msr_data_p where ticket_no=(select max(ticket_no) from msr_data_p)";
    	   String id  = "Error";
           int getTick = 0;
    	    try {
    	    	Statement stmt =conn.createStatement();;
    	    	ResultSet rs = stmt.executeQuery(sqlString);
    	    	rs.next();
    	    	System.out.println("doGetTicket B..");
    	    	getTick = rs.getInt(1);
    	    	 //while(rs.next()){
    	    		// id  = String.valueOf(rs.getInt("ticket_no")).toString();
    	    		// getTick = rs.getInt("ticket_no");
    	             System.out.println("Max Ticket -> " + getTick);
    	        
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
    
    
    public String doGetAlphaTicket(String ttt) throws SQLException
    {
    	  System.out.println("Coming into doAlpahGetTicket");
    	 //String sqlStr ="Delete FROM msr_data Where add_status != '" + s + "'";
    	  //select ticket_no from msr_data_p where ticket_no=(select max(ticket_no) from msr_data_p)
    	   int selectTicket = Integer.valueOf(ttt).intValue();
    	   String sqlString2 ="select distinct ticketno, alphaticket from msr_alpha_ticket where ticketno = " + "(select max(ticketno) from msr_alpha_ticket)";
    	   String aid  = "Error";
           String geAlphatTick = "";
    	    try {
    	    	conn2 = loadDriverSecond();
    	    	Statement stmt2 =conn2.createStatement();;
    	    	ResultSet rs2 = stmt2.executeQuery(sqlString2);
    	    	//rs2.next();
    	    	System.out.println("Coming into doAlpahGetTicket B..");
    	    	
    	    	while(rs2.next()){
    	    		
    	    		geAlphatTick = rs2.getString(2);
    	    
    	    		// id  = String.valueOf(rs.getInt("ticket_no")).toString();
    	    		// getTick = rs.getInt("ticket_no");
    	             System.out.println("getting" + geAlphatTick);
    	        
    	    	 }
    	    	 rs2.close();
                 aid = String.valueOf(geAlphatTick).toString();
    	    } catch (SQLException e) {
    	        System.out.println("getting - SQLException");
    	        e.printStackTrace();
    	        aid = "Error";
    	        if ( conn2 != null) {
    	        conn2.close();
    	        }
    	    }
    	 
    	    return aid;
    	
    	
    }
    
    
    
    
    private void doRoll(String s)
    {
    	
    	 //String sqlStr ="Delete FROM msr_data Where add_status != '" + s + "'";
    	String sqlStr ="Delete FROM msr_data_p Where add_status is NULL";

    	    try {
    	    
    	    	PreparedStatement statem = conn.prepareStatement(sqlStr);
    	    	statem.executeUpdate(sqlStr);
    	        System.out.println("deleting");

    	    } catch (SQLException e) {
    	        System.out.println("deleting - SQLException");
    	        e.printStackTrace();
    	    }
    	    
    	
    	
    }
    
    
  private String generateAlpha(String ttt) {
	    String newTicketAlpha = "";
        String startNum = "ERRR"; //get this from DB doGetAlphaTicket();
		try {
			startNum = doGetAlphaTicket(ttt);
	
		
		
		 //if ( !startNum.equalsIgnoreCase("ERRR") && startNum.length() == 4) {
		if ( !startNum.equalsIgnoreCase("ERRR") ) {
		int newNum = 0;
		String newNumStr = "";
		String numPart = startNum.substring(0, 3);
		String alphaPart = startNum.substring(3);
		String newAlphaPart = "";
		char c = alphaPart.charAt(0);
		
				
		System.out.println(numPart + "..." + alphaPart);
		
		int num = Integer.valueOf(numPart);
		

		System.out.println(newNum);
		
		if ( num == 999) {//reset
			
			newNum = 0;
			newNum++;
			c++;
			newAlphaPart = String.valueOf(c);
			
		} else {
			newNum = num + 1;
			newAlphaPart = alphaPart;
		}
		
		
		if ( newNum < 10) {
			
			newNumStr = "00" + newNum;
		} else if ( newNum > 10 && newNum < 99) {
			
			newNumStr = "0" + newNum;
		} else if ( newNum > 99) {
			
			newNumStr = String.valueOf(newNum).toString();
		}
		
		
		newTicketAlpha = newNumStr + newAlphaPart;
		
		System.out.println("This is the new TicketNoAlphabet " + newTicketAlpha);
		} else {
			
			newTicketAlpha = "ERRR";
			
		}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return newTicketAlpha;

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



