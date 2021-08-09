package net.parkfiz.admin.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 * Servlet implementation class Update
 */
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con;
	static PreparedStatement ps;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		con=GetConnection.getCon();
		HttpSession session=request.getSession();
		int k=Integer.parseInt(session.getAttribute("id").toString());
System.out.print(k);
		try {
			String type=request.getParameter("name");
			String add1=request.getParameter("add1");
			String add2=request.getParameter("add2");
			int slots=Integer.parseInt(request.getParameter("slots"));
			String email=request.getParameter("email");
			String type1=request.getParameter("lot");
			String addr1=request.getParameter("addr1");
			String addr2=request.getParameter("addr2");
			int avail=Integer.parseInt(request.getParameter("avail"));
			String mail=request.getParameter("mail");
			if(type.equals("name")) {
				ps=con.prepareStatement("update parking_lot  SET Name = ?  where ParkID = ?");
				ps.setInt(2,k);
				ps.setString(1, type1);
		}
			if(email.equals("email")) {
				ps=con.prepareStatement("update parking_lot  SET Mail = ?   where ParkID = ?");
				ps.setInt(2,k);
				ps.setString(1, mail);
			}

			if(add1.equals("add1")) {
				ps=con.prepareStatement("update parking_lot  SET  Address_line= ?   where ParkID =?");
				ps.setInt(2,k);
				ps.setString(1, addr1);
			}

			if(add2.equals("add2")) {
				ps=con.prepareStatement("update parking_lot  SET Address_line2 = ?   where ParkID = ?");
				ps.setInt(2,k);
				ps.setString(1, addr2);
			}

			if(slots==Integer.parseInt(request.getParameter("slots"))) {
				ps=con.prepareStatement("update parking_lot  SET Slots = ?  where ParkID = ?");
				ps.setInt(2,k);
				ps.setInt(1, avail);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

