




import java.util.Enumeration;
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
import java.sql.SQLException;
 
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


@WebServlet("/QueryStringD_P")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class QueryStringD_P extends HttpServlet {
     
	 // database connection settings
    private static String dbURL = "jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1";
    private static String dbUser = "f8tdtest";
    private static String dbPass = "f8tdtest";
    private static Connection conn; 
   String listAll = ""; 
 public  QueryStringD_P() {
    	
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
     
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
    String message = "";
    String message_long = "";

    java.sql.Statement s;
    java.sql.Statement s1;
    java.sql.ResultSet rs;
    java.sql.ResultSet rs1;

    s=null;
    rs=null;
    
    s1=null;
    rs1=null;
    
    response.setContentType("text/plain");
    // PrintWriter out = res.getWriter();

     System.out.println("Query String:");
     System.out.println(request.getQueryString());
     System.out.println();

     System.out.println("Request Parameters:");
     String stp = "";
     Enumeration e = request.getParameterNames();
     while (e.hasMoreElements()) {
       String name = (String) e.nextElement();
       String values[] = request.getParameterValues(name);
       if (values != null) {
         for (int i = 0; i < values.length; i++) {
           System.out.println(name + " (" + i + "): " + values[i]);
           stp = values[i].toString();
         }
       }
     }
     
     
     /*  id=select%20*%20from%20msr_data_p%20where%20ticket_no=9998 * id (0): select * from msr_data_p where ticket_no=9998 
      *     * /
      */
     
        String ticket_no = stp.split("=")[1];
        String stp1 = "SELECT (SELECT alphaticket FROM msr_alpha_ticket WHERE ticketno = " + ticket_no + " )  AS aid FROM DUAL ";
        System.out.println("New alpha query " + stp1 );
        
        try {
            // connects to the database
        	
        	conn = loadDriver();
        	s = conn.createStatement();
        	rs = s.executeQuery(stp);
        	String Referencetno = "NONE Reference No";
        	while( rs.next() ){
        	
        		String tno = "Ticket No :" + rs.getString("ticket_no") + "\n" ;
        		String pdt = "Product :" + rs.getString("prod") + "\n";
        		String tech = "Tech :" + rs.getString("tech") + "\n";
        		String g1 = "***** : " + rs.getString("g1") + "\n" ;
        		String g2 = "***** : " + rs.getString("g2") + "\n";
        		String g3 = "***** : " + rs.getString("g3") + "\n" ;
        		String comments = "Comments : " + rs.getString("comments")  + "\n" ;
        		String lotpurpose = "Lot Purpose : " + rs.getString("lotpurpose")   + "\n";
        		String lot="Lot :" +  rs.getString("lot") + "\n" ;
        		String wafers= "Wafers  :" + rs.getString("wafers")  + "\n";
        		String sampling = "Sampling : " + rs.getString("sampling")  + "\n";
        		String metal_layer = "Metal Layer :" + rs.getString("metal_layer")  + "\n";
        		String temp = "Temperature "  + rs.getString("temp") + "\n";
        		String login_id =" Login ID :" +  rs.getString("login_id") + "\n";
        		String Fname = "Attachment  :" +rs.getString("fname")  + "\n";
        		String sdate =" Submitted on :"  +  rs.getString("sdate")  + "\n";
        		String rdate= " Required on :" + rs.getString("rdate")  + "\n";
        		String add_time= "Record inserted time :" + rs.getString("add_time")  + "\n";
        		
        		
        		listAll = tno + pdt  + tech + g1 + g2 + g3 + comments + lotpurpose + lot + wafers + sampling  + metal_layer + temp + login_id + Fname + sdate + rdate  + add_time ;
        	}
        	
        	
        	s1 = conn.createStatement();
        	rs1 = s1.executeQuery(stp1);
        	while( rs1.next() ){
        		
        		 Referencetno = " Reference Ticket No :" + rs1.getString(1) + "\n" ;
        	}
        	
        	listAll +=  Referencetno; 
           System.out.println("Done!");
             
        } catch (Exception ee) {
            		ee.printStackTrace();
            	} finally {
            		
            		
            		if (conn != null) {
            			try {
            				// outputStream.flush();
            				conn.close();
            			} catch (Exception ex) {
            				ex.printStackTrace();
            			}
             
            		}
            	}

    
          
         
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
    	//out.println("<html><head>");
       // out.println("<title>Details from Server</title>");
       // out.println("</head>");
       // out.println("<body>");
        out.println( listAll );
       // out.println("</body>");
       // out.println("</html>"); 
          
           
    
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



