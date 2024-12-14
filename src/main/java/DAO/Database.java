package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static String dbUrl = "jdbc:mysql://localhost:3306/hotel1?useSSL = false";
    private static String dbUname = "root";
    private static String dbPassword = "Thanhan@2004";
    private static String dbDriver = "com.mysql.cj.jdbc.Driver";

    public static void loadDriver()
    {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static Connection getConnection()
    {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;
    }
}
