package net.parkfiz.registration.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerDAOImp cd=new CustomerDAOImp();
		String mail=request.getParameter("mail");
		String pass=request.getParameter("password");
		String type=request.getParameter("submit");
		Customer c=new Customer();
		if(type.equals("Login")) {
			String name;
			name=CustomerDAOImp.validate(mail, pass);
			if(name.equals("null")){
				response.sendRedirect("Login.jsp");
			}
			else{
				HttpSession session=request.getSession();
				session.setAttribute("name", name);
				session.setAttribute("mail", mail);
				response.sendRedirect("Welcome.jsp");
			}
		}
		else if(type.equals("Signup")) {
			c.setName(request.getParameter("name"));
			c.setEmail(mail);
			c.setPhone(request.getParameter("phone"));
			c.setPassword(pass);
			cd.insertCustomer(c);
			response.sendRedirect("index.html");
		}
	}

}
