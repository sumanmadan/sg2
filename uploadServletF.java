



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
import java.sql.SQLException;
 
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


@WebServlet("/uploadServletF")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB



public class uploadServletF extends HttpServlet {
	
    // database connection settings
    private static String dbURL = "jdbc:mysql://localhost/test";
    private static String dbUser = "root";
    private static String dbPass = "";
    private static Connection conn; 
    String message = "";
    
    public  uploadServletF() {
    	
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
  
   	// String login_id = System.getenv("USERNAME");
   	// String login_id  =System.getProperty("user.name");
   	 
     String login_id_f= System.getProperty("user.home");
   	 String login_id = login_id_f.substring(login_id_f.lastIndexOf('\\') + 1);
   	 
   	 String rdate = request.getParameter("rdate");
   	 String prod = request.getParameter("pdt");
   	 String tech = request.getParameter("tech");
   	 String spdt = request.getParameter("spdt");
 	
 	
   	 String ffname="";
     String root=""; String last="";
     String fout = "No attachment";
     String sdate = "02052013";
     DateFormat df = new SimpleDateFormat("ddMMyyyy");
     Date date = new Date();
    
     String status = "Unassigned";
     String assignee = "None";
     
     String reqdate="";
     
  
     
     
     
     
     try {
    	 sdate = df.format(date);
       
         if ( rdate.length() == 0) {
        	 rdate = sdate;
        	 reqdate = rdate;
         } else {
         String[] tokens = rdate.split("-");
         String day = tokens[0];
         String month = tokens[1];
         String year = tokens[2];
         
          reqdate = day + month + year;
         }
       
         System.out.println("PDT"  + prod);
         System.out.println("TTecch"  + tech); 
    	 
    	 
    	 
    	 
    	 
    	 
     for( int jj=0; jj<funcWaferOptions.length; jj++) {
    	 wfr = wfr + "," + funcWaferOptions[jj];
	     System.out.println("bah bahvvvv:" + wfr);
     }
     } catch (Exception xxxx) { xxxx.getMessage();}
    System.out.println("bah   "  + wfr)   ;
	String printt ="For your data : " + "\n" + login_id  + "\n"  + g1 + "\n" + g2 + "\n"  + g3 + "\n" + ct + "\n" + lp + "\n" + lot + "\n" + wfr + "\n" + samp + "\n" + tempr + "\n" + "ticketno" + "tick" +   "\n" + "filename " + ffname;
   	 
     System.out.println("sdfsdf"  + printt)   ;
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
            	root = "c:\\file_uploads\\";
            	last = ffname.substring(ffname.lastIndexOf('\\') + 1);
                fout = root + login_id + "_" + "ticket#" + "tick" + "_" +  last;
                
            }
            System.out.println("ffname :" +  fout);
            // constructs SQL statement
          // String sql = " update msr_ticket set fname = ? where ticket_no= ? ";
//String sqldata = "INSERT INTO msr_data (ticket_no,prod,tech,g1,g2,g3,comment,lotpurpose,lot,wafers,sampling,temp,login_id,fname,sdate,rdate,status,assignee) values (null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
String sqldata = "INSERT INTO msr_data(add_status,prod,spdt,tech,g1,g2,g3,comment,lotpurpose,lot,wafers,sampling,metal_layer,temp,login_id,fname,sdate,rdate,status,assignee) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";          
//String sqldata=" update msr_data set add_status = ?,prod = ?,tech =?, g1=?, g2=?, g3=?, comment=?, lotpurpose=?, lot=?, wafers=?, sampling=?, temp=?, login_id=?, fname=?, sdate=?, rdate=?, status=?, assignee=? where ticket_no=? ";
     
         //  PreparedStatement statement = conn.prepareStatement(sql);
         //  statement.setString(1, fout);
         //  statement.setInt(2,stp);
        conn = loadDriver();
       
         int r=0;
         try { 
           
         PreparedStatement statement_data = conn.prepareStatement(sqldata);
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
         statement_data.setString(17,sdate);
         statement_data.setString(18,reqdate);
         statement_data.setString(19,status);
         statement_data.setString(20,assignee);
           // sends the statement to the database server
           // int row = statement.executeUpdate();
 
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
            request.setAttribute("ticketno", "ticketno");
            
            getServletContext().getRequestDispatcher("/messageF.jsp").forward(request, response);
        }
    }
    
    
    private void doRoll(String s)
    {
    	
    	 //String sqlStr ="Delete FROM msr_data Where add_status != '" + s + "'";
    	String sqlStr ="Delete FROM msr_data Where add_status is NULL";

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



