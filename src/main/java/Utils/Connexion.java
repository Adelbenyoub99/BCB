package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {
    public static Connection ConnectBdd() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded");

            String url = "jdbc:mysql://localhost:3306/bcb?characterEncoding=UTF-8";
            String user = "root";
            String password = "";

            Connection connection = DriverManager.getConnection(url, user, password);
            
            if (connection != null) {
                System.out.println("Connection succeeded");
            } else {
                System.out.println("Connection is null. Check your configuration.");
            }

            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Connection failed");
            e.printStackTrace();
            return null;
        }
    }
}
