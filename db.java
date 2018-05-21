import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

 
/**
 * Database object 
 */
public class db {

    private static Connection con;
    private static final String Driver = "oracle.jdbc.OracleDriver";
    private static final String ConnectionString = "fc8whp1:1521/saphp1.gfoundries.com";
    private static final String user = "N1004008";
    private static final String pwd = "ridgewood10";

    public db() {

    }

    
    
  
   

    /**

     * to load the database base driver

     * @return a database connection

     * @throws SQLException throws an exception if an error occurs

     */
    public static Connection loadDriver() throws SQLException {

        try {

            Class.forName(Driver);

        } catch (ClassNotFoundException ex) {

          System.out.println(ex.getMessage());

        }

        con = DriverManager.getConnection(ConnectionString, user, pwd);

        return con;

    }

 

    /**

     * to get a result set of a query

     * @param query custom query

     * @return a result set of custom query

     * @throws SQLException throws an exception if an error occurs

     */

    public static ResultSet getResultSet(String query) throws SQLException {

        Connection con = loadDriver();

        ResultSet rs;

        PreparedStatement st = con.prepareStatement(query);

        rs = st.executeQuery();



        return rs;

    }

 

    /**

     * to run an update query such as update, delete

     * @param query custom query

     * @throws SQLException throws an exception if an error occurs

     */

    public static void runQuery(String query) throws SQLException {

        Connection con = loadDriver();

        ResultSet rs;

        PreparedStatement st = con.prepareStatement(query);

        st.executeUpdate();

    }

}