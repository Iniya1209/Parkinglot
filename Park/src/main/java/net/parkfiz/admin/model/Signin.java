package net.parkfiz.admin.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * Servlet implementation class Signin
 */
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con;
	static PreparedStatement ps;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail=request.getParameter("mail");
		String pass=request.getParameter("password");
		String name;
		con=GetConnection.getCon();
		name=AdminDAOImp.validate(mail, pass);
		if(name.equals("null")){
			response.sendRedirect("AdminLogin.jsp");
		}
		else{
			HttpSession session=request.getSession();
			session.setAttribute("mail", mail);
			response.sendRedirect("AdminMain.jsp");
			try {
				ps=con.prepareStatement("Select * from parking_lot where Mail = ?");
				ps.setString(1,mail);
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					session.setAttribute("id", rs.getInt("ParkID"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
