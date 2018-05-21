import java.sql.*;

import javax.servlet.*;




public class hitCount implements ServletContextListener
{
    ServletContext ctx;
    ServletContextEvent ctxe;
    Connection conn;
    Statement s;
    PreparedStatement ps;
    ResultSet rs;
    int counta;
    
   
 public void contextInitialized(ServletContextEvent sce) {
  try{
     
      Class.forName("oracle.jdbc.driver.OracleDriver");
     
      conn=DriverManager.getConnection("jdbc:oracle:thin:@fc8orad03.gfoundries.com:1521:f8tdd1","f8tdtest","f8tdtest");
      s=conn.createStatement();
      rs=s.executeQuery("select param_page_count from msr_hit");
        while(rs.next())
        {
            counta=rs.getInt(1);
           
        }
        
       ctx=sce.getServletContext();
       ctx.setAttribute("pcount", counta);
       counta++;
       ps=conn.prepareStatement("update msr_hit set param_page_count= " + counta);
       ps.executeUpdate();
       }catch(Exception e){ e.printStackTrace(); }
       
    }

   
 public void contextDestroyed(ServletContextEvent sce) {
    try
    {
      ctx=sce.getServletContext();
    
      System.out.println("codddd");
      
   
    
      System.out.println("2222..codddd");
      if (conn != null) {
          // closes the database connection
            
          
          try {
          	conn.close();
             
          } catch (SQLException SQLex) {
          	SQLex.printStackTrace();
          }
      }
      
      } catch(Exception e){ e.printStackTrace(); }
    }
    
}