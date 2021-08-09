package net.parkfiz.admin.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Unactive
 */
public class Unactive extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con;
	static PreparedStatement ps;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mail=request.getParameter("submit");
		con=GetConnection.getCon();
		try {
			ps=con.prepareStatement("update transactions set Status='Inactive' where mail=?");
			ps.setString(1, mail);
			ps.executeUpdate();
			response.sendRedirect("AdminMain");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
