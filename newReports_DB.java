



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


@WebServlet("/newReports_DB")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB



public class newReports_DB extends HttpServlet {
	
    private static final String String = null;
	// database connection settings
	private static String dbURL = "jdbc:oracle:thin:@fc8oradm03.gfoundries.com:1521:f8tdd1";
	private static String dbUser = "f8tdtest";
	private static String dbPass = "f8tdtest";
	private static Connection conn; 

    
    public  newReports_DB() throws SQLException {
    	
    	loadDriver();
    	
    }
    public  Connection loadDriver() throws SQLException {

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

    	
    }	
    
    
  
public String selectTech () {
	
	
	
	
	
	return String;
	
}
}



