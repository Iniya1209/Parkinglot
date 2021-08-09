package net.parkfiz.registration.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class CustomerDAOImp{
	static Connection con;
	static PreparedStatement ps;
	public int insertCustomer(Customer c) {
		int status=0;
		try {
			con=GetConnection.getCon();
			ps=con.prepareStatement("insert into customer values(?,?,?,?)");
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhone());
			ps.setString(4, c.getPassword());
			status=ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static String validate(String mail,String password){  
		String name="null";  
		boolean status=false;
		try{  
			con=GetConnection.getCon();
			PreparedStatement ps=con.prepareStatement("select * from customer where email=? and password=?");  
			ps.setString(1,mail);  
			ps.setString(2,password);  
			ResultSet rs=ps.executeQuery();
			status=rs.next(); 
			if(status){
				name=rs.getString(1);
			}
		}
		catch(Exception e){System.out.println(e);}  
			return name;  
		}  
}
