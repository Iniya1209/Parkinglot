package net.parkfiz.registration.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.parkfiz.admin.model.GetConnection;

/**
 * Servlet implementation class Addtransaction
 */
public class Addtransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con;
	static PreparedStatement ps;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		con=GetConnection.getCon();
		int id=Integer.parseInt(request.getParameter("submit"));
		String mail=request.getParameter("mail");
		String sd=request.getParameter("date1");
		String st=request.getParameter("time1");
		String ed =request.getParameter("date2");
		String et=request.getParameter("time2");
		try {
			ps=con.prepareStatement("insert into transactions values(?,?,?,?,?,?,?,?)");
			ps.setString(1, mail);
			ps.setInt(2, id);
			ps.setInt(3, 60);
			ps.setString(4, sd);
			ps.setString(5, st);
			ps.setString(6, ed);
			ps.setString(7, et);
			ps.setString(8, "Active");
			ps.executeUpdate();
			con.close();
			response.sendRedirect("Success.jsp");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
