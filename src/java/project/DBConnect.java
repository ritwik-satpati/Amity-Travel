package project;

import java.sql.*;

public class DBConnect {
    public static Connection getCon() {
        try {
            String connectionURL = "jdbc:mysql://127.0.0.1:3306/travel";
            String dbUser = "root";
            String dbPass = "admin";
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPass);            
            return conn;
        } 
        catch(ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) {
            System.out.println("Unable to connect to database: "+e);
            return null;
        }
    }
}
