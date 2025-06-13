package DB;

import java.sql.*;

public class DBConnection {

    private static final String DB_URL = "jdbc:mysql://localhost:3307/guarddb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "admin";

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}
