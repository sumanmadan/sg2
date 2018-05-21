




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


@WebServlet("/uploadServlet_DB")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class uploadServlet_DB extends HttpServlet {
     
	 // database connection settings
    private static String dbURL = "jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1";
    private static String dbUser = "f8tdtest";
    private static String dbPass = "f8tdtest";
    private static Connection conn; 
 
 public  uploadServlet_DB() {
    	
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
        // gets values of text fields
    String message = "";
    String message_long = "";
    String ttt="";
    String getTicketStr="";
    String g1 = "Parametric";
    // String g1=request.getParameter("group1");
   	 String g2 = request.getParameter("group2");
   	 String g3 = request.getParameter("group3");
   	 String ct = request.getParameter("comment");
   	 String lotpurpose=request.getParameter("lotpurpose");
   	 String lot = request.getParameter("lot");
   	 //String wfr= request.getParameter("wafers");
   	 //String samp=request.getParameter("sampling");
   	 String metal = request.getParameter("metal");
  	// String tempr =request.getParameter("temp");
   	String samp="none";
   	String tempr = "none";
   	String eemail = request.getParameter("eemail");
   	 //String ticketno = request.getParameter("ticketno");
  	 String ticketno = "tick";
   	// String login_id = System.getenv("USERNAME");
  	 String login_id = request.getParameter("lloginn");
   	// String login_id  =System.getProperty("user.name");
   	 //String login_id = request.getRemoteUser();
   	 //String login_id_f= System.getProperty("user.home");
   	 
   	 //String login_id = login_id_f.substring(login_id_f.lastIndexOf('\\') + 1);
   	 String rdate = request.getParameter("rdate");
   	 String prod = request.getParameter("pdt");
   	 String tech = request.getParameter("tech");
   	 String spdt = "none";
     String[] funcWaferOptions = request.getParameterValues("c1[]");
     String printt="";
     String wfr = "";
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
     /*String sdate = "02052013";
     DateFormat df = new SimpleDateFormat("ddMMyyyy");
     Date date = new Date();
     sdate = df.format(date);
     String reqdate="";
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
     String status = "Unassigned";
     String assignee = "None";
     System.out.println("PDT"  + prod);
     System.out.println("Tech"  + tech);
   	// String printt ="New Request : " + "\n" + login_id  + "\n"  + g1 + "\n" + g2 + "\n"  + g3 + "\n" + ct + "\n" + lp + "\n" + lot + "\n" + wfr + "\n" + samp + "\n" + metal + "\n"+ tempr + "\n" +    "\n" + "filename " + ffname;
     
     //String printt ="New Request : " + "\n" + "Submitted by :" + login_id  + "\n"  +"** :" + g1 + "\n" +"** :"+  g2 + "\n"  +"** :"+  g3 + "\n" +"Comments : "+  ct + "\n" + "Lot purpose :" + lp + "\n" + "Lot :" + lot + "\n" + "Wafer :" + wfr + "\n" + "Sampling " + samp + "\n" + "Metal " + metal + "\n"+ "Temperature : " + tempr + "\n" + "Attached file Name:" + "filename " + ffname;
   	 
     //System.out.println("sdfsdf"  + printt)   ;
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
            // constructs SQL statement
          // String sql = " update msr_ticket set fname = ? where ticket_no= ? ";
            
// printt ="New Request : " + "\n" + "Submitted by :" + login_id  + "\n" + "Technology :" + tech + "\n" + "Product : " + prod + "\n"  + "Sub Prodcut :"  +"** :" + g1 + "\n" +"** :"+  g2 + "\n"  +"** :"+  g3 + "\n" +"Comments : "+  ct + "\n" + "Lot purpose :" + lotpurpose + "\n" + "Lot :" + lot + "\n" + "Wafer :" + wfr + "\n" + "Sampling " + samp + "\n" + "Metal " + metal + "\n"+ "Temperature : " + tempr + "\n" + "Attached file Name:" + "filename " + fout;         
 printt ="New Request : " + "\n" + "Submitted by :" + login_id  + "\n" + "Technology :" + tech + "\n" + "Product : " + prod + "\n"  + "Sub Product :"  + g1.toUpperCase() + "\n" +"Test Type :"+  g2.toUpperCase() + "\n"  +"Test Family :"  +  g3.toUpperCase() + "\n" +"Comments : "+  ct + "\n" + "Lot purpose :" + lotpurpose + "\n" + "Lot :" + lot + "\n" + "Wafer :" + wfr + "\n" + "Sampling " + samp + "\n" + "Metal " + metal + "\n"+ "Temperature : " + tempr + "\n" + "Attached file Name:" + "filename " + fout;
 String sqldata = "INSERT INTO msr_data_p(ticket_no,add_status,prod,tech,g1,g2,g3,comments,lotpurpose,lot,wafers,sampling,metal_layer,temp,login_id,fname,sdate,rdate,status,assignee,add_time,eemail) values (seq_ticket_no_p.nextVal,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
// String sqldata = "INSERT INTO msr_data_p(ticket_no,add_status,prod,tech,g1,g2,g3,comments,lotpurpose,lot,wafers,sampling,metal_layer,temp,login_id,fname,sdate,rdate,status,assignee,add_time) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
           
         //String sqldata=" update msr_data set add_status = ?, prod = ?,tech =?, g1=?, g2=?, g3=?, comment=?, lotpurpose=?, lot=?, wafers=?, sampling=?,metal_layer=?, temp=?, login_id=?, fname=?, sdate=?, rdate=?, status=?, assignee=? where ticket_no=? ";
         //int stp = Integer.parseInt(ticketno);
         //  PreparedStatement statement = conn.prepareStatement(sql);
         //  statement.setString(1, fout);
         //  statement.setInt(2,stp);
           
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
         System.out.println("After binding " + statement_data);
           
          // statement_data.setInt(20,stp);
           // sends the statement to the database server
           // int row = statement.executeUpdate();
          // System.out.println("what is it ..." + statement_data);
          
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



