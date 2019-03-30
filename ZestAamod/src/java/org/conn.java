package org;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author oZAs
 */
public class conn {

    static private Connection c = null;
    
    public static Connection connect(String username, String pass) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/zest", username, pass);

        } 
        catch (ClassNotFoundException | SQLException e) {
        }
        return c;

    }
    public static boolean close(Connection con){
        try {
            if(con!=null)
            {
            con.close();
            }
            return true;
        } 
        catch (Exception e) {
        return false;
        }
        
    }
    
}
