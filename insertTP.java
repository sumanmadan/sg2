import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.io.*;
public class insertTP {

	/**
	 * @param args
	 */
	

		  public static Connection loadDriver() throws SQLException
		  {
		    String dbURL = "jdbc:mysql://localhost/test";
		    String dbUser = "root";
		    String dbPass = "";
		    Connection conn; 
		   
		    try {

	        	 DriverManager.registerDriver(new com.mysql.jdbc.Driver());

	        } catch (Exception ex) {

	          System.out.println(ex.getMessage());

	        }

	        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

	        return conn;

	    }
		    
		    
		    


	 public static void main(String[] args) throws Exception {
		 
		 
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    FileReader fr ;
		    BufferedReader br = null;
		    try {
		      conn = loadDriver();
		      String query = "insert into msr_techprd(tech, product) values(?, ?)";
		      pstmt = conn.prepareStatement(query); // create a statement
		      File f = new File("C:\\yp\\tp.csv");
		      fr = new FileReader(f);
		      br = new BufferedReader(fr);
		      String t = "";
		      String p = "";
		      
		      String eachLine = br.readLine();
             try {
		      while (eachLine != null) {
		    	  System.out.println("eac" + eachLine);
		    	  String parts[] = eachLine.split(",");
		    	 
		    	  t = parts[1].trim();
		    	  p = parts[2].trim();
		    	  System.out.println("p" + p);
		    	  System.out.println("T" + t);
		    	  pstmt.setString(1,t); // set input parameter 1
			      pstmt.setString(2,p); // set input parameter 2
		          pstmt.addBatch();
		     }
		      
             }catch ( Exception x) {x.printStackTrace();}
		     
		      int count[] = pstmt.executeBatch();

	         
		   
		      
		    } catch (Exception e) {
		      e.printStackTrace();
		    } finally {
		      pstmt.close();
		      conn.close();
		      br.close();
		    }
		  }
	
		
}


