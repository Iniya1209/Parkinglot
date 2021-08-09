package net.parkfiz.registration.model;
import java.sql.Connection;
import java.sql.DriverManager;
public class GetConnection{
	static Connection con=null;
	static String username="root";
	static String pwd="qwerty";
	static String URL="jdbc:mysql://localhost:3306/parking";
	public static Connection getCon(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(URL,username,pwd);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
}