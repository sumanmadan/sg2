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


@WebServlet("/ticketLinkF")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class ticketLinkF extends HttpServlet {
     
	 // database connection settings
    private static String dbURL = "jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1";
    private static String dbUser = "f8tdtest";
    private static String dbPass = "f8tdtest";
    private static Connection conn; 
   String listAll = ""; 
 public  ticketLinkF() {
    	
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
    java.sql.ResultSet rs;

    s=null;
    rs=null;
    String ndd = "";
    response.setContentType("text/html");

    PrintWriter out = response.getWriter();
    out.println("<html>");
    out.println("<head><title>TSR search</title></head>");
    out.println("<body>");
    
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
     
     
     out.println("<center><h1>Your ticket :" + stp + "</h1>"); 
     out.println("<center><h3>Ticket Details : " + "</h3>"); 
        try {
            // connects to the database
        	
        	conn = loadDriver();
        	s = conn.createStatement();
        	String ss = "select * from msr_data_p where ticket_no= " + stp;
        	
        	String s1 ="select d.ticket_no,d.prod,d.tech,d.g1,d.g2,d.g3,d.comments,d.lotpurpose,d.lot,wafers,d.sampling,d.temp,d.login_id,d.fname,d.sdate,d.rdate,d.add_time,(aa.alll)full_list ";
        	s1 = s1 + " from msr_data_f d ";
        	s1 = s1 + "left join (SELECT ticket_no, "  ;
        	s1 = s1 + " rtrim((xmlagg(xmlelement(status, updated_time  || ':'  ||  status ||':'  || Assignee || ':' || comments || '#' ))))alll " ;
        	s1 = s1 + " FROM msr_assign_f group by ticket_no,comments) ";
        	s1 = s1 + "aa on aa.ticket_no=d.ticket_no ";
        	s1 = s1 + " where d.ticket_no = " + stp ;
        	//s1 = s1 + " where d.ticket_no = " + 282 ;
        	System.out.println("what is this " + s1);
        	rs = s.executeQuery(s1);
           
        	
    		out.println("<P ALIGN='center'><TABLE BORDER=1>");
    		out.println("<TR>");
        	
        	
        	while( rs.next() ){
        	   // String ticket = "Ticket " + rs.getString("d.ticket_no");
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
        		//String metal_layer = "Metal Layer :" + rs.getString("metal_layer")  + "\n";
        		String temp = "Temperature "  + rs.getString("temp") + "\n";
        		String login_id =" Login ID :" +  rs.getString("login_id") + "\n";
        		String Fname = "Attachment  :" +rs.getString("fname")  + "\n";
        		String sdate =" Submitted on :"  +  rs.getString("sdate")  + "\n";
        		String rdate= " Required on :" + rs.getString("rdate")  + "\n";
        		String add_time= "Record inserted time :" + rs.getString("add_time")  + "\n";
        		String ddd = rs.getString("full_list")  + "\n";
        		String dd  = ddd.replaceAll("<STATUS>", "\n") ;
        		dd = dd.replaceAll("#", "") ;
        		dd = dd.replaceAll("</STATUS>", "\n") ;
        		ndd = "Ticket Status :" + dd;
        		listAll =  pdt  + tech + g1 + g2 + g3 + comments + lotpurpose + lot  + wafers + sampling   + temp + login_id + Fname + sdate + rdate  + add_time ;
        		listAll = listAll.replace("\n", "<BR>");
        		out.println("<TD>" + listAll + "</TD>");
        		out.println("</TR>");
        	
        	
        		
        	}
        	out.println("</TABLE>");
        	out.println("<center><h2>Current: " + ndd + "</h2>"); 
        	
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

    
          
         
     
   
        System.out.println( listAll );
      
           
    
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



