package transfer;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static String url = "jdbc:mysql://localhost:3306/uplift";
	private static String username ="root";
	private static String password = "Nmhs1055330+";
	private static Connection con;
	
	//Database connectivity method
	public static Connection getConnection() {
		
		try {
			
			//Create Drive
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e) {
			System.out.println("Database connection is not success...");
		}
		
		return con;
	}
}