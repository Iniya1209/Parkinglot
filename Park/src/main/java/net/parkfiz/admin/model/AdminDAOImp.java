package net.parkfiz.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class AdminDAOImp {
	static Connection con;
	static PreparedStatement ps;
	public static String validate(String mail,String password){  
		String name="null";  
		boolean status=false;
		try{  
			con=GetConnection.getCon();
			PreparedStatement ps=con.prepareStatement("select * from admin where mail=? and password=?");  
			ps.setString(1,mail);  
			ps.setString(2,password);  
			ResultSet rs=ps.executeQuery();
			status=rs.next(); 
			if(status){
				name=rs.getString("Holder");
			}
		}
		catch(Exception e){System.out.println(e);}  
			return name;  
		}  
}
