
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import java.util.List;

import java.util.Properties;

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

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/updateServletD")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class updateServletD extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost/test";
    private String dbUser = "root";
    private String dbPass = "";
    String message ="";
    
    Connection conn = null; // connection to the database
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
    	String status="";
        String assignee=""; 
        int ticket_no=0;
    	response.setContentType("text/plain");
    	    PrintWriter out = response.getWriter();
    	    out.println("a" + request.getParameter("ssq"));
    	    out.println("<html><head>");
            out.println("<title>Servlet Parameter</title>");
            out.println("</head>");
            out.println("<body>");
            Enumeration parameters = request.getParameterNames();
            String param=null;
                while (parameters.hasMoreElements())
                {
                      param=(String)parameters.nextElement();                  
                      out.println(param + ":" + request.getParameter(param) + "<br>" );                  
                }
           out.println("</body></html>");
     
           Map<String, String[]> map = request.getParameterMap();
      
           response.setContentType("text/html");
    
           out.print("<html><body>");
           out.print("<h1> Your Order...</h1>");
           out.println("<table border=\"1\" cellpadding = \"5\"" +
                   " cellspacing = \"5\">");
           out.println("<tr> <th>Parameter Name</th>" +
                   "<th>Parameter Value</th></tr>");
           Set set = map.entrySet();
           Iterator it = set.iterator();
           while (it.hasNext()) {
               Map.Entry<String, String[]> entry =
                   (Entry<String, String[]>) it.next();
               String paramName = entry.getKey();
               out.print("<tr><td>" + paramName + "</td><td>");
               String[] paramValues = entry.getValue();
               if (paramValues.length == 1) {
                   String paramValue = paramValues[0];
                   if (paramValue.length() == 0)
                       out.println("<b>No Value</b>");
                   else
                       out.println(paramValue);
               } else {
                   out.println("<ul>");
                   for (int i = 0; i < paramValues.length; i++) {
                       out.println("<li>" + paramValues[i] + "</li>");
                   }
                   out.println("</ul>");
               }
               out.print("</td></tr>");
           }
           out.println("</table></body></html>") ;
    	    
           
           
           
           
    	    Connection con = null;
    	    PreparedStatement stmt = null;
    	
    	    List<Integer> t = new ArrayList<Integer>();
            List<String> a = new ArrayList<String>();
    	   
            List<String> b = new ArrayList<String>();
    	
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
                         out.print("bbbbb " + paramName);
                        
                         if ( paramName.matches("category")) {
                        	  paramValues = entry.getValue();
                        	  //out.println("sdf" + "\n");
                         for (int i = 0; i < paramValues.length; i++) {
                        	       out.print("ccccc  --" + paramValues[i]);
                               	   a.add(paramValues[i]);
                            	 
                               } 
                         } 
                         
                         
                           if (paramName.matches("ticckk" )) {
                        	   paramValues = entry.getValue();
                        	  // out.println("hhsdf");
                        	   for (int i = 0; i < paramValues.length; i++) {
                            	   ticket_no = Integer.parseInt(paramValues[i]);
                            	   t.add(ticket_no);
                        	   }
                            }
                               
                             if (paramName.matches( "sstatus" )) {
                            	   paramValues = entry.getValue();
                            	   //out.println("iisdf");
                            	   for (int i = 0; i < paramValues.length; i++) {
                            		 out.print("status  --" + paramValues[i]);
                            		 status = paramValues[i];
                            	     b.add(paramValues[i]);
                            	   }
                               }
    	            }
               
    	      
    	      try{
    	           for ( int j = 0; j < b.size();j++)
    	           {
    	        	    
    	        	     assignee = a.get(j).toString();
    	        	     status = b.get(j).toString();
    	        	     ticket_no = Integer.parseInt(t.get(j).toString());
    	                 out.println("For " + assignee + ticket_no + status + "\n"  );
                         String st= "";
                         st = "UPDATE msr_data SET status=?" + ", assignee = ? " + "where ticket_no=?" ;
                         stmt = con.prepareStatement(st);
                         stmt.setString(1,status);
                         stmt.setString(2,assignee);
                         stmt.setInt(3,ticket_no);
                         int n = stmt.executeUpdate();
                        
                         out.println(assignee + " " + status + " " + ticket_no + " " + "Order successful!..." + n + "\n" );
                        
    	           }    
    	           con.commit();
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
    	     out.println("Order failed. Please contact technical support" + e.getLocalizedMessage());
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
    	
    	
     
    }
    
    
   
    
}



